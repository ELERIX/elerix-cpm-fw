#include <xc.h>
#include <string.h>
#include "cpu_spec.h"

//#define DEBUG
#include "debug_routines.h"

#include "voltage_limits.h"
#include "LEDs.h"
#include "dac.h"
#include "adc.h"
#include "interface_i2c.h"
#include "multiplexer.h"
#include "output_pins.h"
#include "events.h"
#include "eeprom_regs.h"

#pragma config CONFIG1 = 0x0B10
#pragma config CONFIG2 = 0x3626
#pragma config CONFIG3 = 0x3F1F
#pragma config CONFIG4 = 0x041F
#pragma config CONFIG5 = 0x0001

#undef BANKMASK
#define BANKMASK(addr) ((addr)&0x7F)

u8_t DISCONNECTFLAG;
u8_t startflag;
u16_t GB_Umin = 0, GB_Umax = 0;
u16_t TGB_Umin = 0, TGB_Umax = 0;
u16_t testUmin, testUmax;

u16_t GB_Uhavmin = 0xFFFF;
u16_t GB_Uhavmax = 0x0000;


#define  Uhavmindiff 300
#define  Uhavmaxdiff 300

#define DISCONNECTTIME   50

#define STARTUPTIME    100
#define LIMITVOLTAGE   250
#define CHN1KOREKCE    20

u8_t DISCflag = 0, startupflag = 0, TOFFFLAG = 0;
u32_t discontime = 0;
u8_t DLDISCflag = 0;



#define Uminmax_delay_relay_value 150
u32_t Umin_relay_delay;
u8_t Umin_relay_event = 0xFF;
u32_t Umax_relay_delay;
u8_t Umax_relay_event = 0xFF;


u32_t Umin4_relay_delay;
u8_t Umin4_relay_event = 0xFF;
u32_t Umax4_relay_delay;
u8_t Umax4_relay_event = 0xFF;


u8_t GBUmaxBlockLR = 1;
u8_t GBUmaxBlock = 1;

#define Uminmax_delay_ltrelay_value 350
u32_t Umin_ltrelay_delay;
u8_t Umin_ltrelay_event = 0xFF;
u32_t Umax_ltrelay_delay;
u8_t Umax_ltrelay_event = 0xFF;
u8_t GBUminBlockLR = 1;
u8_t GBUminBlock = 1;
u8_t GBUhavBlock = 1;


u8_t GBUhavUminident = 0;
u8_t GBUhavUmaxident = 0;


#define Uhav_delay_ltrelay_value 300
u32_t Uhav_ltrelay_delay;
u8_t Uhav_ltrelay_event = 0xFF;


u8_t CHN_voltageMINEvent[16];
u8_t CHN_voltageMAXEvent[16];
u8_t CHN_voltageMINEventTemp[16];
u8_t CHN_voltageMAXEventTemp[16];


u8_t LEDSTATFLAG = 0;
u8_t GBUminEvent;
u8_t GBUmaxEvent;
u8_t GB_chn = 1;
u8_t GBmaxid = 0xFF;
u8_t GBminid = 0xFF;

u16_t GBCELLUmax;
u16_t GBCELLUmin;

#define LEDstarttime 10

#define LEDOFFTIME 50
#define LEDONTIME 10

#define CELLNA                  0xFF
#define CELLUMINOK              1
#define CELLUMINFAIL            0
#define CELLUMINWAITFORHYST     2
#define CELLUMINWAITFORHYSTTIME 3
u8_t UminOKstatus = CELLNA;


#define CELLUMAXOK   1
#define CELLUMAXFAIL 0
u8_t UmaxOKstatus = CELLNA;



#define CELLUHAVOK   1
#define CELLUHAVFAIL 0
#define CELLUMAXWAITFORHYST 2
#define CELLUMAXWAITFORHYSTTIME 3
u8_t UhavOKstatus = CELLUHAVFAIL;

u16_t CHN_voltage[16];

u8_t LEDchangeflag = 0;
u32_t LEDchangetime = 0;

u8_t CELL_connect[16];
u8_t cellconnectflag = 0;

u8_t MISSEDINTERCELLFLAG;
u8_t MISSEDBUTTONFLAG;
u8_t Missed_cell_TEST;
u8_t Missed_cell_ID;
u8_t MAXMINFLAG;





#define PUSH     PORTCbits.RC5
#define PUSH_IN() TRISCbits.TRISC5 = 1

#define PWRUP       LATFbits.LATF4
#define PWRUP_OUT() TRISFbits.TRISF4 = 0
#define PWRUP_IN()  TRISFbits.TRISF4 = 1

#define DIGIN1_IN()  TRISCbits.TRISC2=1
#define DIGIN1       PORTCbits.RC2

#define DIGIN2_IN()  TRISBbits.TRISB5=1
#define DIGIN2       PORTBbits.RB5


void set_Umin4_OUTPUT(u8_t status) 
{    
    if (status == CELLUMINOK) 
    {
        SetPinUMIN4(PIN_ON);
    } 
    else 
    {
        SetPinUMIN4(PIN_OFF);
    }
}

void set_Umax4_OUTPUT(u8_t status) 
{
    if (status == CELLUMINOK) 
    {
        SetPinUMAX4(PIN_ON);
    } 
    else 
    {
        SetPinUMAX4(PIN_OFF);
    }
}

void set_Umin_OUTPUT(u8_t status) 
{
    if (status == CELLUMINOK) 
    {
        SetPinUMIN3(PIN_ON);
    } 
    else 
    {
        SetPinUMIN3(PIN_OFF);
    }
}

