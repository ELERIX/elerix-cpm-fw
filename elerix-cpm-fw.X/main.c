#include <xc.h>
#include <string.h>

/* Internal XTAL freq */
#define _XTAL_FREQ 32000000 /* Hz */

#undef BANKMASK
#define BANKMASK(addr) ((addr)&0x7F)

#define u32_t unsigned long
#define u8_t unsigned char
#define s8_t signed char
#define s16_t signed int

#define u16_t unsigned int

#define Lob(param) ((char *)&param)[0]
#define Hib(param) ((char *)&param)[1]
#define Higherb(param) ((char *)&param)[2]
#define Highestb(param) ((char *)&param)[3]

#define OFF   0
#define RED   1
#define BLUE  2

#define EEADDR_IDCELL     0
#define EEADDR_CELLV      1
#define EEADDR_IDNAME     3
#define EVENT_UMIN        0
#define EVENT_UMAX        1
#define EVENT_UMINHAV     2
#define EVENT_UMAXHAV     3
#define EEADDR_TOTALV     4

u8_t EVENTCELLID;
u16_t EVENTCELLV;
u8_t EVENTCELLTYPE;
u16_t EVENTCELLTOTALV;
u8_t DISCONNECTFLAG;
u8_t startflag;
u16_t GB_Umin = 0, GB_Umax = 0;
u16_t TGB_Umin = 0, TGB_Umax = 0;
u16_t testUmin, testUmax;


#define UMAX_hystereze  100
#define UMIN_hystereze  100


#define Umin0 1700
#define Umin1 1800
#define Umin2 1900
#define Umin3 2000
#define Umin4 2800
#define Umin5 2900
#define Umin6 3000
#define Umin7 3100
#define UminF 0xFFFF

#define Umax0 2500
#define Umax1 2600
#define Umax2 2700
#define Umax3 2800
#define Umax4 3500
#define Umax5 3600
#define Umax6 3700
#define Umax7 3800

#define UmaxF 0xFFFF



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

u8_t LED_stat[16];
u8_t temp_LED_stat[16];

u16_t CHN_voltage[16];

u8_t tempmil = 0, LEDchangeflag = 0;
u32_t timeticks = 0, miliseconds = 0, LEDchangetime = 0;

u8_t CELL_connect[16];
u8_t cellconnectflag = 0;

u8_t MISSEDINTERCELLFLAG;
u8_t MISSEDBUTTONFLAG;
u8_t Missed_cell_TEST;
u8_t Missed_cell_ID;
u8_t MAXMINFLAG;

#define DEBUG_CLOCK LATBbits.LATB7
#define DEBUG_DATA_OUT() TRISBbits.TRISB7 = 0
#define DEBUG_CLOCK_OUT() TRISBbits.TRISB6 = 0 
#define DEBUG_DATA LATBbits.LATB6


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



#define PUSH     PORTCbits.RC5
#define PUSH_IN() TRISCbits.TRISC5 = 1



#define PWRUP       LATFbits.LATF4
#define PWRUP_OUT() TRISFbits.TRISF4 = 0
#define PWRUP_IN()  TRISFbits.TRISF4 = 1


#define DIGIN1_IN()  TRISCbits.TRISC2=1
#define DIGIN1       PORTCbits.RC2

#define DIGIN2_IN()  TRISBbits.TRISB5=1
#define DIGIN2       PORTBbits.RB5




#define ADIN     PORTFbits.RF0
#define VOLTAGEPIN_IN() TRISFbits.TRISF0 = 1
#define VOLTAGEINPUT      0x28

#define UMININ     PORTGbits.RG7
#define UMINPIN_IN() TRISGbits.TRISG7 = 1
#define UMININPUT       0x37

#define UMIMAX     PORTFbits.RF1
#define UMAXPIN_IN() TRISFbits.TRISF1 = 1
#define UMAXINPUT      0x29


#define DISA_OUT()  TRISBbits.TRISB1=0
#define DISA  LATBbits.LATB1

#define SELA0_OUT()  TRISCbits.TRISC6=0
#define SELA0_IN()  TRISCbits.TRISC6=1
#define SELA0  LATCbits.LATC6

#define SELA1_OUT()  TRISCbits.TRISC0=0
#define SELA1_IN()  TRISCbits.TRISC0=1
#define SELA1  LATCbits.LATC0

#define SELA2_OUT()  TRISCbits.TRISC1=0
#define SELA2_IN()  TRISCbits.TRISC1=1
#define SELA2  LATCbits.LATC1

#define SELA3_OUT()  TRISAbits.TRISA4=0
#define SELA3_IN()  TRISAbits.TRISA4=1
#define SELA3  LATAbits.LATA4


#define DISB_OUT()  TRISAbits.TRISA2=0
#define DISB  LATAbits.LATA2

#define SELB0_OUT()  TRISHbits.TRISH0=0
#define SELB0_IN()  TRISHbits.TRISH0=1
#define SELB0  LATHbits.LATH0

#define SELB1_OUT()  TRISHbits.TRISH1=0
#define SELB1_IN()  TRISHbits.TRISH1=1
#define SELB1  LATHbits.LATH1

#define SELB2_OUT()  TRISAbits.TRISA0=0
#define SELB2_IN()  TRISAbits.TRISA0=1
#define SELB2  LATAbits.LATA0

#define SELB3_OUT()  TRISAbits.TRISA1=0
#define SELB3_IN()  TRISAbits.TRISA1=1
#define SELB3  LATAbits.LATA1



#define DAC1_SDA_TRIS                TRISFbits.TRISF3
#define DAC1_SDA_IN                  PORTFbits.RF3
#define DAC1_SDA_OUT                 LATFbits.LATF3

#define DAC2_SDA_TRIS                TRISFbits.TRISF2
#define DAC2_SDA_IN                  PORTFbits.RF2
#define DAC2_SDA_OUT                 LATFbits.LATF2

#define DAC_SCL_TRIS                 TRISGbits.TRISG6
#define DAC_SCL                      LATGbits.LATG6

#define MCP47X6_DEFAULT_ADDRESS           0xC0

#define MCP47X6_GAIN_MASK                 0xFE
#define MCP47X6_GAIN_1X                   0x00
#define MCP47X6_GAIN_2X                   0x01


#define MCP47X6_PWRDN_MASK                0xF9
#define MCP47X6_AWAKE                     0x00
#define MCP47X6_PWRDN_1K                  0x02
#define MCP47X6_PWRDN_100K                0x04
#define MCP47X6_PWRDN_500K                0x06


#define MCP47X6_VREF_MASK                 0xE7
#define MCP47X6_VREF_VDD                  0x00
#define MCP47X6_VREF_VREFPIN              0x10
#define MCP47X6_VREF_VREFPIN_BUFFERED     0x18

#define MCP47X6_CMD_MASK                  0x1F
#define MCP47X6_CMD_VOLDAC                0x00
#define MCP47X6_CMD_VOLALL                0x40
#define MCP47X6_CMD_VOLCONFIG             0x80
#define MCP47X6_CMD_ALL                   0x60

#define IQ_OUT()  TRISCbits.TRISC7=0
#define IQPIN  LATFbits.LATF7


#define UminP4_OUT()  TRISGbits.TRISG0 = 0
#define UminP4_IN()  TRISGbits.TRISG0 = 1
#define UminP4  LATGbits.LATG0
#define UminP3_OUT()  TRISGbits.TRISG1=0
#define UminP3_IN()  TRISGbits.TRISG1=1
#define UminP3  LATGbits.LATG1
#define UminP2_OUT()  TRISGbits.TRISG2=0
#define UminP2_IN()  TRISGbits.TRISG2=1
#define UminP2  LATGbits.LATG2
#define UminP1_OUT()  TRISGbits.TRISG3=0
#define UminP1_IN()  TRISGbits.TRISG3=1
#define UminP1  LATGbits.LATG3

