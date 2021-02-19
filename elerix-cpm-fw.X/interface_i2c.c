#include "interface_i2c.h"
#include <xc.h>
#include <string.h>
#include "output_pins.h"
#include "eeprom_regs.h"


#define I2C_DEVADDR           0x2A
u8_t WR_I2C_DEVADDR = I2C_DEVADDR << 1;
u8_t RD_I2C_DEVADDR = (I2C_DEVADDR << 1) | 0x01;


#define   I2C_WAITING        0
#define   I2C_START_DETECTED 1
#define   I2C_STOP_DETECTED  2
#define   I2C_READ           3
#define   I2C_WRITE          4

#define   I2C_TIMEOUT  5
#define   I2C_ADDR_MISMATCH  0xFF


#define Lob(param) ((char *)&param)[0]
#define Hib(param) ((char *)&param)[1]


#define wrregfrom 21

u16_t timeout = 0;

u8_t i2cdatasekvence = 0;
u8_t i2cstatus = 0;
u8_t retval = 0;
u8_t bitcnt = 0;

u8_t tempSDA = 0;

u8_t en_sda = 0;
u8_t I2CWRITEFLAG = 0;
u8_t REGPOINTER = 0;

u8_t *VALBYTE = NULL;

u8_t I2CVAL = 0;
u8_t I2CREGID = 0;
u16_t I2CREGVAL = 0;
u8_t REGCHK = 0;

u8_t CHK1 = 0;
u8_t CHK2 = 0;


u32_t WEBPOTMINtimeout = 0;
u32_t WEBPOTMAXtimeout = 0;

u8_t UMIN_WR = 0;
u8_t UMAX_WR = 0;



u16_t CPMREGDATA[maxreg];
u16_t TEMPCPMREGDATA[maxreg];

u16_t GetCPMREG(u16_t addr)
{
    return CPMREGDATA[addr];
}

void SetCPMREG(u16_t addr, u16_t val)
{
    CPMREGDATA[addr] = val;
}

void CheckU_WR(u32_t timeticks)
{
    if(UMIN_WR) 
    {
        WEBPOTMINtimeout = timeticks + 600;
        UMIN_WR = 0;
    }

    if (CPMREGDATA[I2C_RUMINPOT] != 0xFFFF) 
    {
        if (timeticks > WEBPOTMINtimeout) 
        {
            CPMREGDATA[I2C_RUMINPOT] = 0xFFFF;
        }
    }

    if (UMAX_WR) 
    {
        WEBPOTMAXtimeout = timeticks + 600;
        UMAX_WR = 0;
    }

    if (CPMREGDATA[I2C_RUMAXPOT] != 0xFFFF) 
    {
        if (timeticks > WEBPOTMAXtimeout) 
        {
            CPMREGDATA[I2C_RUMAXPOT] = 0xFFFF;
        }
    }

}

void I2C1_Initialize(void) 
{
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;

    IOCCFbits.IOCCF4 = 0;
    IOCCNbits.IOCCN4 = 1;

    IOCCFbits.IOCCF3 = 0;
    PIR0bits.IOCIF = 0;
    PIE0bits.IOCIE = 1;
    
    memset(CPMREGDATA, 0xFF, maxreg * 2);
  
    u8_t LD = EepromEventCellID();
    
    if ((LD > 0) && (LD < 17)) 
    {
        CPMREGDATA[I2C_IDEVCELL] = (u16_t) (LD);        
        CPMREGDATA[I2C_CELLV] = EepromEventCellVoltage();        
        CPMREGDATA[I2C_IDTYPE] = EepromEventType();        
        CPMREGDATA[I2C_EVTOTALV] = EepromEventTotalCellVoltage();
    }
    
    memcpy(TEMPCPMREGDATA, CPMREGDATA, maxreg * 2);    
}

void wait_for_SCL(void) 
{
    timeout = 0x00FF;
    while (SCL) 
    {
        if (!timeout) 
        {
            TRISCbits.TRISC4 = 1;
            IOCCNbits.IOCCN4 = 1;
            return;
        } 
        else 
            timeout--;
    }
}