void set_Umin_LT_OUTPUT(u8_t status) 
{
    if (status == CELLUMINOK) 
    {
        PulsePinUMIN12_UMIN1();
    } 
    else 
    {
        PulsePinUMIN12_UMIN2();
    }
}

void set_Umax_OUTPUT(u8_t status) 
{
    if (status == CELLUMAXOK) 
    {
        SetPinUMAX3(PIN_ON);
    } 
    else 
    {
        SetPinUMAX3(PIN_OFF);
    }
}

void set_Umax_LT_OUTPUT(u8_t status) 
{
    if (status == CELLUMAXOK) 
    {
        PulsePinUMAX12_UMAX1();
    } 
    else 
    {
        PulsePinUMAX12_UMAX2();
    }
}

void set_Uhav_OUTPUT(u8_t status) 
{
    if (status == CELLUHAVOK)         
    {
        PulsePinEMER12_EMER1();
        SetPinEMER3(PIN_ON);
    } 
    else 
    {
        PulsePinEMER12_EMER2();
        SetPinEMER3(PIN_OFF);
    }
}



//u8_t I2C1_slaveWriteData;


u8_t  i;

u8_t tempVALBYTE;
u8_t SDABUSHI;
u8_t I2C_PROCESS;
u8_t READ = 1;
u8_t READCONT = 2;
u8_t WRITE = 3;

u8_t UNKW = 0;

#define Lo(param) ((char *)&param)[0]
#define Hi(param) ((char *)&param)[1]

u8_t trd = 0;

u32_t timeticks = 0, miliseconds = 0;
u8_t tempmil = 0;

void TimerInterrupt(void)
{
    if (PIR4bits.TMR1IF) 
    {
        PIR4bits.TMR1IF = 0;
        TMR1H = 0xE0;
        TMR1L = 0xC0;
        tempmil++;
        
        if (tempmil == 100) 
        {
            timeticks++;
            tempmil = 0;
        }
        
        miliseconds++;
        return;
    }        
}


//void interrupt() {
void __interrupt () isr(void) 
{
    interruptI2C1();
    TimerInterrupt();
}





u8_t diginf1 = 0;
u32_t digintime1;

u8_t diginf2 = 0;
u32_t digintime2;

void init_outputstatus(void);

void triginiput1() 
{

    if (DIGIN1) 
    {
        if (diginf1 == 0) 
        {
            diginf1 = 1;
            digintime1 = timeticks;
        }
    }


    if (diginf1 == 1) 
    {
        if (!DIGIN1) 
        {
            if (timeticks < (digintime1 + 30)) 
                diginf1 = 0; //300 msec
            else 
            {
                debug_print_str("\r\nDIGIN1ACT!");
                diginf1 = 0;
                init_outputstatus();
                events_reset();
            }
        }
    }

}

void triginiput2() 
{

    if (DIGIN2) 
    {
        if (diginf2 == 0) 
        {
            diginf2 = 1;
            digintime2 = timeticks;
        }
    }


    if (diginf2 == 1) 
    {
        if (!DIGIN2) 
        {
            if (timeticks < (digintime2 + 30)) 
                diginf1 = 0;
            else 
            {
                debug_print_str("\r\nVYPINAMEOPTOVSTUP!");
                diginf2 = 0;
                set_Uhav_OUTPUT(CELLUHAVFAIL);
                set_Umin_LT_OUTPUT(CELLUMINFAIL);
                set_Umax_LT_OUTPUT(CELLUMAXFAIL);

                PWRUP = 0;
                __delay_ms(2000);
                PWRUP_IN();
            }
        }
    }

}

void start_timer() 
{
    PMD1bits.TMR1MD = 0;
    PMD5bits.SMT1MD = 0;
    T1CLK = 0x01;
    T1CON = 0x01;
    PIR4bits.TMR1IF = 0;
    TMR1H = 0xE0;
    TMR1L = 0xC0;
    PIE4bits.TMR1IE = 1;
    INTCON = 0xC0;
}

u16_t TEST_CELL(u8_t chn) 
{
    u16_t testtemp, max;

    set_CELL_channel(AGND_CHN);
    
    multiplex_enable(0);    
    __delay_ms(6);    
    multiplex_enable(1);

    set_CELL_channel(chn);

    multiplex_enable(0);    
    __delay_ms(6);
    
    testtemp = adc_get_avg_voltage_input(20);

    multiplex_enable(1);
    
    return testtemp;
}


u32_t voltsuma = 0;
u8_t CONDUMAXWAIT, CONDUMAXNOW;
u8_t CONDUMINWAIT, CONDUMINNOW;
u8_t CELLUNDERMIN, CELLABOVEMAX;