#define UmaxP4_OUT()  TRISGbits.TRISG4=0
#define UmaxP4_IN()  TRISGbits.TRISG4=1
#define UmaxP4  LATGbits.LATG4
#define UmaxP3_OUT()  TRISFbits.TRISF7=0
#define UmaxP3_IN()  TRISFbits.TRISF7=1
#define UmaxP3  LATFbits.LATF7
#define UmaxP2_OUT()  TRISFbits.TRISF6=0
#define UmaxP2_IN()  TRISFbits.TRISF6=1
#define UmaxP2  LATFbits.LATF6
#define UmaxP1_OUT()  TRISFbits.TRISF5=0
#define UmaxP1_IN()  TRISFbits.TRISF5=1
#define UmaxP1  LATFbits.LATF5

#define UhavP3_OUT()  TRISBbits.TRISB2=0
#define UhavP3_IN()  TRISBbits.TRISB2=1
#define UhavP3  LATBbits.LATB2
#define UhavP2_OUT()  TRISBbits.TRISB3=0
#define UhavP2_IN()  TRISBbits.TRISB3=1
#define UhavP2  LATBbits.LATB3
#define UhavP1_OUT()  TRISBbits.TRISB4=0
#define UhavP1_IN()  TRISBbits.TRISB4=1
#define UhavP1  LATBbits.LATB4



#define DEBUG


#ifdef DEBUG
void debug_init();
void debug_send_byte(u8_t byte);
void debug_print_hex_u8(u8_t byt);
void debug_print_hex_u16(u16_t byte);
void debug_print_strROM(const char *s);
void debug_print_hex_u32(u32_t byte);
void debug_print_str(char *s);
#endif





u8_t PIN_UMIN12;
u8_t PIN_UMIN3;
u8_t PIN_UMIN4;

u8_t PIN_UMAX12;
u8_t PIN_UMAX3;
u8_t PIN_UMAX4;


u8_t PIN_EMERG12;
u8_t PIN_EMERG3;

void set_Umin4_OUTPUT(u8_t status) {
    if (status == CELLUMINOK) {
        UminP4_OUT();
        UminP4 = 1;

        PIN_UMIN4 = 1;

    } else {
        UminP4_OUT();
        UminP4 = 0;

        PIN_UMIN4 = 0;

    }
}

void set_Umax4_OUTPUT(u8_t status) {
    if (status == CELLUMINOK) {
        UmaxP4_OUT();
        UmaxP4 = 1;

        PIN_UMAX4 = 1;

    } else {
        UmaxP4_OUT();
        UmaxP4 = 0;


        PIN_UMAX4 = 0;
    }
}

void set_Umin_OUTPUT(u8_t status) {
    if (status == CELLUMINOK) {
        UminP3_OUT();
        UminP3 = 1;
        PIN_UMIN3 = 1;

    } else {

        UminP3_OUT();
        UminP3 = 0;
        PIN_UMIN3 = 0;
    }
}

void set_Umin_LT_OUTPUT(u8_t status) {
    if (status == CELLUMINOK) {

        UminP1_OUT();
        UminP1 = 1;
        __delay_ms(130);
        UminP1 = 0;
        UminP1_IN();
        PIN_UMIN12 = 1;

    } else {
        UminP2_OUT();
        UminP2 = 1;
        __delay_ms(130);
        UminP2 = 0;
        UminP2_IN();
        PIN_UMIN12 = 0;
    }
}

#define   PINUMIN12  1
#define   PINUMIN3   2
#define   PINUMIN4   3
#define   PINUMAX12  4
#define   PINUMAX3   5
#define   PINUMAX4   6
#define   PINEMER12  7
#define   PINEMER3   8

void reswitchoutputspinfromI2C(u8_t iopin) {

    if (iopin == PINUMIN12) {
        if (PIN_UMIN12) {
            UminP2_OUT();
            UminP2 = 1;
            __delay_ms(130);
            UminP2 = 0;
            UminP2_IN();
        } else {
            UminP1_OUT();
            UminP1 = 1;
            __delay_ms(130);
            UminP1 = 0;
            UminP1_IN();
        }
        PIN_UMIN12 = !PIN_UMIN12;
    }

    if (iopin == PINUMIN3) {
        if (PIN_UMIN3) {
            UminP3_OUT();
            UminP3 = 0;
        } else {
            UminP3_OUT();
            UminP3 = 1;
        }
        PIN_UMIN3 = !PIN_UMIN3;
    }



    if (iopin == PINUMIN4) {
        if (PIN_UMIN4) {
            UminP4_OUT();
            UminP4 = 0;
        } else {
            UminP4_OUT();
            UminP4 = 1;
        }
        PIN_UMIN4 = !PIN_UMIN4;
    }


    if (iopin == PINUMAX12) {
        if (PIN_UMAX12) {
            UmaxP2_OUT();
            UmaxP2 = 1;
            __delay_ms(130);
            UmaxP2 = 0;
            UmaxP2_IN();
        } else {
            UmaxP1_OUT();
            UmaxP1 = 1;
            __delay_ms(130);
            UmaxP1 = 0;
            UmaxP1_IN();
        }
        PIN_UMAX12 = !PIN_UMAX12;
    }
    if (iopin == PINUMAX3) {
        if (PIN_UMAX3) {
            UmaxP3_OUT();
            UmaxP3 = 0;
        } else {
            UmaxP3_OUT();
            UmaxP3 = 1;
        }
        PIN_UMAX3 = !PIN_UMAX3;
    }

    if (iopin == PINUMAX4) {
        if (PIN_UMAX4) {
            UmaxP4_OUT();
            UmaxP4 = 0;
        } else {
            UmaxP4_OUT();
            UmaxP4 = 1;
        }
        PIN_UMAX4 = !PIN_UMAX4;
    }

    if (iopin == PINEMER12) {
        if (PIN_EMERG12) {
            UhavP2_OUT();
            UhavP2 = 1;
            __delay_ms(130);
            UhavP2 = 0;
            UhavP2_IN();
        } else {
            UhavP1_OUT();
            UhavP1 = 1;
            __delay_ms(130);
            UhavP1 = 0;
            UhavP1_IN();
        }
        PIN_EMERG12 = !PIN_EMERG12;
    }
    if (iopin == PINEMER3) {
        if (PIN_EMERG3) {
            UhavP3_OUT();
            UhavP3 = 0;
        } else {
            UhavP3_OUT();
            UhavP3 = 1;
        }
        PIN_EMERG3 = !PIN_EMERG3;
    }


}

void offswitchoutputspinfromI2C(u8_t iopin) {
    if (iopin == PINUMIN12) {
        UminP2_OUT();
        UminP2 = 1;
        __delay_ms(130);
        UminP2 = 0;
        UminP2_IN();

        PIN_UMIN12 = 0;
    }
    if (iopin == PINUMIN3) {
        UminP3_OUT();
        UminP3 = 0;

        PIN_UMIN3 = 0;
    }


    if (iopin == PINUMIN4) {
        UminP4_OUT();
        UminP4 = 0;

        PIN_UMIN4 = 0;
    }

    if (iopin == PINUMAX12) {
        UmaxP2_OUT();
        UmaxP2 = 1;
        __delay_ms(130);
        UmaxP2 = 0;
        UmaxP2_IN();

        PIN_UMAX12 = 0;
    }
    if (iopin == PINUMAX3) {
        UmaxP3_OUT();
        UmaxP3 = 0;

        PIN_UMAX3 = 0;
    }

    if (iopin == PINUMAX4) {
        UmaxP4_OUT();
        UmaxP4 = 0;

        PIN_UMAX4 = 0;
    }

    if (iopin == PINEMER12) {
        UhavP2_OUT();
        UhavP2 = 1;
        __delay_ms(130);
        UhavP2 = 0;
        UhavP2_IN();

        PIN_EMERG12 = 0;
    }
    if (iopin == PINEMER3) {
        UhavP3_OUT();
        UhavP3 = 0;

        PIN_EMERG3 = 0;
    }


}

