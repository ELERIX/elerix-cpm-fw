#include "LEDs.h"
#include "xc.h"
#include "eeprom_regs.h"
#include "string.h"
#include "cpu_spec.h"
#include "events.h"



#define LED1_OUT()  TRISBbits.TRISB0 = 0
#define LED1_IN()  TRISBbits.TRISB0 = 1
#define LED1  LATBbits.LATB0

#define LED2_OUT()  TRISDbits.TRISD7=0
#define LED2_IN()  TRISDbits.TRISD7=1
#define LED2  LATDbits.LATD7

#define LED3_OUT()  TRISEbits.TRISE3=0
#define LED3_IN()  TRISEbits.TRISE3=1
#define LED3  LATEbits.LATE3

#define LED4_OUT()  TRISEbits.TRISE4=0
#define LED4  LATEbits.LATE4

#define LED5_OUT()  TRISEbits.TRISE5=0
#define LED5  LATEbits.LATE5

#define LED6_OUT()  TRISEbits.TRISE6=0
#define LED6  LATEbits.LATE6

#define LED7_OUT()  TRISEbits.TRISE7=0
#define LED7  LATEbits.LATE7

#define LED8_OUT()  TRISDbits.TRISD0=0
#define LED8  LATDbits.LATD0

#define LED9_OUT()  TRISHbits.TRISH2=0
#define LED9  LATHbits.LATH2

#define LED10_OUT()  TRISHbits.TRISH3=0
#define LED10  LATHbits.LATH3

#define LED11_OUT()  TRISDbits.TRISD1=0
#define LED11  LATDbits.LATD1

#define LED12_OUT()  TRISDbits.TRISD2=0
#define LED12  LATDbits.LATD2

#define LED13_OUT()  TRISDbits.TRISD3=0
#define LED13  LATDbits.LATD3

#define LED14_OUT()  TRISDbits.TRISD4=0
#define LED14  LATDbits.LATD4

#define LED15_OUT()  TRISDbits.TRISD5=0
#define LED15  LATDbits.LATD5

#define LED16_OUT()  TRISDbits.TRISD6=0
#define LED16  LATDbits.LATD6


#define REDLED_OUT()  TRISEbits.TRISE0=0
#define REDLED_IN()  TRISEbits.TRISE0=1
#define REDLED  LATEbits.LATE0

#define BLUELED_OUT()  TRISEbits.TRISE1=0
#define BLUELED_IN()  TRISEbits.TRISE1=1
#define BLUELED  LATEbits.LATE1


#define OFF   0
#define RED   1
#define BLUE  2

u8_t LED_stat[16];
u8_t temp_LED_stat[16];


void SetLED_statOFF(u8_t i)
{
    LED_stat[i] = OFF;
}

void SetLED_statBlue(u8_t i)
{
    LED_stat[i] = BLUE;
}

void SetLED_statRed(u8_t i)
{
    LED_stat[i] = RED;
}

void SetTempLED_statOFF(u8_t i)
{
    temp_LED_stat[i] = OFF;    
}

void SetTempLED_statBlue(u8_t i)
{
    temp_LED_stat[i] = BLUE;    
}

void SetTempLED_statRed(u8_t i)
{
    temp_LED_stat[i] = RED;    
}

void CopyLED_statFromTemp_LED_stat(void)
{
    memcpy(LED_stat, temp_LED_stat, 16);    
}

void init_LED(void) 
{
    LED1_OUT();
    LED2_OUT();
    LED3_OUT();
    LED4_OUT();
    LED5_OUT();
    LED6_OUT();
    LED7_OUT();
    LED8_OUT();
    LED9_OUT();
    LED10_OUT();
    LED11_OUT();
    LED12_OUT();
    LED13_OUT();
    LED14_OUT();
    LED15_OUT();
    LED16_OUT();
    BLUELED_OUT();
    REDLED_OUT();

    memset(LED_stat, OFF, 16);
    memset(temp_LED_stat, OFF, 16);
}

void start_LED(u8_t *CELL_connect) 
{
    if (CELL_connect[0]) LED1 = 1;
    if (CELL_connect[1]) LED2 = 1;
    if (CELL_connect[2]) LED3 = 1;
    if (CELL_connect[3]) LED4 = 1;
    if (CELL_connect[4]) LED5 = 1;
    if (CELL_connect[5]) LED6 = 1;
    if (CELL_connect[6]) LED7 = 1;
    if (CELL_connect[7]) LED8 = 1;
    if (CELL_connect[8]) LED9 = 1;
    if (CELL_connect[9]) LED10 = 1;
    if (CELL_connect[10]) LED11 = 1;
    if (CELL_connect[11]) LED12 = 1;
    if (CELL_connect[12]) LED13 = 1;
    if (CELL_connect[13]) LED14 = 1;
    if (CELL_connect[14]) LED15 = 1;
    if (CELL_connect[15]) LED16 = 1;
    
    BLUELED = 0;
    REDLED = 1;
    __delay_ms(1000);
    
    BLUELED = 1;
    REDLED = 0;
    __delay_ms(1000);
    
    REDLED = 0;
    BLUELED = 0;
    __delay_ms(2000);
}