void TEST_CELL_poll() 
{
    u8_t odd = 0;
    u16_t Vdif, Voff;
    s16_t Vres;
    u32_t Vysledek, test;
    u8_t i;
    u16_t Ucell;



    Voff = TEST_CELL(VREF_CHN);
    Vdif = TEST_CELL(GB_chn);

    odd = GB_chn & 0x01;



    Vysledek = 0;
    Vres = Vdif;
    Vres = Vres - Voff;
    if (!odd) {
        Vres = Vres* -1;
    }

    if (Vres > 0) {
        if ((Vres > LIMITVOLTAGE) && (Vres < 1700)) {
            Vysledek = Vres;
            Vysledek *= 2560;
            Vysledek /= 1000;
            if (GB_chn == 1) Vysledek += CHN1KOREKCE;

        } else {
            Vres = 0;
            Vysledek = 0;
        }
    } else {
        Vysledek = 0;
        Vres = 0;
    }


    test = (u16_t) Vysledek;
    CHN_voltage[GB_chn - 1] = test;






    if (test > LIMITVOLTAGE) {
        
        CELL_connect[GB_chn - 1] = 1;
        
        if (!Missed_cell_TEST) 
            Missed_cell_ID = GB_chn;

        if ((test >= GB_Umin) && (test <= GB_Umax)) 
            SetTempLED_statOFF(GB_chn - 1);
        else {
            SetTempLED_statOFF(GB_chn - 1);
            
            if (test <= GB_Umin) 
                SetTempLED_statRed(GB_chn - 1);
            
            if (test >= GB_Umax)
                SetTempLED_statBlue(GB_chn - 1);
            
        }

        SetCPMREG(GB_chn, test);

    } else {
        SetTempLED_statOFF(GB_chn - 1);
        if (CELL_connect[GB_chn - 1]) {
            DISCONNECTFLAG = 1;
        }

    }


    GB_chn++;
    if (GB_chn > 16) {
        if (!Missed_cell_TEST) Missed_cell_TEST = 1;
        GB_chn = 1;
        if (!cellconnectflag) cellconnectflag = 1;
        LEDSTATFLAG = 1;

        voltsuma = 0;
        testUmax = 0;
        testUmin = 0xFFFF;
        CONDUMAXNOW = 0;
        CONDUMAXWAIT = 0;
        CONDUMINNOW = 0;
        CONDUMINWAIT = 0;

        CELLUNDERMIN = 0;
        CELLABOVEMAX = 0;

        for (i = 0; i < 16; i++) {
            if (CELL_connect[i]) {
                Ucell = CHN_voltage[i];

                voltsuma += Ucell;
                if (testUmax < CHN_voltage[i]) testUmax = CHN_voltage[i];
                if (testUmin > CHN_voltage[i]) testUmin = CHN_voltage[i];

                if (Ucell <= (GB_Umin + UMIN_hystereze)) CONDUMAXWAIT = 1;
                if (Ucell <= GB_Umin) CONDUMAXNOW = 1;
                if (Ucell >= (GB_Umax - UMIN_hystereze)) CONDUMINWAIT = 1;
                if (Ucell <= GB_Umin) CONDUMINNOW = 1;

                if (Ucell <= GB_Umin) CELLUNDERMIN = 1;
                if (Ucell >= GB_Umax) CELLABOVEMAX = 1;

            } else break;
        }


        if (voltsuma > 0xFFFF) 
            voltsuma = 0xFFFF;
        
        SetCPMREG(I2C_UCELLTOTAL, (u16_t) voltsuma);

        if (Umax4_relay_event == CELLUMAXWAITFORHYST) {
            if ((CONDUMAXWAIT == 1) && (CELLABOVEMAX == 0)) {
                Umax4_relay_delay = timeticks + Uminmax_delay_relay_value;
                Umax4_relay_event = CELLUMAXWAITFORHYSTTIME;
                debug_print_str("\r\nUMAX COND 4WAITTIME!");
            }
        } else if (Umax4_relay_event == CELLUMAXWAITFORHYSTTIME) {
            if (CONDUMAXWAIT == 0) {
                Umax4_relay_event = CELLUMAXWAITFORHYST;
                debug_print_str("\r\nUMAX4RETURN!");
            }
            if (timeticks > Umax4_relay_delay) {
                set_Umax4_OUTPUT(CELLUMINOK);
                Umax4_relay_event = CELLUMINOK;
                debug_print_str("\r\nUMAX4EVRETHYSTTIME!");
            }
            if ((CONDUMAXNOW == 1) && (CELLABOVEMAX == 0)) {

                debug_print_str("\r\nUMAX4EVRET NOW:");
                debug_print_udec(testUmin);
                debug_print_str(">GBUMIN:");
                debug_print_udec(GB_Umin);
                debug_print_str("GBUMIN-UMINHYST:");
                debug_print_udec(GB_Umin + UMIN_hystereze);

                set_Umax4_OUTPUT(CELLUMINOK);
                Umax4_relay_event = CELLUMINOK;

            }

        }



        if (Umin4_relay_event == CELLUMINWAITFORHYST) {
            if ((CONDUMINWAIT == 1) && (CELLUNDERMIN == 0)) {
                Umin4_relay_delay = timeticks + Uminmax_delay_relay_value;
                Umin4_relay_event = CELLUMINWAITFORHYSTTIME;
                debug_print_str("\r\nUMIN COND 4WAITTIME!");
            }
        } else if (Umin4_relay_event == CELLUMINWAITFORHYSTTIME) {
            if (CONDUMINWAIT == 0) {
                Umin4_relay_event = CELLUMINWAITFORHYST;
                debug_print_str("\r\nUMIN4RETURN!");
            }
            if (timeticks > Umin4_relay_delay) {
                set_Umin4_OUTPUT(CELLUMINOK);
                Umin4_relay_event = CELLNA;
                debug_print_str("\r\nUMIN4EVRETHYSTTIME!");
            }
            if ((CONDUMINNOW == 1) && (CELLUNDERMIN == 0)) {
                debug_print_str("\r\nUMIN4EVRET.TESTUMAX:");
                debug_print_udec(testUmax);
                debug_print_str(">GBUMAX:");
                debug_print_udec(GB_Umax);
                debug_print_str("GBUMAX-UMAXHYST:");
                debug_print_udec(GB_Umax - UMAX_hystereze);

                set_Umin4_OUTPUT(CELLUMINOK);
                Umin4_relay_event = CELLNA;
            }



        }




    }
    if (Missed_cell_TEST == 1) {


        debug_print_str("\r\nMISSED CELL TEST:");
        debug_print_hex_u8(Missed_cell_ID);
        Missed_cell_TEST = 2;
        for (i = 0; i < Missed_cell_ID; i++) {
            if (!CELL_connect[i]) MISSEDINTERCELLFLAG = 1;
            debug_print_hex_u8(CELL_connect[i]);

        }
        debug_print_str("\r\nMISSED CELL TESTRES:");
        debug_print_hex_u8(MISSEDINTERCELLFLAG);
    }








}