void onswitchoutputspinfromI2C(u8_t iopin) {

    if (iopin == PINUMIN12) {
        UminP2_OUT();
        UminP2 = 0;
        __delay_ms(130);
        UminP2 = 1;
        UminP2_IN();

        PIN_UMIN12 = 1;
    }
    if (iopin == PINUMIN3) {
        UminP3_OUT();
        UminP3 = 1;

        PIN_UMIN3 = 1;
    }


    if (iopin == PINUMIN4) {
        UminP4_OUT();
        UminP4 = 1;

        PIN_UMIN4 = 1;
    }

    if (iopin == PINUMAX12) {
        UmaxP2_OUT();
        UmaxP2 = 0;
        __delay_ms(130);
        UmaxP2 = 1;
        UmaxP2_IN();

        PIN_UMAX12 = 1;
    }
    if (iopin == PINUMAX3) {
        UmaxP3_OUT();
        UmaxP3 = 1;

        PIN_UMAX3 = 1;
    }

    if (iopin == PINUMAX4) {
        UmaxP4_OUT();
        UmaxP4 = 1;

        PIN_UMAX4 = 1;
    }

    if (iopin == PINEMER12) {
        UhavP2_OUT();
        UhavP2 = 0;
        __delay_ms(130);
        UhavP2 = 1;
        UhavP2_IN();

        PIN_EMERG12 = 1;
    }
    if (iopin == PINEMER3) {
        UhavP3_OUT();
        UhavP3 = 1;

        PIN_EMERG3 = 1;
    }


}

void set_Umax_OUTPUT(u8_t status) {
    if (status == CELLUMAXOK) {
        UmaxP3_OUT();
        UmaxP3 = 1;
        PIN_UMAX3 = 1;

    } else {
        UmaxP3_OUT();
        UmaxP3 = 0;
        PIN_UMAX3 = 0;

    }
}

void set_Umax_LT_OUTPUT(u8_t status) {
    if (status == CELLUMAXOK) {
        UmaxP1_OUT();
        UmaxP1 = 1;
        __delay_ms(130);
        UmaxP1 = 0;
        UmaxP1_IN();

        PIN_UMAX12 = 1;

    } else {
        UmaxP2_OUT();
        UmaxP2 = 1;
        __delay_ms(130);
        UmaxP2 = 0;
        UmaxP2_IN();
        PIN_UMAX12 = 0;

    }
}

void set_Uhav_OUTPUT(u8_t status) {
    if (status == CELLUHAVOK) {
        UhavP1_OUT();
        UhavP1 = 1;
        __delay_ms(130);
        UhavP1 = 0;
        UhavP1_IN();
        PIN_EMERG12 = 1;
        UhavP3_OUT();
        UhavP3 = 1;
        PIN_EMERG3 = 1;

    } else {
        UhavP2_OUT();
        UhavP2 = 1;
        __delay_ms(130);
        UhavP2 = 0;
        UhavP2_IN();
        PIN_EMERG12 = 0;

        UhavP3_OUT();
        UhavP3 = 0;
        PIN_EMERG3 = 0;

    }
}






#ifdef DEBUG

void debug_init() {
    DEBUG_DATA_OUT();
    DEBUG_CLOCK_OUT();

}

void debug_send_byte(u8_t byte) {
    u8_t i, parita, j, st;
    parita = 0;
    if (byte & 0x01) st = 1;
    else st = 0;
    for (i = 0; i < 8; i++) {
        DEBUG_CLOCK = 0;
        if (byte & 0x01) {
            DEBUG_DATA = 1;
            DEBUG_CLOCK = 1;
            parita++;
        } else {
            DEBUG_DATA = 0;
            DEBUG_CLOCK = 1;
        }
        byte = byte >> 1;
    }

    DEBUG_CLOCK = 0;
    for (j = 0; j < 1; j++) {
        ;
    }
    if (parita & 0x01) {
        DEBUG_DATA = 1;
        DEBUG_CLOCK = 1;
    } else {
        DEBUG_DATA = 0;
        DEBUG_CLOCK = 1;
    }
    DEBUG_CLOCK = 0;
    DEBUG_DATA = 0;

}

void debug_print_hex_u8(u8_t byt) {
    u8_t a, b, c;
    c = byt;
    a = c & 0x0f;
    b = (c & 0xF0);
    b = b >> 4;
    b = b & 0xf;
    if (b > 9) debug_send_byte(b + 55);
    else debug_send_byte(b + 48);

    if (a > 9) debug_send_byte(a + 55);
    else debug_send_byte(a + 48);
}

void debug_print_hex_u16(u16_t byte) {
    debug_print_hex_u8(byte >> 8);
    debug_print_hex_u8(byte);
}

void debug_print_hex_u32(u32_t byte) {
    debug_print_hex_u16(byte >> 16);
    debug_print_hex_u16(byte);
}

void debug_print_str(char *s) {
    u16_t i, len;
    len = strlen((const char *)s);
    for (i = 0; i < len; i++) debug_send_byte(*s++);
}

void debug_print_strROM(const char *s) {
    u16_t i, len;
    len = 10000;
    while (len--) {
        if (*s == 0) break;
        debug_send_byte(*s++);
    }
}

void debug_print_sdec(signed int prd) {
    u8_t i, f;
    signed int t;
    u16_t wrd;



    if (prd & 0x1000) {
        debug_send_byte('-');
        t = prd & 0x7fff;
        prd = 0x8000 - t;

    }

    wrd = (u16_t) prd;

    f = 0;
    if (wrd >= 10000) {
        i = wrd / 10000;
        debug_send_byte(i + 48);
        wrd = wrd % 10000;
        f = 1;
    }

    if ((wrd >= 1000) || f) {
        i = wrd / 1000;
        debug_send_byte(i + 48);
        wrd = wrd % 1000;
        f = 1;
    }

    if ((wrd >= 100) || f) {
        i = wrd / 100;
        debug_send_byte(i + 48);
        wrd = wrd % 100;
        f = 1;
    }

    if ((wrd >= 10) || f) {
        i = wrd / 10;
        debug_send_byte(i + 48);
        wrd = wrd % 10;

    }

    debug_send_byte(wrd + 48);


}

void debug_print_udec(unsigned int prd) {
    u8_t i, f;
    signed int t;
    u16_t wrd;

    wrd = prd;

    f = 0;
    if (wrd >= 10000) {
        i = wrd / 10000;
        debug_send_byte(i + 48);
        wrd = wrd % 10000;
        f = 1;
    }

    if ((wrd >= 1000) || f) {
        i = wrd / 1000;
        debug_send_byte(i + 48);
        wrd = wrd % 1000;
        f = 1;
    }

    if ((wrd >= 100) || f) {
        i = wrd / 100;
        debug_send_byte(i + 48);
        wrd = wrd % 100;
        f = 1;
    }

    if ((wrd >= 10) || f) {
        i = wrd / 10;
        debug_send_byte(i + 48);
        wrd = wrd % 10;

    }

    debug_send_byte(wrd + 48);


}

void debug_print_float(double b, u8_t des) {
    u8_t i, j, id, zero, sgn, nuly;
    char OString[30];
    u32_t exp;
    u8_t temp;
    u32_t ccast;
    u32_t tccast, dccast;

    memset(&OString, 0x00, 30);

    id = 0;
    zero = 0;
    for (i = 0; i<sizeof (OString); i++) OString[i] = 0x00;
    sgn = 0;
    if (((float) b) < 0) {
        OString[id++] = '-';
        b = b* -1;
        sgn = 1;
    }


    exp = 1000000000;
    ccast = (long int) b;
    tccast = ccast;
    dccast = ccast;

    for (i = 0; i < 10; i++) {
        j = ccast / exp;
        if (!((!j) && (!zero))) {
            OString[id++] = j + 48;
            zero = 1;
        }
        if (zero) ccast = ccast % exp;
        exp = exp / 10;

    }

    if (!tccast) OString[id++] = '0';
    if (des) OString[id++] = '.';


    nuly = 0;
    for (i = 0; i < des; i++) {
        b = b - tccast;
        b = b * 10;
        OString[id] = (u8_t) b + 48;
        if (OString[id] == 48) nuly++;
        id++;
        tccast = b;
    }

    OString[id++] = 0;

    if (!dccast) {
        if ((nuly == des) && (sgn)) {
            for (i = 0; i < id; i++) {
                OString[i] = OString[i + 1];
            }
        }
    }
    debug_print_str(OString);
}