void EVENT_LED(void) 
{
    u8_t LD = EepromEventCellID();
    
    LED1 = 0;
    LED2 = 0;
    LED3 = 0;
    LED4 = 0;
    LED5 = 0;
    LED6 = 0;
    LED7 = 0;
    LED8 = 0;
    LED9 = 0;
    LED10 = 0;
    LED11 = 0;
    LED12 = 0;
    LED13 = 0;
    LED14 = 0;
    LED15 = 0;
    LED16 = 0;
    
    if ((LD > 0) && (LD < 17)) 
    {
        if (LD == 1) LED1 = 1;
        if (LD == 2) LED2 = 1;
        if (LD == 3) LED3 = 1;
        if (LD == 4) LED4 = 1;
        if (LD == 5) LED5 = 1;
        if (LD == 6) LED6 = 1;
        if (LD == 7) LED7 = 1;
        if (LD == 8) LED8 = 1;
        if (LD == 9) LED9 = 1;
        if (LD == 10) LED10 = 1;
        if (LD == 11) LED11 = 1;
        if (LD == 12) LED12 = 1;
        if (LD == 13) LED13 = 1;
        if (LD == 14) LED14 = 1;
        if (LD == 15) LED15 = 1;
        if (LD == 16) LED16 = 1;

        if (EepromEventType() == EVENT_UMIN) 
        {
            BLUELED = 0;
            REDLED = 1;
        }
        
        if (EepromEventType() == EVENT_UMAX) 
        {
            BLUELED = 1;
            REDLED = 0;
        }
        
        __delay_ms(2000);
        REDLED = 0;
        BLUELED = 0;
        
        __delay_ms(1000);
    }


}

void LED_poll(void) 
{

    LED1 = 0;
    LED2 = 0;
    LED3 = 0;
    LED4 = 0;
    LED5 = 0;
    LED6 = 0;
    LED7 = 0;
    LED8 = 0;
    LED9 = 0;
    LED10 = 0;
    LED11 = 0;
    LED12 = 0;
    LED13 = 0;
    LED14 = 0;
    LED15 = 0;
    LED16 = 0;
    
    if (LED_stat[0] == BLUE) 
    {
        LED1 = 1;
        LED1_OUT();
    }
    
    if (LED_stat[1] == BLUE) LED2 = 1;    
    if (LED_stat[2] == BLUE) LED3 = 1;    
    if (LED_stat[3] == BLUE) LED4 = 1;
    if (LED_stat[4] == BLUE) LED5 = 1;
    if (LED_stat[5] == BLUE) LED6 = 1;
    if (LED_stat[6] == BLUE) LED7 = 1;
    if (LED_stat[7] == BLUE) LED8 = 1;
    if (LED_stat[8] == BLUE) LED9 = 1;
    if (LED_stat[9] == BLUE) LED10 = 1;
    if (LED_stat[10] == BLUE) LED11 = 1;
    if (LED_stat[11] == BLUE) LED12 = 1;
    if (LED_stat[12] == BLUE) LED13 = 1;
    if (LED_stat[13] == BLUE) LED14 = 1;
    if (LED_stat[14] == BLUE) LED15 = 1;
    if (LED_stat[15] == BLUE) LED16 = 1;




    BLUELED = 1;
    BLUELED_OUT();
    
    REDLED = 0;
    REDLED_IN();
    
    __delay_ms(4);
    
    BLUELED = 0;

    LED1 = 0;
    LED2 = 0;
    LED3 = 0;
    LED4 = 0;
    LED5 = 0;
    LED6 = 0;
    LED7 = 0;
    LED8 = 0;
    LED9 = 0;
    LED10 = 0;
    LED11 = 0;
    LED12 = 0;
    LED13 = 0;
    LED14 = 0;
    LED15 = 0;
    LED16 = 0;
    
    __delay_us(1000);
    
    if (LED_stat[0] == RED) LED1 = 1;
    if (LED_stat[1] == RED) LED2 = 1;
    if (LED_stat[2] == RED) LED3 = 1;
    if (LED_stat[3] == RED) LED4 = 1;
    if (LED_stat[4] == RED) LED5 = 1;
    if (LED_stat[5] == RED) LED6 = 1;
    if (LED_stat[6] == RED) LED7 = 1;
    if (LED_stat[7] == RED) LED8 = 1;
    if (LED_stat[8] == RED) LED9 = 1;
    if (LED_stat[9] == RED) LED10 = 1;
    if (LED_stat[10] == RED) LED11 = 1;
    if (LED_stat[11] == RED) LED12 = 1;
    if (LED_stat[12] == RED) LED13 = 1;
    if (LED_stat[13] == RED) LED14 = 1;
    if (LED_stat[14] == RED) LED15 = 1;
    if (LED_stat[15] == RED) LED16 = 1;

    REDLED = 1;
    REDLED_OUT();
    
    BLUELED = 0;
    BLUELED_IN();
    
    __delay_ms(4);
    
    REDLED = 0;
    REDLED_IN();
}