u8_t Umin_button() 
{
    u16_t temp;

    temp = adc_get_avg_minimum_input(50);

    if (temp < 0x0020) {
        GB_Umin = Umin0;
        GB_Uhavmin = Umin0 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 0;
    } else if ((temp > 0x006E) && (temp < 0x00AA)) {
        GB_Umin = Umin1;
        GB_Uhavmin = Umin1 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 1;
    } else if ((temp > 0x00F0) && (temp < 0x0168)) {
        GB_Umin = Umin2;
        GB_Uhavmin = Umin2 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 2;
    } else if ((temp > 0x0180) && (temp < 0x01E0)) {
        GB_Umin = Umin3;
        GB_Uhavmin = Umin3 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 3;
    } else if ((temp > 0x0250) && (temp < 0x02A0)) {
        GB_Umin = Umin4;
        GB_Uhavmin = Umin4 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 4;
    } else if ((temp > 0x02C0) && (temp < 0x0314)) {
        GB_Umin = Umin5;
        GB_Uhavmin = Umin5 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 5;
    } else if ((temp > 0x0340) && (temp < 0x0390)) {
        GB_Umin = Umin6;
        GB_Uhavmin = Umin6 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 6;
    } else if ((temp > 0x03A9) && (temp < 0x03F9)) {
        GB_Umin = Umin7;
        GB_Uhavmin = Umin7 - Uhavmindiff;
        MISSEDBUTTONFLAG = 0;
        return 7;
    } else {
        MISSEDBUTTONFLAG = 1;
        debug_print_str("\r\nUMINBUTERR:");
        debug_print_hex_u16(temp);
    }


    return 0xFF;
}

u8_t Umax_button() 
{
    u16_t temp;
    
    temp = adc_get_avg_maximum_input(50);

    if (temp < 0x0020) {
        GB_Umax = Umax0;
        GB_Uhavmax = Umax0 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 0;
    } else if ((temp > 0x0170) && (temp < 0x0180)) {
        GB_Umax = Umax1;
        GB_Uhavmax = Umax1 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 1;
    } else if ((temp > 0x02E5) && (temp < 0x0320)) {
        GB_Umax = Umax2;
        GB_Uhavmax = Umax2 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 2;
    } else if ((temp > 0x03F0) && (temp < 0x0420)) {
        GB_Umax = Umax3;
        GB_Uhavmax = Umax3 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 3;
    } else if ((temp > 0x0570) && (temp < 0x05B0)) {
        GB_Umax = Umax4;
        GB_Uhavmax = Umax4 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 4;
    } else if ((temp > 0x0640) && (temp < 0x0680)) {
        GB_Umax = Umax5;
        GB_Uhavmax = Umax5 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 5;
    } else if ((temp > 0x0710) && (temp < 0x0740)) {
        GB_Umax = Umax6;
        GB_Uhavmax = Umax6 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 6;
    } else if ((temp > 0x07B0) && (temp < 0x07DA)) {
        GB_Umax = Umax7;
        GB_Uhavmax = Umax7 + Uhavmaxdiff;
        MISSEDBUTTONFLAG = 0;
        return 7;
    } else {
        MISSEDBUTTONFLAG = 1;
        debug_print_str("\r\nUMAXBUTERR:");
        debug_print_hex_u16(temp);


    }

    return 0xFF;
}

u8_t pushf = 0;
u32_t pushtime = 0;
u8_t LEDOFFflag = 0;
u32_t LEDtime;

u8_t GBchn = 0, GBstatus = 0;

void push_poll()
#define MINTIME 1
{
    s16_t Vres;
    float vysledek;
    u16_t Voffset, Vdif;

    if (!PUSH) {
        if (pushf == 0) {
            pushf = 1;
            pushtime = timeticks;
            debug_print_strROM("\r\nPUSH1");
        }
    }
    if (pushf == 1) {

        if (timeticks > (pushtime + 20)) {
            debug_print_strROM("\r\nVYPINAME!");
            TOFFFLAG = 1;
            discontime = timeticks + 5;
            init_LED();
            pushf = 2;
            return;
        }
    }


}



#define DAC_GAIN        MCP47X6_GAIN_1X
#define DAC_VREF        MCP47X6_VREF_VREFPIN


void DAC_poll(void) 
{
    u8_t i;
    u16_t min, max;
    min = 0x0FFF;
    max = 0;



    for (i = 0; i < Missed_cell_ID; i++) {


        if (CHN_voltage[i] > LIMITVOLTAGE) {

            if (CHN_voltage[i] > max) {
                max = CHN_voltage[i];
                GBmaxid = i;
            }
            if (CHN_voltage[i] < min) {
                min = CHN_voltage[i];
                GBminid = i;
            }
        }
    }
    if (min == 0x0FFF) min = 0;

    GBCELLUmax = max;
    GBCELLUmin = min;
    DAC1_setoutputlevel(min);
    DAC2_setoutputlevel(max);
}

void init_outputstatus(void) 
{
    UminOKstatus = CELLNA;
    UmaxOKstatus = CELLNA;

    UhavOKstatus = CELLUHAVFAIL;
    GBUminEvent = 1;
    GBUmaxEvent = 1;
    DISCflag = 0;

    GBUminBlockLR = 1;
    GBUminBlock = 1;
    GBUmaxBlockLR = 1;
    GBUmaxBlock = 1;
    GBUhavBlock = 1;


    Umin4_relay_event = CELLNA;
    Umax4_relay_event = CELLNA;



}