#endif

void I2C1_Initialize(void) {
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;

    IOCCFbits.IOCCF4 = 0;
    IOCCNbits.IOCCN4 = 1;

    IOCCFbits.IOCCF3 = 0;
    PIR0bits.IOCIF = 0;
    PIE0bits.IOCIE = 1;


}
u8_t I2C1_slaveWriteData;


u8_t retval = 0;
u8_t CHK1, CHK2;
#define   I2C_WAITING        0
#define   I2C_START_DETECTED 1
#define   I2C_STOP_DETECTED  2
#define   I2C_READ           3
#define   I2C_WRITE          4

#define   I2C_TIMEOUT  5
#define   I2C_ADDR_MISMATCH  0xFF
#define SDA PORTCbits.RC4
#define SCL PORTCbits.RC3


u8_t bitcnt = 0, i;
u8_t i2cstatus = 0;
u8_t tempSDA, tempVALBYTE;
u8_t REGCHK, REGPOINTER;
u8_t *VALBYTE, I2CVAL;
u16_t timeout;
u8_t SDABUSHI;
u8_t I2C_PROCESS;
u8_t READ = 1;
u8_t READCONT = 2;
u8_t WRITE = 3;

u8_t UNKW = 0;

u8_t i2cdatasekvence = 0;

u8_t I2CREGID = 0;
u16_t I2CREGVAL = 0;
u32_t WEBPOTMINtimeout;
u32_t WEBPOTMAXtimeout;

#define I2C_DEVADDR           0x2A
u8_t WR_I2C_DEVADDR = I2C_DEVADDR << 1;
u8_t RD_I2C_DEVADDR = (I2C_DEVADDR << 1) | 0x01;

#define maxreg 37
#define wrregfrom 21
u16_t CPMREGDATA[maxreg];
u16_t TEMPCPMREGDATA[maxreg];
//registry
#define I2C_U1CELL       1   //read only
#define I2C_U2CELL       2   //read only
#define I2C_U3CELL       3   //read only
#define I2C_U4CELL       4   //read only
#define I2C_U5CELL       5   //read only
#define I2C_U6CELL       6   //read only
#define I2C_U7CELL       7   //read only
#define I2C_U8CELL       8   //read only
#define I2C_U9CELL       9   //read only
#define I2C_U10CELL      10  //read only
#define I2C_U11CELL      11  //read only
#define I2C_U12CELL      12  //read only
#define I2C_U13CELL      13  //read only
#define I2C_U14CELL      14  //read only
#define I2C_U15CELL      15  //read only
#define I2C_U16CELL      16  //read only
#define I2C_UCELLTOTAL   17  //read only
#define I2C_EVENTS       18  //zde jsou bity eventu umin,Ok,umaxOk, emergOk (3 bity)
#define I2C_UMINPOT      19  //napeti ktere je nastaveno na potacich (min) jen pro READ
#define I2C_UMAXPOT      20  //napeti ktere je nastaveno na potaku max jen pro READ, WRITE has no effect
//nasledujici registry  jsou nahrady misto potaku, tedy s tc840, platnost nastaveni 1minuta, od posledniho zapisu
//pote se setuji na ffff
#define I2C_RUMINPOT     21  //remote i2c napeti ktere je nastaveno na potacich (min) , pokud neni 0xFFFF taxe bere v potaz toto napeti
#define I2C_RUMAXPOT     22  //napeti ktere je nastaveno dalkove misto potaku, pokud je v mezich paxe bere toto napeti.

#define RESWITCH         0xA5A5
#define ONSWITCH         0xA115          //2020 zmena
#define OFFSWITCH        0xA005          //2020 zmena

//nasladujicich 6 registru vraci stav 0 nebo 0x0001 , WRITE 0 nebo 1 jej JENOM nuluje(zatim bez nastaveni rele),
// ale WRITE hodnoty 0xa5a5 jej nastavuje na opacny stav
#define I2C_UMIN12       23
#define I2C_UMIN3        24
#define I2C_UMIN4        25 //dodelavka 01 2020
#define I2C_UMAX12       26
#define I2C_UMAX3        27
#define I2C_UMAX4        28 //dodelavka 01 2020
#define I2C_EMERG12      29
#define I2C_EMERG3       30
#define I2C_RESET        31       //reset board, nastavuje do stavu po zapnuti, cte se 0 nebo 1
#define I2C_TURNOFF      32       //write only turnoff board, vypnuti desky


//dodelavka 06 2020  /read only
#define I2C_IDEVCELL      33       //cidlo clanku na kterem udalost vznikla U8
#define I2C_CELLV         34       //jeho napeti u16 v mV
#define I2C_IDTYPE        35       //jmeno udalosti , 0 umin, 1 umax, 2 uminhav, 3 umaxhav
#define I2C_EVTOTALV      36       ///celkove napeti baterie v dobe udalosti U16 v mv





#define Lo(param) ((char *)&param)[0]
#define Hi(param) ((char *)&param)[1]


u8_t trd = 0;

u8_t UMIN_WR;
u8_t UMAX_WR;

u8_t I2CWRITEFLAG;

void wait_for_SCL() {
    timeout = 0x00FF;
    while (SCL) {
        if (!timeout) {
            TRISCbits.TRISC4 = 1;
            IOCCNbits.IOCCN4 = 1;
            return;
        } else timeout--;
    }
}

void send_ACK() {
    TRISCbits.TRISC4 = 0;
    LATCbits.LATC4 = 0;
    wait_for_SCL();
    TRISCbits.TRISC4 = 1;

}
u8_t ti, en_sda;