void send_ACK(void) 
{
    TRISCbits.TRISC4 = 0;
    LATCbits.LATC4 = 0;
    wait_for_SCL();
    TRISCbits.TRISC4 = 1;

}


void interruptI2C1(void)
{
   if (PIR0bits.IOCIF) 
   {
        PIR0bits.IOCIF = 0;

        if (IOCCFbits.IOCCF4) 
        {
            IOCCFbits.IOCCF4 = 0;
            
            if (SCL) 
            {
                IOCCNbits.IOCCN4 = 0;
                timeout = 0x00FF;
                while (SCL) 
                {
                    if (timeout) 
                        timeout--;
                    else 
                    {
                        i2cstatus = I2C_WAITING;
                        IOCCPbits.IOCCP3 = 0;
                        IOCCNbits.IOCCN4 = 1;
                        return;
                    }
                }

                i2cstatus = I2C_START_DETECTED;
                IOCCPbits.IOCCP3 = 1;
                retval = 0;
                bitcnt = 0;
                i2cdatasekvence = 0;
                I2CWRITEFLAG = 0;
            }
            return;
        }
        
        if (IOCCFbits.IOCCF3) 
        {
            IOCCPbits.IOCCP3 = 0;
            IOCCFbits.IOCCF3 = 0;
            tempSDA = SDA;

            if (i2cstatus == I2C_START_DETECTED) 
            {
                if (!i2cdatasekvence) 
                {
                    if (bitcnt < 8) 
                    {
                        retval = (retval << 1) | SDA;
                        bitcnt++;
                    } else if (bitcnt == 8) {
                        en_sda = 1;
                        if (retval == WR_I2C_DEVADDR) 
                        {
                            send_ACK();
                            if (IOCCNbits.IOCCN4 == 0) 
                            {
                                IOCCPbits.IOCCP3 = 1;
                            }
                            
                            i2cdatasekvence = 1;
                            i2cstatus = I2C_WRITE;
                            en_sda = 0;
                            
                        } else if (retval == RD_I2C_DEVADDR) {
                            send_ACK();
                            if (IOCCNbits.IOCCN4 == 0) 
                            {
                                IOCCPbits.IOCCP3 = 1;
                            }
                            
                            i2cdatasekvence = 1;
                            i2cstatus = I2C_READ;
                            en_sda = 0;
                        }
                        bitcnt = 0;
                        
                        if (retval == RD_I2C_DEVADDR) 
                        {
                            memcpy(TEMPCPMREGDATA, CPMREGDATA, maxreg * 2);
                                                                                    
                            VALBYTE = (u8_t*) &TEMPCPMREGDATA[I2CREGID];
                            I2CVAL = *VALBYTE;
                            REGPOINTER = 0;
                            REGCHK = I2CVAL;
                        }
                        
                        retval = 0;
                        if (en_sda) 
                            IOCCNbits.IOCCN4 = 1;
                        
                        return;
                    }
                }
            } else if (i2cstatus == I2C_READ) {

                if (bitcnt < 8) {
                    bitcnt++;
                    if (I2CVAL & 0x80) 
                    {
                        TRISCbits.TRISC4 = 1;
                    } else {
                        TRISCbits.TRISC4 = 0;
                        LATCbits.LATC4 = 0;
                    }
                    wait_for_SCL();
                    I2CVAL = I2CVAL << 1;

                    if (IOCCNbits.IOCCN4 == 0) 
                    {
                        IOCCPbits.IOCCP3 = 1;
                    } else TRISCbits.TRISC4 = 1;


                } else if (bitcnt == 8) {
                    TRISCbits.TRISC4 = 1;
                    bitcnt = 0;
                    if (SDA) {
                        IOCCPbits.IOCCP4 = 1;
                    } else {
                        REGPOINTER++;
                        if (REGPOINTER == 2) {
                            REGPOINTER = 0;
                            I2CVAL = REGCHK;
                            REGCHK = 0;
                        } else {
                            VALBYTE++;
                            I2CVAL = *VALBYTE;
                            REGCHK = REGCHK^I2CVAL;
                        }

                        IOCCPbits.IOCCP3 = 1;
                    }
                }
                return;
            } 
            else if (i2cstatus == I2C_WRITE) 
                {
                    if (bitcnt < 8) 
                    {
                        retval = (retval << 1) | SDA;
                        bitcnt++;
                    } 
                    else if (bitcnt == 8) 
                        {
                            send_ACK();
                            if (IOCCNbits.IOCCN4 == 0) 
                            {
                                IOCCPbits.IOCCP3 = 1;
                            }

                            bitcnt = 0;
                            
                            switch(i2cdatasekvence)
                            {
                                case 1:
                                    I2CREGID = retval;
                                    break;
                                    
                                case 2:
                                    Lob(I2CREGVAL) = retval;
                                    CHK1 = retval;
                                    break;
                                    
                                case 3:
                                    Hib(I2CREGVAL) = retval;
                                    CHK2 = retval;
                                    break;
                                    
                                case 4:
                                    CHK1 = CHK1^CHK2;
                                    if (retval == CHK1) 
                                        I2CWRITEFLAG = 1;
                                    break;
                                    
                                default:
                                    break;                                                               
                            }

                            i2cdatasekvence++;
                            return;
                        }

                }
            
            timeout = 0x00FF;
            while (SCL) 
            {
                if ((tempSDA != SDA)) 
                {
                    retval = 0;
                    if (SDA) 
                    {
                        if (I2CWRITEFLAG) 
                        {
                            if ((I2CREGID >= wrregfrom) && (I2CREGID <= maxreg)) 
                                CPMREGDATA[I2CREGID] = I2CREGVAL;
                            
                            if (I2CREGID == I2C_RUMINPOT) 
                            {
                                UMIN_WR = 1;
                            } 
                            else if (I2CREGID == I2C_RUMAXPOT) 
                                {
                                    UMAX_WR = 1;
                                }
                            
                            I2CWRITEFLAG = 0;
                        }
                        
                        i2cstatus = I2C_STOP_DETECTED;
                        IOCCNbits.IOCCN4 = 1;

                    } else {
                        i2cstatus = I2C_START_DETECTED;
                        i2cdatasekvence = 0;
                        IOCCPbits.IOCCP3 = 1;
                        bitcnt = 0;
                        I2CWRITEFLAG = 0;

                    }
                    return;
                    
                } 
                else if (!timeout) 
                    {
                        i2cstatus = I2C_TIMEOUT;
                        retval = 0;
                        bitcnt = 0;
                        IOCCNbits.IOCCN4 = 1;
                        return;
                    } else 
                        timeout--;


            }
            IOCCPbits.IOCCP3 = 1;
        }
    }
}