void OUTPUT_poll(void) 
{
    u8_t i, UmaxEvent, UminEvent;
    u8_t Umax4Event;
    u8_t Umin4Event;



    UmaxEvent = 0;
    UminEvent = 0;

    Umax4Event = 0;
    Umin4Event = 0;




    DISCflag = 0;



    for (i = 0; i < 16; i++) {
        CHN_voltageMINEventTemp[i] = 0x00;
        CHN_voltageMAXEventTemp[i] = 0x00;

    }
    GBUhavUminident = 0;
    GBUhavUmaxident = 0;


    u16_t totalV = 0;
    
    for (i = 0; i < Missed_cell_ID; i++)
        if (CHN_voltage[i] > LIMITVOLTAGE)
            totalV += CHN_voltage[i];
    
    
    for (i = 0; i < Missed_cell_ID; i++) {

        if (CHN_voltage[i] > LIMITVOLTAGE) {            
            
            if (CHN_voltage[i] < GB_Uhavmin) {
                
                DISCflag = 1;
                GBUhavUminident = 1;
                
                debug_print_str("\r\nUHAVMINID!:");
                debug_print_hex_u8(i);
                
                SetEvent(i + 1, EVENT_UMINHAV,  CHN_voltage[i], totalV);                                
            }
            if (CHN_voltage[i] > GB_Uhavmax) {
                
                DISCflag = 1;
                GBUhavUmaxident = 1;
                
                SetEvent(i + 1, EVENT_UMAXHAV,  CHN_voltage[i], totalV);                
            }




            if (GB_Umin != UminF) {
                if (CHN_voltage[i] < GB_Umin) {
                    
                    UminEvent = 1;
                    
                    CHN_voltageMINEventTemp[i] = 0x01;
                    
                    Umin4Event = 1;
                    
                    SetEvent(i + 1, EVENT_UMIN,  CHN_voltage[i], totalV);
                }
            }

            if (GB_Umax != UmaxF) {


                if (CHN_voltage[i] > GB_Umax){

                    UmaxEvent = 1;
                    
                    SetEvent(i + 1, EVENT_UMAX,  CHN_voltage[i], totalV);
                    
                    CHN_voltageMAXEventTemp[i] = 0x01;
                    
                    Umax4Event = 1;
                    
                }
            }
        }
    }

    if (DISCflag == 1) {
        if ((GBUhavUminident) || (UhavOKstatus == CELLUHAVOK)) {
            debug_print_str("\r\nUHAVFAIL:");
            debug_print_hex_u8(DISCflag);
            debug_print_hex_u8(GBUhavUminident);
            debug_print_hex_u8(UhavOKstatus == CELLUHAVOK);

            UhavOKstatus = CELLUHAVFAIL;
            Uhav_ltrelay_event = CELLUHAVFAIL;
            Uhav_ltrelay_delay = timeticks + Uhav_delay_ltrelay_value;
        }
    }
    if ((DISCflag == 0) && (UhavOKstatus == CELLUHAVFAIL)) {
        UhavOKstatus = CELLUHAVOK;
        if (GBUhavBlock == 1) {
            set_Uhav_OUTPUT(CELLUHAVOK);
            Uhav_ltrelay_event = CELLUHAVOK;
            debug_print_str("\r\nUHAVBLOCK");
        }

        debug_print_str("\r\nUHAVOK");

    }




    if (GBUminEvent == 1) {


        if ((Umin4Event == 1) && ((Umin4_relay_event == CELLNA) || (Umin4_relay_event == CELLUMINOK))) {
            Umin4_relay_event = CELLUMINFAIL;
            Umin4_relay_delay = timeticks + Uminmax_delay_relay_value;
            debug_print_str("\r\nUMIN4FAIL");
        }
        if (Umin4Event == 0) {
            if ((Umin4_relay_event == CELLUMAXFAIL) || (Umin4_relay_event == CELLNA)) {
                Umin4_relay_event = CELLUMINOK;
                set_Umin4_OUTPUT(CELLUMINOK);
                debug_print_str("\r\nUMIN4EVENTOK");
            }

        }

        if ((UminEvent == 1) && ((UminOKstatus == CELLUMINOK) || (UminOKstatus == CELLNA))) {
            UminOKstatus = CELLUMINFAIL;


            Umin_relay_event = CELLUMINFAIL;
            Umin_ltrelay_event = CELLUMINFAIL;
            Umin_relay_delay = timeticks + Uminmax_delay_relay_value;
            Umin_ltrelay_delay = timeticks + Uminmax_delay_ltrelay_value;
        }
        if ((UminEvent == 0) && ((UminOKstatus == CELLUMINFAIL) || (UminOKstatus == CELLNA))) {
            UminOKstatus = CELLUMINOK;
            if (GBUminBlock == 1) {
                debug_print_str("\r\nUMINOKSET");
                set_Umin_OUTPUT(CELLUMINOK);
                Umin_relay_event = CELLUMINOK;
            }
            if (GBUminBlockLR == 1) {
                set_Umin_LT_OUTPUT(CELLUMINOK);
                Umin_ltrelay_event = CELLUMINOK;
            }

            debug_print_str("\r\n UMINOK");

        }
    }


    if (GBUmaxEvent == 1) {
        if ((Umax4Event == 1) && ((Umax4_relay_event == CELLNA) || (Umax4_relay_event == CELLUMAXOK))) {
            Umax4_relay_event = CELLUMAXFAIL;
            Umax4_relay_delay = timeticks + Uminmax_delay_relay_value;
            debug_print_str("\r\nUMAX4EVENTFAIL");
        }
        if (Umax4Event == 0) {
            if ((Umax4_relay_event == CELLUMAXFAIL) || (Umax4_relay_event == CELLNA)) {
                Umax4_relay_event = CELLUMAXOK;
                set_Umax4_OUTPUT(CELLUMAXOK);
                debug_print_str("\r\nUMAX4EVENTOK");
            }

        }




        if ((UmaxEvent == 1) && ((UmaxOKstatus == CELLUMAXOK) || (UmaxOKstatus == CELLNA))) {
            UmaxOKstatus = CELLUMAXFAIL;
            Umax_relay_event = CELLUMAXFAIL;

            Umax_ltrelay_event = CELLUMAXFAIL;
            Umax_relay_delay = timeticks + Uminmax_delay_relay_value;
            Umax_ltrelay_delay = timeticks + Uminmax_delay_ltrelay_value;
            debug_print_str("\r\nUMAXFAIL");


        }
        if ((UmaxEvent == 0) && ((UmaxOKstatus == CELLUMAXFAIL) || (UmaxOKstatus == CELLNA))) {
            UmaxOKstatus = CELLUMAXOK;
            debug_print_str("\r\nUMAXOK");
            if (GBUmaxBlock == 1) {
                debug_print_str("\r\nUMAXOKSET");
                set_Umax_OUTPUT(CELLUMAXOK);
                Umax_relay_event = CELLUMINOK;



            }
            if (GBUmaxBlockLR == 1) {
                set_Umax_LT_OUTPUT(CELLUMAXOK);
                Umax_ltrelay_event = CELLUMINOK;
            }

        }

    }

}