//void interrupt() {
void __interrupt () isr(void) {

    if (PIR0bits.IOCIF) {
        PIR0bits.IOCIF = 0;

        if (IOCCFbits.IOCCF4) {
            IOCCFbits.IOCCF4 = 0;
            if (SCL) {
                IOCCNbits.IOCCN4 = 0;
                timeout = 0x00FF;
                while (SCL) {
                    if (timeout) timeout--;
                    else {
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
        if (IOCCFbits.IOCCF3) {
            IOCCPbits.IOCCP3 = 0;
            IOCCFbits.IOCCF3 = 0;
            tempSDA = SDA;

            if (i2cstatus == I2C_START_DETECTED) {
                if (!i2cdatasekvence) {
                    if (bitcnt < 8) {
                        retval = (retval << 1) | SDA;
                        bitcnt++;
                    } else if (bitcnt == 8) {
                        en_sda = 1;
                        if (retval == WR_I2C_DEVADDR) {
                            send_ACK();
                            if (IOCCNbits.IOCCN4 == 0) {
                                IOCCPbits.IOCCP3 = 1;
                            }
                            i2cdatasekvence = 1;
                            i2cstatus = I2C_WRITE;
                            en_sda = 0;
                        } else if (retval == RD_I2C_DEVADDR) {
                            send_ACK();
                            if (IOCCNbits.IOCCN4 == 0) {
                                IOCCPbits.IOCCP3 = 1;
                            }
                            i2cdatasekvence = 1;
                            i2cstatus = I2C_READ;
                            en_sda = 0;
                        }
                        bitcnt = 0;
                        if (retval == RD_I2C_DEVADDR) {
                            for (ti = 0; ti < maxreg; ti++) {
                                TEMPCPMREGDATA[ti] = CPMREGDATA[ti];
                            }
                            VALBYTE = (u8_t*) &TEMPCPMREGDATA[I2CREGID];
                            I2CVAL = *VALBYTE;
                            REGPOINTER = 0;
                            REGCHK = I2CVAL;
                        }
                        retval = 0;
                        if (en_sda) IOCCNbits.IOCCN4 = 1;
                        return;
                    }
                }
            } else if (i2cstatus == I2C_READ) {

                if (bitcnt < 8) {
                    bitcnt++;
                    if (I2CVAL & 0x80) {
                        TRISCbits.TRISC4 = 1;
                    } else {
                        TRISCbits.TRISC4 = 0;
                        LATCbits.LATC4 = 0;
                    }
                    wait_for_SCL();
                    I2CVAL = I2CVAL << 1;

                    if (IOCCNbits.IOCCN4 == 0) {
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
                            *VALBYTE++;
                            I2CVAL = *VALBYTE;
                            REGCHK = REGCHK^I2CVAL;
                        }

                        IOCCPbits.IOCCP3 = 1;
                    }
                }
                return;
            } else if (i2cstatus == I2C_WRITE) {
                if (bitcnt < 8) {
                    retval = (retval << 1) | SDA;
                    bitcnt++;
                } else if (bitcnt == 8) {
                    send_ACK();
                    if (IOCCNbits.IOCCN4 == 0) {
                        IOCCPbits.IOCCP3 = 1;
                    }
                    bitcnt = 0;
                    if (i2cdatasekvence == 1) I2CREGID = retval;
                    else if (i2cdatasekvence == 2) {
                        Lob(I2CREGVAL) = retval;
                        CHK1 = retval;
                    } else if (i2cdatasekvence == 3) {
                        Hib(I2CREGVAL) = retval;
                        CHK2 = retval;
                    } else if (i2cdatasekvence == 4) {
                        CHK1 = CHK1^CHK2;
                        if (retval == CHK1) I2CWRITEFLAG = 1;
                    }

                    i2cdatasekvence++;
                    return;
                }

            }
            timeout = 0x00FF;
            while (SCL) {
                if ((tempSDA != SDA)) {
                    retval = 0;
                    if (SDA) {
                        if (I2CWRITEFLAG) {
                            if ((I2CREGID >= wrregfrom) && (I2CREGID <= maxreg)) CPMREGDATA[I2CREGID] = I2CREGVAL;
                            if (I2CREGID == I2C_RUMINPOT) {
                                UMIN_WR = 1;
                            } else if (I2CREGID == I2C_RUMAXPOT) {
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
                } else if (!timeout) {
                    i2cstatus = I2C_TIMEOUT;
                    retval = 0;
                    bitcnt = 0;
                    IOCCNbits.IOCCN4 = 1;
                    return;
                } else timeout--;


            }
            IOCCPbits.IOCCP3 = 1;
        }



    }


    if (PIR4bits.TMR1IF) {
        PIR4bits.TMR1IF = 0;
        TMR1H = 0xE0;
        TMR1L = 0xC0;
        tempmil++;
        if (tempmil == 100) {
            timeticks++;
            tempmil = 0;
        }
        miliseconds++;
        return;

    }
}


u8_t diginf1 = 0;
u32_t digintime1;

u8_t diginf2 = 0;
u32_t digintime2;

void init_outputstatus();
void events_reset();

void triginiput1() {

    if (DIGIN1) {
        if (diginf1 == 0) {
            diginf1 = 1;
            digintime1 = timeticks;
        }
    }


    if (diginf1 == 1) {
        if (!DIGIN1) {
            if (timeticks < (digintime1 + 30)) diginf1 = 0; //300 msec
            else {
                debug_print_str("\r\nDIGIN1ACT!");
                diginf1 = 0;
                init_outputstatus();
                events_reset();
            }
        }
    }

}

void triginiput2() {

    if (DIGIN2) {

        if (diginf2 == 0) {
            diginf2 = 1;
            digintime2 = timeticks;
        }
    }


    if (diginf2 == 1) {
        if (!DIGIN2) {
            if (timeticks < (digintime2 + 30)) diginf1 = 0;
            else {
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

void start_timer() {
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

void init_LED() {

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

    memset(&LED_stat, OFF, 16);
    memset(&temp_LED_stat, OFF, 16);




}

void start_LED() {
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

void EVENT_LED() {
    u8_t LD;

    LD = eeprom_read(EEADDR_IDCELL);
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
    if ((LD > 0) && (LD < 17)) {
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

        if (eeprom_read(EEADDR_IDNAME) == EVENT_UMIN) {
            BLUELED = 0;
            REDLED = 1;
        }
        if (eeprom_read(EEADDR_IDNAME) == EVENT_UMAX) {
            BLUELED = 1;
            REDLED = 0;
        }
        __delay_ms(2000);
        REDLED = 0;
        BLUELED = 0;
        __delay_ms(1000);
    }


}

void save_eeprom_event() {

    eeprom_write(EEADDR_IDCELL, EVENTCELLID);
    eeprom_write(EEADDR_CELLV + 1, EVENTCELLV);

    eeprom_write(EEADDR_CELLV, EVENTCELLV >> 8);

    eeprom_write(EEADDR_IDNAME, EVENTCELLTYPE);
    eeprom_write(EEADDR_TOTALV + 1, EVENTCELLTOTALV);
    eeprom_write(EEADDR_TOTALV, EVENTCELLTOTALV >> 8);

    __delay_ms(20);
    CPMREGDATA[I2C_IDEVCELL] = EVENTCELLID;
    CPMREGDATA[I2C_CELLV] = EVENTCELLV;
    CPMREGDATA[I2C_IDTYPE] = EVENTCELLTYPE;
    CPMREGDATA[I2C_EVTOTALV] = EVENTCELLTOTALV;


}

void events_reset() {
    CPMREGDATA[I2C_IDEVCELL] = 0xFFFF;
    CPMREGDATA[I2C_CELLV] = 0xFFFF;
    CPMREGDATA[I2C_IDTYPE] = 0xFFFF;
    CPMREGDATA[I2C_EVTOTALV] = 0xFFFF;
    eeprom_write(EEADDR_IDCELL, 0xFF);
    eeprom_write(EEADDR_CELLV, 0xFF);
    eeprom_write(EEADDR_CELLV + 1, 0xFF);
    eeprom_write(EEADDR_IDNAME, 0xFF);
    eeprom_write(EEADDR_TOTALV, 0xFF);
    eeprom_write(EEADDR_TOTALV + 1, 0xFF);
    __delay_ms(20);


}

void eeprom_event_i2c_register_initialize() {
    u16_t LD;
    LD = eeprom_read(EEADDR_IDCELL);
    if ((LD > 0) && (LD < 17)) {
        CPMREGDATA[I2C_IDEVCELL] = (u16_t) (LD);
        CPMREGDATA[I2C_CELLV] = (eeprom_read(EEADDR_CELLV) << 8);
        CPMREGDATA[I2C_CELLV] |= eeprom_read(EEADDR_CELLV + 1);
        CPMREGDATA[I2C_IDTYPE] = eeprom_read(EEADDR_IDNAME);
        CPMREGDATA[I2C_EVTOTALV] = (eeprom_read(EEADDR_TOTALV) << 8);
        CPMREGDATA[I2C_EVTOTALV] |= eeprom_read(EEADDR_TOTALV + 1);
    }

}




u8_t fl = 0;

void LED_poll() {

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
    if (LED_stat[0] == BLUE) {
        LED1 = 1;
        LED1_OUT();
        fl = 1;
    }
    if (LED_stat[1] == BLUE) {
        LED2 = 1;
    }
    if (LED_stat[2] == BLUE) {
        LED3 = 1;
    }
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
    if (LED_stat[0] == RED) {
        LED1 = 1;
    }
    if (LED_stat[1] == RED) {
        LED2 = 1;
    }
    if (LED_stat[2] == RED) {
        LED3 = 1;
    }
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

void multiplex_init() {
    DISA = 1;
    DISA_OUT();
    DISB = 1;
    DISB_OUT();
    SELB0 = 1;
    SELB1 = 1;
    SELB2 = 1;
    SELB3 = 1;
    SELB0_OUT();
    SELB1_OUT();
    SELB2_OUT();
    SELB3_OUT();

    SELA0 = 1;
    SELA1 = 1;
    SELA2 = 1;
    SELA3 = 1;

    SELA0_OUT();
    SELA1_OUT();
    SELA2_OUT();
    SELA3_OUT();

    memset(&CHN_voltage, 0x00, 32);


}

#define AGND_CHN  17
#define VREF_CHN  18

void set_CELL_channel(u8_t chn) {


    if (chn == 1) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 0;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 0;
        SELB0 = 0;
    } else
        if (chn == 2) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 0;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 0;
        SELB0 = 0;
    } else
        if (chn == 3) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 0;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 0;
        SELB0 = 1;
    } else
        if (chn == 4) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 1;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 0;
        SELB0 = 1;
    } else
        if (chn == 5) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 1;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 1;
        SELB0 = 0;
    } else
        if (chn == 6) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 1;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 1;
        SELB0 = 0;
    } else
        if (chn == 7) {
        SELA3 = 0;
        SELA2 = 0;
        SELA1 = 1;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 1;
        SELB0 = 1;
    } else
        if (chn == 8) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 0;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 0;
        SELB1 = 1;
        SELB0 = 1;
    } else
        if (chn == 9) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 0;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 0;
        SELB0 = 0;
    } else
        if (chn == 10) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 0;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 0;
        SELB0 = 0;
    } else
        if (chn == 11) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 0;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 0;
        SELB0 = 1;
    } else
        if (chn == 12) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 1;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 0;
        SELB0 = 1;
    } else
        if (chn == 13) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 1;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 1;
        SELB0 = 0;
    } else
        if (chn == 14) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 1;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 1;
        SELB0 = 0;
    } else
        if (chn == 15) {
        SELA3 = 0;
        SELA2 = 1;
        SELA1 = 1;
        SELA0 = 1;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 1;
        SELB0 = 1;
    } else
        if (chn == 16) {
        SELA3 = 1;
        SELA2 = 0;
        SELA1 = 0;
        SELA0 = 0;
        SELB3 = 0;
        SELB2 = 1;
        SELB1 = 1;
        SELB0 = 1;
    }
    else
        if (chn == AGND_CHN) {
        SELA3 = 1;
        SELA2 = 0;
        SELA1 = 0;
        SELA0 = 1;
        SELB3 = 1;
        SELB2 = 0;
        SELB1 = 0;
        SELB0 = 1;
    } else
        if (chn == VREF_CHN) {
        SELA3 = 1;
        SELA2 = 0;
        SELA1 = 1;
        SELA0 = 0;
        SELB3 = 1;
        SELB2 = 0;
        SELB1 = 1;
        SELB0 = 0;
    }


    SELB0_OUT();
    SELB1_OUT();
    SELB2_OUT();
    SELB3_OUT();


    SELA0_OUT();
    SELA1_OUT();
    SELA2_OUT();
    SELA3_OUT();

}