void reswitchoutputspinfromI2C(u8_t iopin) 
{
    switch(iopin)
    {
        default:
            break;
                         
        case PINUMIN12:
            TogglePulsePinsUMIN12();       
            break;

        case PINUMIN3:
            TogglePinUMIN3();
            break;

        case PINUMIN4:
            TogglePinUMIN4();
            break;
           
        case PINUMAX12:
            TogglePulsePinsUMAX12();   
            break;
    
        case PINUMAX3:
            TogglePinUMAX3();        
            break;

        case PINUMAX4:
            TogglePinUMAX4();
            break;

        case PINEMER12:
            TogglePulsePinsEMER12();        
            break;
            
        case PINEMER3:
            TogglePinEMER3();
            break;
    }
}

void offswitchoutputspinfromI2C(u8_t iopin) 
{
    switch(iopin)
    {
        default:
            break;
            
        case PINUMIN12:
            PulsePinUMIN12_UMIN2();
            SetFlagUMIN12(PIN_OFF);
            break;
        
        case PINUMIN3:
            SetPinUMIN3(PIN_OFF);
            break;
        
        case PINUMIN4:
            SetPinUMIN4(PIN_OFF);
            break;
            
        case PINUMAX12:
            PulsePinUMAX12_UMAX2();
            SetFlagUMAX12(PIN_OFF);
            break;

        case PINUMAX3:
            SetPinUMAX3(PIN_OFF);
            break;
        
        case PINUMAX4:
            SetPinUMAX4(PIN_OFF);
            break;
    
        case PINEMER12: 
            PulsePinEMER12_EMER2();
            SetFlagEMER12(PIN_OFF);
            break;
            
        case PINEMER3:
            SetPinEMER3(PIN_OFF);
            break;
        
    }
}

