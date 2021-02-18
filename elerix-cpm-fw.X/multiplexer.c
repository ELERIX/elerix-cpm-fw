#include "multiplexer.h"
#include <xc.h>


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



void init_multiplex(void) 
{
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
}

void multiplex_enable(u8_t enable)
{
    DISA = enable;
    DISB = enable;
    DISA_OUT();
    DISB_OUT();    
}

void set_CELL_channel(u8_t chn) 
{


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