u16_t adc_getval(u8_t channel) {
    ADPCH = channel;
    ADCON0bits.ADON = 1;
    ADCON2bits.ADACLR = 1;
    while (ADCON2bits.ADACLR);
    ADCON0bits.GO = 1;
    while (ADCON0bits.GO);
    return ((ADRESH << 8) + ADRESL);


}

u16_t TEST_CELL(u8_t chn) {
    u32_t suma, result;
    u8_t i;
    u16_t testtemp, max;
    suma = 0;


    set_CELL_channel(AGND_CHN);
    DISA = 0;
    DISB = 0;
    DISA_OUT();
    DISB_OUT();

    __delay_ms(6);

    DISA = 1;
    DISB = 1;
    DISA_OUT();
    DISB_OUT();

    set_CELL_channel(chn);


    DISA = 0;
    DISB = 0;
    DISA_OUT();
    DISB_OUT();
    __delay_ms(6);
    for (i = 0; i < 20; i++) {
        suma += adc_getval(VOLTAGEINPUT);
    }
    result = suma / 20;
    testtemp = result;

    DISA = 1;
    DISB = 1;
    DISA_OUT();
    DISB_OUT();
    return testtemp;

}


u32_t voltsuma = 0;
u8_t CONDUMAXWAIT, CONDUMAXNOW;
u8_t CONDUMINWAIT, CONDUMINNOW;
u8_t CELLUNDERMIN, CELLABOVEMAX;