void onswitchoutputspinfromI2C(u8_t iopin) 
{
    switch(iopin)
    {
        default:            
            break;
            
        case PINUMIN12:
            PulsePinUMIN12_UMIN2();
            SetFlagUMIN12(PIN_ON);
            break;
        
        case PINUMIN3:
            SetPinUMIN3(PIN_ON);
            break;
        
        case PINUMIN4:
            SetPinUMIN4(PIN_ON);
            break;
            
        case PINUMAX12:
            PulsePinUMAX12_UMAX2();
            SetFlagUMAX12(PIN_ON);
            break;

        case PINUMAX3:
            SetPinUMAX3(PIN_ON);
            break;
        
        case PINUMAX4:
            SetPinUMAX4(PIN_ON);
            break;
    
        case PINEMER12: 
            PulsePinEMER12_EMER2();
            SetFlagEMER12(PIN_ON);
            break;
            
        case PINEMER3:
            SetPinEMER3(PIN_ON);
            break;        
    }
}

void CPMOUTPUTGETREG(void) 
{
    if (CPMREGDATA[I2C_UMIN12] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMIN12);
    } else if (CPMREGDATA[I2C_UMIN12] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMIN12);
    } else if (CPMREGDATA[I2C_UMIN12] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMIN12);
    }

    if (CPMREGDATA[I2C_UMIN3] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMIN3);
    } else if (CPMREGDATA[I2C_UMIN3] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMIN3);
    } else if (CPMREGDATA[I2C_UMIN3] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMIN3);
    }


    if (CPMREGDATA[I2C_UMIN4] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMIN4);
    } else if (CPMREGDATA[I2C_UMIN4] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMIN4);
    } else if (CPMREGDATA[I2C_UMIN4] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMIN4);
    }

    if (CPMREGDATA[I2C_UMAX12] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMAX12);
    } else if (CPMREGDATA[I2C_UMAX12] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMAX12);
    } else if (CPMREGDATA[I2C_UMAX12] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMAX12);
    }

    if (CPMREGDATA[I2C_UMAX3] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMAX3);
    } else if (CPMREGDATA[I2C_UMAX3] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMAX3);
    } else if (CPMREGDATA[I2C_UMAX3] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMAX3);
    }

    if (CPMREGDATA[I2C_UMAX4] == RESWITCH) {
        reswitchoutputspinfromI2C(PINUMAX4);
    } else if (CPMREGDATA[I2C_UMAX4] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINUMAX4);
    } else if (CPMREGDATA[I2C_UMAX4] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINUMAX4);
    }

    if (CPMREGDATA[I2C_EMERG12] == RESWITCH) {
        reswitchoutputspinfromI2C(PINEMER12);
    } else if (CPMREGDATA[I2C_EMERG12] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINEMER12);
    } else if (CPMREGDATA[I2C_EMERG12] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINEMER12);
    }

    if (CPMREGDATA[I2C_EMERG3] == RESWITCH) {
        reswitchoutputspinfromI2C(PINEMER3);
    }
    if (CPMREGDATA[I2C_EMERG3] == ONSWITCH) {
        onswitchoutputspinfromI2C(PINEMER3);
    }
    if (CPMREGDATA[I2C_EMERG3] == OFFSWITCH) {
        offswitchoutputspinfromI2C(PINEMER3);
    }


    CPMREGDATA[I2C_UMIN12] = GetPinUMIN12();
    CPMREGDATA[I2C_UMIN3] = GetPinUMIN3();
    CPMREGDATA[I2C_UMIN4] = GetPinUMIN4();
    CPMREGDATA[I2C_UMAX12] = GetPinUMAX12();
    CPMREGDATA[I2C_UMAX3] = GetPinUMAX3();
    CPMREGDATA[I2C_UMAX4] = GetPinUMAX4();
    CPMREGDATA[I2C_EMERG12] = GetPinEMER12();
    CPMREGDATA[I2C_EMERG3] = GetPinEMER3();

}