void DELAY_poll() {
    u8_t i;


    if (Umin4_relay_event == CELLUMINFAIL) {
        if (timeticks > Umin4_relay_delay) {
            debug_print_str("\r\nUMIN4 DELAYEV WHYST");
            Umin4_relay_event = CELLUMINWAITFORHYST;
            set_Umin4_OUTPUT(CELLUMINFAIL);
        }
    }


    if ((Umin_relay_event == CELLUMINFAIL) && GBUminBlock) {
        if (timeticks > Umin_relay_delay) {
            debug_print_str("\r\nUMINDELAYEV");
            set_Umin_OUTPUT(CELLUMINFAIL);
            Umin_relay_event = 0xFF;
            GBUminBlock = 0;
            memcpy(CHN_voltageMINEvent, CHN_voltageMINEventTemp, 16);
            save_eeprom_event();


        }

    }
    if ((Umin_ltrelay_event == CELLUMINFAIL) && GBUminBlockLR) {
        if (timeticks > Umin_ltrelay_delay) {
            set_Umin_LT_OUTPUT(CELLUMINFAIL);
            Umin_ltrelay_event = 0xFF;
            GBUminBlockLR = 0;



        }
    }


    if (Umax4_relay_event == CELLUMAXFAIL) {
        if (timeticks > Umax4_relay_delay) {
            debug_print_str("\r\nUMAX4 DELAYEV WHYST!");
            Umax4_relay_event = CELLUMAXWAITFORHYST;
            ;
            set_Umax4_OUTPUT(CELLUMAXFAIL);
        }
    }



    if ((Umax_relay_event == CELLUMAXFAIL) && GBUmaxBlock) {
        if (timeticks > Umax_relay_delay) {
            set_Umax_OUTPUT(CELLUMAXFAIL);
            Umax_relay_event = 0xFF;
            GBUmaxBlock = 0;
            memcpy(CHN_voltageMAXEvent, CHN_voltageMAXEventTemp, 16);
            save_eeprom_event();

        }
    }
    if ((Umax_ltrelay_event == CELLUMAXFAIL) && GBUmaxBlockLR) {
        if (timeticks > Umax_ltrelay_delay) {
            set_Umax_LT_OUTPUT(CELLUMAXFAIL);
            Umax_ltrelay_event = 0xFF;
            GBUmaxBlockLR = 0;


        }
    }




    if (Uhav_ltrelay_event == CELLUHAVFAIL) {

        if (timeticks > Uhav_ltrelay_delay) {
            debug_print_str("\r\nUHAVDELAYEV");
            set_Uhav_OUTPUT(CELLUHAVFAIL);
            Uhav_ltrelay_event = 0xFF;
            if (GBUhavUminident == 1) {
                DLDISCflag = 1;
                discontime = DISCONNECTTIME + timeticks;
                debug_print_str("\r\nVYPINAME UMINHAV!");
            }

            save_eeprom_event();


        } else {
            if ((GBUminBlock == 0) && (!DLDISCflag)) {
                debug_print_str("\r\nVYPINAMEUMINHAVPOUMIN");
                DLDISCflag = 1;
                discontime = 10 + timeticks;
            }
            if ((GBUmaxBlock == 0) && ((GBUhavBlock == 1))) {
                set_Uhav_OUTPUT(CELLUHAVFAIL);
                GBUhavBlock = 0;
                debug_print_str("\r\nSETUJEME UMAXHAV!");
            }

        }
    }


}


u32_t suma, testtime = 0, testbuttontime = 0;
u16_t result;