void TEST_CELL_poll() {
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
        if (!Missed_cell_TEST) Missed_cell_ID = GB_chn;

        if ((test >= GB_Umin) && (test <= GB_Umax)) temp_LED_stat[GB_chn - 1] = OFF;
        else {
            temp_LED_stat[GB_chn - 1] = OFF;
            if (test <= GB_Umin) temp_LED_stat[GB_chn - 1] = RED;
            if (test >= GB_Umax) {
                temp_LED_stat[GB_chn - 1] = BLUE;

            }

        }

        CPMREGDATA[GB_chn] = test;

    } else {
        temp_LED_stat[GB_chn - 1] = OFF;
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


        if (voltsuma > 0xFFFF) voltsuma = 0xFFFF;
        CPMREGDATA[I2C_UCELLTOTAL] = (u16_t) voltsuma;

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

u8_t Umin_button() {
    u8_t i;
    u16_t temp;
    u32_t suma;
    suma = 0;



    for (i = 0; i < 50; i++) {
        suma += adc_getval(UMININPUT);
    }
    temp = suma / 50;

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

u8_t Umax_button() {
    u8_t i;
    u16_t temp;
    u32_t suma;
    suma = 0;
    for (i = 0; i < 50; i++) {
        suma += adc_getval(UMAXINPUT);
    }
    temp = suma / 50;

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


}

void init_adc() {
    PMD2 = 0xFF;
    PMD2bits.ADCMD = 0;
    PMD3 = 0xFF;
    PMD1 = 0xFF;
    PMD4 = 0xFF;
    PMD5 = 0xFF;
    ANSELF = 0x03;
    ANSELG = 0x80;
    ANSELB = 0x00;
    ANSELC = 0x00;
    ANSELD = 0x00;
    ANSELE = 0x00;
    VOLTAGEPIN_IN();
    UMINPIN_IN();
    UMAXPIN_IN();
    ADRESH = 0x00;
    ADRESL = 0x00;
    ADCLK = 0x07;

    ADCAP = 0x0F;
    ADLTHL = 0x00;
    ADLTHH = 0x00;
    ADUTHL = 0x00;
    ADUTHH = 0x00;
    ADSTPTL = 0x00;
    ADSTPTH = 0x00;
    ADCON1 = 0x00;
    ADCON2 = 0x00;

    ADCON3 = 0x0F;
    ADCON0 = 0xC4;

    ADPREH = 0x00;
    ADPREL = 0x00;
    ADACQH = 0x00;
    ADACQL = 0x00;
    ADREF = 0x02;
    ANSELAbits.ANSA3 = 1;




}

u8_t pushf = 0;
u32_t pushtime = 0;
u8_t LEDOFFflag = 0;
u32_t LEDtime;

u8_t GBchn = 0, GBstatus = 0;

void DACs_init();

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

void delay() {
    u8_t i;
    for (i = 0; i < 10; i++) asm("NOP");

}

void dac_i2c1_stop(void) {

    DAC1_SDA_TRIS = 0;
    DAC_SCL_TRIS = 0;

    DAC_SCL = 0;
    delay();
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC1_SDA_TRIS = 1;
    DAC1_SDA_OUT = 1;
    delay();
}

void dac_i2c1_start(void) {
    DAC_SCL_TRIS = 0;
    DAC_SCL = 0;
    DAC1_SDA_TRIS = 0;
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 0;
    delay();

}

void dac_i2c1_write(u8_t o_byte) {
    u8_t n;
    for (n = 0; n < 8; n++) {
        DAC_SCL = 0;
        delay();
        if (o_byte & 0x80) {
            DAC1_SDA_OUT = 1;
            delay();
        } else {
            DAC1_SDA_OUT = 0;
            delay();
        }
        DAC_SCL = 1;
        delay();
        o_byte = o_byte << 1;
        DAC_SCL = 0;

    }
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();

}

void dac_i2c1_nack(void) {
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

void dac_i2c1_ack(void) {
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

u8_t dac_i2c1_read() {
    u8_t i_byte = 0, n;
    DAC1_SDA_TRIS = 1;

    WPUFbits.WPUF3 = 1;
    for (n = 0; n < 8; n++) {
        i_byte <<= 1;
        DAC_SCL = 0;
        delay();
        DAC_SCL = 1;
        delay();
        if (DAC1_SDA_IN) i_byte |= 0x01;
        delay();
        DAC_SCL = 0;
        delay();
    }
    DAC1_SDA_TRIS = 0;

    WPUFbits.WPUF3 = 0;
    return (i_byte);
}

void dac_i2c2_stop(void) {

    DAC2_SDA_TRIS = 0;
    DAC_SCL_TRIS = 0;

    DAC_SCL = 0;
    delay();
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC2_SDA_TRIS = 1;
    DAC2_SDA_OUT = 1;
    delay();
}

void dac_i2c2_start(void) {
    DAC_SCL_TRIS = 0;
    DAC_SCL = 0;
    DAC2_SDA_TRIS = 0;
    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 0;
    delay();

}

void dac_i2c2_write(u8_t o_byte) {
    u8_t n;
    for (n = 0; n < 8; n++) {
        DAC_SCL = 0;
        delay();
        if (o_byte & 0x80) {
            DAC2_SDA_OUT = 1;
            delay();
        } else {
            DAC2_SDA_OUT = 0;
            delay();
        }
        DAC_SCL = 1;
        delay();
        o_byte = o_byte << 1;
        DAC_SCL = 0;

    }

    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();

}

void dac_i2c2_nack(void) {
    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

void dac_i2c2_ack(void) {
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

u8_t dac_i2c2_read() {
    u8_t i_byte = 0, n;
    DAC2_SDA_TRIS = 1;

    WPUFbits.WPUF2 = 1;
    for (n = 0; n < 8; n++) {
        i_byte <<= 1;
        DAC_SCL = 0;
        delay();

        DAC_SCL = 1;
        delay();
        if (DAC2_SDA_IN) i_byte |= 0x01;
        delay();
        DAC_SCL = 0;
        delay();
    }
    DAC2_SDA_TRIS = 0;

    WPUFbits.WPUF2 = 0;
    return (i_byte);
}

u8_t DAC1config;
u8_t DAC2config;

void write_DAC1_configreg(u8_t cmnd) {
    dac_i2c1_start();
    dac_i2c1_write(MCP47X6_DEFAULT_ADDRESS);
    dac_i2c1_write(cmnd | MCP47X6_CMD_VOLALL);
    dac_i2c1_stop();
}

void write_DAC2_configreg(u8_t cmnd) {
    dac_i2c2_start();
    dac_i2c2_write(MCP47X6_DEFAULT_ADDRESS);
    dac_i2c2_write(cmnd | MCP47X6_CMD_VOLALL);
    dac_i2c2_stop();
}

void DAC1_powerdown(u8_t pdOutR) {
    write_DAC1_configreg((pdOutR & MCP47X6_PWRDN_MASK) | (pdOutR & !MCP47X6_PWRDN_MASK));
}

void DAC1_setoutputlevel(u16_t level) {
    if (level > 0x1000) level = 0x0FFF;
    dac_i2c1_start();
    dac_i2c1_write(MCP47X6_DEFAULT_ADDRESS);
    dac_i2c1_write(DAC1config);
    dac_i2c1_write((u8_t) ((level >> 4) & 0xFF));
    dac_i2c1_write((u8_t) ((level << 4) & 0xF0));
    dac_i2c1_stop();
    DAC1_SDA_OUT = 1;
    WPUFbits.WPUF3 = 1;
    DAC1_SDA_TRIS = 1;
}

void DAC2_setoutputlevel(u16_t level) {
    if (level > 0x1000) level = 0x0FFF;
    dac_i2c2_start();
    dac_i2c2_write(MCP47X6_DEFAULT_ADDRESS);
    dac_i2c2_write(DAC2config);
    dac_i2c2_write((u8_t) ((level >> 4) & 0xFF));
    dac_i2c2_write((u8_t) ((level << 4) & 0xF0));
    dac_i2c2_stop();
    DAC2_SDA_OUT = 1;
    WPUFbits.WPUF2 = 1;
    DAC2_SDA_TRIS = 1;

}


#define DAC_GAIN        MCP47X6_GAIN_1X
#define DAC_VREF        MCP47X6_VREF_VREFPIN

void DACs_init() {

    DAC_SCL_TRIS = 0;
    DAC1_SDA_TRIS = 0;
    DAC2_SDA_TRIS = 0;

    DAC1config = 0;
    DAC2config = 0;

    DAC1config = MCP47X6_CMD_VOLALL | MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED | MCP47X6_GAIN_1X;
    DAC1_setoutputlevel(0);


    DAC2config = MCP47X6_CMD_VOLALL | MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED | MCP47X6_GAIN_1X;
    DAC2_setoutputlevel(0x7ff);



}

void DAC_poll() {
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

void init_outputstatus() {
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


u8_t EVENTTOTALflag = 0;
u16_t EVENTTOTALV;
u16_t totalV;

void OUTPUT_poll() {
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




    totalV = 0;

    for (i = 0; i < Missed_cell_ID; i++) {


        if (CHN_voltage[i] > LIMITVOLTAGE) {

            totalV += CHN_voltage[i];
            if (CHN_voltage[i] < GB_Uhavmin) {
                DISCflag = 1;
                GBUhavUminident = 1;
                debug_print_str("\r\nUHAVMINID!:");
                debug_print_hex_u8(i);
                EVENTCELLID = i + 1;
                EVENTCELLTYPE = EVENT_UMINHAV;
                EVENTCELLV = CHN_voltage[i];
                if (EVENTTOTALflag) {
                    EVENTCELLTOTALV = EVENTTOTALV;
                }

            }
            if (CHN_voltage[i] > GB_Uhavmax) {
                DISCflag = 1;
                GBUhavUmaxident = 1;
                EVENTCELLID = i + 1;
                EVENTCELLTYPE = EVENT_UMAXHAV;
                EVENTCELLV = CHN_voltage[i];
                if (EVENTTOTALflag) {
                    EVENTCELLTOTALV = EVENTTOTALV;
                }

            }




            if (GB_Umin != UminF) {
                if (CHN_voltage[i] < GB_Umin) {
                    UminEvent = 1;
                    CHN_voltageMINEventTemp[i] = 0x01;
                    Umin4Event = 1;


                    EVENTCELLID = i + 1;
                    EVENTCELLTYPE = EVENT_UMIN;
                    EVENTCELLV = CHN_voltage[i];
                    if (EVENTTOTALflag) {
                        EVENTCELLTOTALV = EVENTTOTALV;
                    }

                }
            }

            if (GB_Umax != UmaxF) {


                if (CHN_voltage[i] > GB_Umax) {

                    UmaxEvent = 1;
                    EVENTCELLID = i + 1;
                    EVENTCELLTYPE = EVENT_UMAX;
                    EVENTCELLV = CHN_voltage[i];

                    if (EVENTTOTALflag) {
                        EVENTCELLTOTALV = EVENTTOTALV;
                    }


                    CHN_voltageMAXEventTemp[i] = 0x01;
                    Umax4Event = 1;
                }


            }



        }
    }

    EVENTTOTALV = totalV;
    EVENTTOTALflag = 1;

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
            memcpy(&CHN_voltageMINEvent, &CHN_voltageMINEventTemp, 16);
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
            memcpy(&CHN_voltageMAXEvent, &CHN_voltageMAXEventTemp, 16);
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

void CPMOUTPUTGETREG() {
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


    CPMREGDATA[I2C_UMIN12] = PIN_UMIN12;
    CPMREGDATA[I2C_UMIN3] = PIN_UMIN3;
    CPMREGDATA[I2C_UMIN4] = PIN_UMIN4;
    CPMREGDATA[I2C_UMAX12] = PIN_UMAX12;
    CPMREGDATA[I2C_UMAX3] = PIN_UMAX3;
    CPMREGDATA[I2C_UMAX4] = PIN_UMAX4;
    CPMREGDATA[I2C_EMERG12] = PIN_EMERG12;
    CPMREGDATA[I2C_EMERG3] = PIN_EMERG3;

}


u32_t suma, testtime = 0, testbuttontime = 0;
u16_t result;

void main() {

    u8_t i, j;
    u16_t volt = 0;




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
    multiplex_init();

    __delay_ms(200);


    PIN_UMIN12 = 0xFF;
    PIN_UMIN3 = 0xFF;
    PIN_UMIN4 = 0xFF;
    PIN_UMAX12 = 0xFF;
    PIN_UMAX3 = 0xFF;
    PIN_UMAX4 = 0xFF;
    PIN_EMERG12 = 0xFF;
    PIN_EMERG3 = 0xFF;

    startflag = 1;

    memset(&CELL_connect, 0, 16);

    DISCONNECTFLAG = 0;
    MISSEDBUTTONFLAG = 0;

    UMIN_WR = 0;
    UMAX_WR = 0;
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


    for (i = 0; i < 16; i++) {
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
    memset(&CPMREGDATA, 0xFF, maxreg * 2);





    eeprom_event_i2c_register_initialize();



    memcpy(&TEMPCPMREGDATA, &CPMREGDATA, maxreg * 2);



    debug_print_str("\r\nCTRL1");


    PWRUP_OUT();
    PWRUP = 1;

    __delay_ms(200);


    for (i = 0; i < 5; i++) {
        adc_getval(VOLTAGEINPUT);
        adc_getval(UMININPUT);
        adc_getval(UMAXINPUT);
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
            start_LED();
            EVENT_LED();

            cellconnectflag = 2;
        } else if (cellconnectflag == 2) {
            if (timeticks > LEDstarttime) {
                if (TOFFFLAG == 1) {
                    for (i = 0; i < 16; i += 2) {
                        if (CELL_connect[i]) LED_stat[i] = BLUE;
                        if (CELL_connect[i + 1]) LED_stat[i + 1] = RED;


                    }
                    LED_poll();


                } else {


                    if (timeticks > LEDtime) {

                        if (LEDOFFflag) {
                            if (LEDSTATFLAG == 1) {
                                LEDSTATFLAG = 0;

                                memcpy(&LED_stat, &temp_LED_stat, 16);


                                LED_stat[GBmaxid] = OFF;
                                LED_stat[GBminid] = OFF;



                                for (i = 0; i < 16; i++) {
                                    if (GBUminBlock == 0) {
                                        if (GBminid != i)
                                            if (CHN_voltageMINEvent[i] == 1) LED_stat[i] = RED;
                                    }
                                    if (GBUmaxBlock == 0) {
                                        if (GBmaxid != i)
                                            if (CHN_voltageMAXEvent[i] == 1) LED_stat[i] = BLUE;
                                    }
                                }

                            }
                            LEDtime = timeticks + LEDOFFTIME;
                        } else {
                            LEDtime = timeticks + LEDONTIME;
                            memcpy(&LED_stat, &temp_LED_stat, 16);
                            if (LEDSTATFLAG == 1) {
                                LEDSTATFLAG = 0;
                                for (i = 0; i < 16; i++) {
                                    if (GBUminBlock == 0) {
                                        if (CHN_voltageMINEvent[i] == 1) LED_stat[i] = OFF;
                                    }
                                    if (GBUmaxBlock == 0) {
                                        if (CHN_voltageMAXEvent[i] == 1) LED_stat[i] = OFF;
                                    }
                                }

                                LED_stat[GBmaxid] = BLUE;
                                LED_stat[GBminid] = RED;




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

        if (timeticks > testbuttontime) {

            Umin_button();
            Umax_button();







            if (UMIN_WR) {
                WEBPOTMINtimeout = timeticks + 600;
                UMIN_WR = 0;
            }
            if (CPMREGDATA[I2C_RUMINPOT] != 0xFFFF) {
                if (timeticks > WEBPOTMINtimeout) {
                    CPMREGDATA[I2C_RUMINPOT] = 0xFFFF;
                }
            }
            if (UMAX_WR) {
                WEBPOTMAXtimeout = timeticks + 600;
                UMAX_WR = 0;

            }
            if (CPMREGDATA[I2C_RUMAXPOT] != 0xFFFF) {
                if (timeticks > WEBPOTMAXtimeout) {
                    CPMREGDATA[I2C_RUMAXPOT] = 0xFFFF;
                }
            }


            if (CPMREGDATA[I2C_RUMINPOT] == 0xFFFF) TGB_Umin = GB_Umin;
            else {
                TGB_Umin = GB_Umin;
                GB_Umin = CPMREGDATA[I2C_RUMINPOT];
                GB_Uhavmin = GB_Umin - Uhavmindiff;
                debug_print_strROM("\r\nREMOTEPOMIN!:");
                debug_print_hex_u16(GB_Umin);
                debug_print_hex_u16(GB_Uhavmin);

            }
            if (CPMREGDATA[I2C_RUMAXPOT] == 0xFFFF) TGB_Umax = GB_Umax;
            else {
                TGB_Umax = GB_Umax;
                GB_Umax = CPMREGDATA[I2C_RUMAXPOT];
                GB_Uhavmax = GB_Umax + Uhavmaxdiff;

            }


            CPMREGDATA[I2C_UMINPOT] = TGB_Umin;
            CPMREGDATA[I2C_UMAXPOT] = TGB_Umax;

            if (CPMREGDATA[I2C_TURNOFF] == 0x0001) {
                debug_print_strROM("\r\nVYPINAME I2c!");


                set_Uhav_OUTPUT(CELLUHAVFAIL);
                set_Umin_LT_OUTPUT(CELLUMINFAIL);
                set_Umax_LT_OUTPUT(CELLUMAXFAIL);
                PWRUP = 0;
                __delay_ms(2000);
                PWRUP_IN();
            }
            if (CPMREGDATA[I2C_RESET] == 0x0001) {
                init_outputstatus();
                CPMREGDATA[I2C_RESET] = 0;
                debug_print_strROM("\r\nRESETUJEME I2c!");
                events_reset();
            }

            CPMOUTPUTGETREG();
            if (UhavOKstatus == CELLUHAVFAIL) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS]&~0x8000;
            } else if (UhavOKstatus == CELLUHAVOK) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS] | 0x8000;
            }
            if (UminOKstatus == CELLUMINFAIL) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS]&~0x4000;
            } else if (UminOKstatus == CELLUMINOK) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS] | 0x4000;
            }
            if (UmaxOKstatus == CELLUMAXFAIL) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS]&~0x2000;
            } else if (UmaxOKstatus == CELLUMAXOK) {
                CPMREGDATA[I2C_EVENTS] = CPMREGDATA[I2C_EVENTS] | 0x2000;
            }

            if (GB_Umin >= GB_Umax) MAXMINFLAG = 1;
            else MAXMINFLAG = 0;


            testbuttontime = timeticks + 5;

            DAC_poll();
            OUTPUT_poll();


            DELAY_poll();





        }
        if (!startupflag) {
            if (timeticks > STARTUPTIME) {
                startupflag = 1;

            }

        }
        if ((DLDISCflag == 1) || (TOFFFLAG == 1) || (DISCONNECTFLAG == 1) || (MISSEDINTERCELLFLAG == 1) || (MAXMINFLAG == 1)) {

            if (timeticks > discontime) {
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