void main() 
{

    u8_t i, j;

    PWRUP_OUT();
    PWRUP = 0;

    PORTA = 0;
    PORTB = 0;
    PORTC = 0;
    PORTD = 0;
    PORTE = 0;
    PORTF = 0;
    PORTG = 0;
    PORTH = 0;
    
    init_adc();    
    init_multiplex();
    
    memset(CHN_voltage, 0x00, 32);


    __delay_ms(200);

    startflag = 1;

    memset(CELL_connect, 0, 16);

    DISCONNECTFLAG = 0;
    MISSEDBUTTONFLAG = 0;
    
    MISSEDINTERCELLFLAG = 0;
    MAXMINFLAG = 0;
    Missed_cell_TEST = 0;
    Missed_cell_ID = 0;
    Umin_relay_event = 0xFF;
    Umax_relay_event = 0xFF;


    Umin4_relay_event = 0xFF;
    Umax4_relay_event = 0xFF;


    Umin_ltrelay_event = 0xFF;
    Umax_ltrelay_event = 0xFF;
    Uhav_ltrelay_event = 0xFF;
    GBUminBlockLR = 1;
    GBUminBlock = 1;
    GBUmaxBlockLR = 1;
    GBUmaxBlock = 1;
    GBUhavBlock = 1;


    for (i = 0; i < 16; i++) 
    {
        CHN_voltageMINEvent[i] = 0x00;
        CHN_voltageMAXEvent[i] = 0x00;
    }


    init_outputstatus();
    ZCDCON = 0;
    OSCCON1 = 0x10;


    testtime = timeticks + 50L;
    testbuttontime = timeticks + 20;





    init_LED();
    start_timer();
    DACs_init();


    LEDOFFflag = 0;
    LEDtime = timeticks + LEDONTIME;

    DIGIN1_IN();
    DIGIN2_IN();

    debug_init();

    TRISCbits.TRISC4 = 1;
    TRISCbits.TRISC3 = 1;
    WPUCbits.WPUC3 = 1;

    debug_print_str("\r\nSTARTTI123456789");
    INLVLCbits.INLVLC4 = 1;
    INLVLCbits.INLVLC4 = 1;

    I2C1_Initialize();

    debug_print_str("\r\nCTRL1");


    PWRUP_OUT();
    PWRUP = 1;

    __delay_ms(200);


    for (i = 0; i < 5; i++) 
    {
        adc_get_voltage_input();
        adc_get_minimum_input();
        adc_get_maximum_input();        
        __delay_ms(200);
    }


    PWRUP_OUT();
    PWRUP = 1;
    
    i = 1;
    Umin_button();
    Umax_button();

    Uhav_ltrelay_delay = timeticks + Uhav_delay_ltrelay_value;
    
    while (1) {

        triginiput1();
        triginiput2();

        if (cellconnectflag == 1) {
            start_LED(CELL_connect);
            EVENT_LED();

            cellconnectflag = 2;
        } else if (cellconnectflag == 2) {
            if (timeticks > LEDstarttime) {
                if (TOFFFLAG == 1) {
                    for (i = 0; i < 16; i += 2) 
                    {
                        if (CELL_connect[i]) 
                            SetLED_statBlue(i);
                        
                        if (CELL_connect[i + 1]) 
                            SetLED_statRed(i + 1);


                    }
                    LED_poll();


                } else {


                    if (timeticks > LEDtime) {

                        if (LEDOFFflag) {
                            if (LEDSTATFLAG == 1) {
                                LEDSTATFLAG = 0;

                                CopyLED_statFromTemp_LED_stat();

                                SetLED_statOFF(GBmaxid);
                                SetLED_statOFF(GBminid);


                                for (i = 0; i < 16; i++) {
                                    if (GBUminBlock == 0) {
                                        if (GBminid != i)
                                            if (CHN_voltageMINEvent[i] == 1) 
                                                SetLED_statRed(i);
                                    }
                                    if (GBUmaxBlock == 0) {
                                        if (GBmaxid != i)
                                            if (CHN_voltageMAXEvent[i] == 1) 
                                                SetLED_statBlue(i);
                                    }
                                }

                            }
                            LEDtime = timeticks + LEDOFFTIME;
                        } else {
                            LEDtime = timeticks + LEDONTIME;
                            
                            CopyLED_statFromTemp_LED_stat();
                            
                            if (LEDSTATFLAG == 1) {
                                LEDSTATFLAG = 0;
                                for (i = 0; i < 16; i++) {
                                    if (GBUminBlock == 0) {
                                        if (CHN_voltageMINEvent[i] == 1) 
                                            SetLED_statOFF(i);
                                    }
                                    if (GBUmaxBlock == 0) {
                                        if (CHN_voltageMAXEvent[i] == 1) 
                                            SetLED_statOFF(i);
                                    }
                                }

                                SetLED_statBlue(GBmaxid);
                                SetLED_statRed(GBminid);




                            }

                        }

                        LEDOFFflag = !LEDOFFflag;
                    }

                    LED_poll();

                }
            }
        }

        push_poll();

        TRISCbits.TRISC4 = 1;
        TRISCbits.TRISC3 = 1;


        WPUCbits.WPUC3 = 1;

        if (timeticks > testbuttontime) 
        {

            Umin_button();
            Umax_button();

            CheckU_WR(timeticks);
            
            if (GetCPMREG(I2C_RUMINPOT) == 0xFFFF) 
                TGB_Umin = GB_Umin;
            else 
            {
                TGB_Umin = GB_Umin;
                GB_Umin = GetCPMREG(I2C_RUMINPOT);
                GB_Uhavmin = GB_Umin - Uhavmindiff;
                debug_print_strROM("\r\nREMOTEPOMIN!:");
                debug_print_hex_u16(GB_Umin);
                debug_print_hex_u16(GB_Uhavmin);

            }
            
            if (GetCPMREG(I2C_RUMAXPOT) == 0xFFFF) 
                TGB_Umax = GB_Umax;
            else 
            {
                TGB_Umax = GB_Umax;
                GB_Umax = GetCPMREG(I2C_RUMAXPOT);
                GB_Uhavmax = GB_Umax + Uhavmaxdiff;
            }


            SetCPMREG(I2C_UMINPOT, TGB_Umin);
            SetCPMREG(I2C_UMAXPOT, TGB_Umax);

            if (GetCPMREG(I2C_TURNOFF) == 0x0001) 
            {
                debug_print_strROM("\r\nVYPINAME I2c!");


                set_Uhav_OUTPUT(CELLUHAVFAIL);
                set_Umin_LT_OUTPUT(CELLUMINFAIL);
                set_Umax_LT_OUTPUT(CELLUMAXFAIL);
                
                PWRUP = 0;
                __delay_ms(2000);
                PWRUP_IN();
            }
            
            if (GetCPMREG(I2C_RESET) == 0x0001) 
            {
                init_outputstatus();
                SetCPMREG(I2C_RESET, 0);
                debug_print_strROM("\r\nRESETUJEME I2c!");
                events_reset();
            }

            CPMOUTPUTGETREG();
            
            if (UhavOKstatus == CELLUHAVFAIL) 
            {
                SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) & ~0x8000);
            } else if (UhavOKstatus == CELLUHAVOK) 
                {
                    SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) | 0x8000);
                }
            
            if (UminOKstatus == CELLUMINFAIL) 
            {
                SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) & ~0x4000);
            } else if (UminOKstatus == CELLUMINOK) 
                {
                    SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) | 0x4000);
                }
            
            if (UmaxOKstatus == CELLUMAXFAIL) 
            {
                SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) & ~0x2000);
            } else if (UmaxOKstatus == CELLUMAXOK) 
                {
                    SetCPMREG(I2C_EVENTS, GetCPMREG(I2C_EVENTS) | 0x2000);
                }

            if (GB_Umin >= GB_Umax) 
                MAXMINFLAG = 1;
            else 
                MAXMINFLAG = 0;

            testbuttontime = timeticks + 5;

            DAC_poll();
            OUTPUT_poll();


            DELAY_poll();
        }
        
        if (!startupflag) 
        {
            if (timeticks > STARTUPTIME) 
            {
                startupflag = 1;
            }
        }
        
        if ((DLDISCflag == 1) || (TOFFFLAG == 1) || (DISCONNECTFLAG == 1) || (MISSEDINTERCELLFLAG == 1) || (MAXMINFLAG == 1)) 
        {

            if (timeticks > discontime) 
            {
                debug_print_str("\r\nVHAV:");
                debug_print_hex_u8(MAXMINFLAG);
                debug_print_hex_u8(DLDISCflag);
                debug_print_hex_u8(DISCflag);
                debug_print_hex_u8(TOFFFLAG);
                debug_print_hex_u8(DISCONNECTFLAG);
                debug_print_hex_u8(MISSEDINTERCELLFLAG);

                set_Uhav_OUTPUT(CELLUHAVFAIL);

                set_Umin_LT_OUTPUT(CELLUMINFAIL);
                set_Umax_LT_OUTPUT(CELLUMAXFAIL);



                debug_print_str("\r\nUHAVFAIL");
                __delay_ms(100);


                PWRUP = 0;
                __delay_ms(2000);
                PWRUP_IN();

            }
        }


        if (timeticks > testtime) {


            if ((CELL_connect[0] == 0) || (CELL_connect[1] == 0) ||
                    (CELL_connect[2] == 0) || (CELL_connect[3] == 0)) {
                MISSEDINTERCELLFLAG = 1;
                debug_print_str("\r\nMISSEDBUTTONCELLFLAG1!:");
                debug_print_hex_u8(CELL_connect[0]);
                debug_print_hex_u8(CELL_connect[1]);
                debug_print_hex_u8(CELL_connect[2]);
                debug_print_hex_u8(CELL_connect[3]);
            }

            if (MISSEDBUTTONFLAG == 1) {
                debug_print_str("\r\nMISSEDBUTTONCELLFLAG2!");
                MISSEDINTERCELLFLAG = 1;
            }


            debug_print_str("\r\n\r\nVMIN:");
            debug_print_udec(GB_Umin);
            debug_print_str("   VMAX:");
            debug_print_udec(GB_Umax);
            debug_print_str("   REALMIN:");
            debug_print_udec(testUmin);
            debug_print_str("   REALMAX:");
            debug_print_udec(testUmax);


            debug_print_str(" UMAXID:");
            debug_print_hex_u8(Umax_button());
            debug_print_str(" UMINID:");
            debug_print_hex_u8(Umin_button());

            debug_print_str("   UHAVMIN:");
            debug_print_udec(GB_Uhavmin);

            debug_print_str("   UHAVMAX:");
            debug_print_udec(GB_Uhavmax);

            debug_print_str("  NCEL:");
            debug_print_hex_u8(Missed_cell_ID);
            debug_print_str("  BCA:");

            for (i = 0; i < 16; i++) {
                debug_print_hex_u8(CELL_connect[i]);

            }
            for (i = 0; i < 16; i++) {
                debug_print_str("  VCHN:");
                debug_print_hex_u8(i);
                debug_print_str("=");
                debug_print_udec(CHN_voltage[i]);




            }

            debug_print_str("\r\nCUMAXWAIT:");
            debug_print_hex_u8(CONDUMAXWAIT);
            debug_print_str(" CUMAXNOW:");
            debug_print_hex_u8(CONDUMAXNOW);
            debug_print_str(" CUMINWAIT:");
            debug_print_hex_u8(CONDUMINWAIT);
            debug_print_str(" CUNDERMIN:");
            debug_print_hex_u8(CELLUNDERMIN);
            debug_print_str(" CABOVMAX:");
            debug_print_hex_u8(CELLABOVEMAX);





            testtime = timeticks + 50L;


        }
        TEST_CELL_poll();


    }

}
