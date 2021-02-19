#include "output_pins.h"
#include "cpu_spec.h"
#include <xc.h>

#define UminP4_OUT() TRISGbits.TRISG0 = 0
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

#define PIN(n, p) u8_t PIN_##n = 0xFF; \
    void SetPin##n(u8_t v) { p##_OUT(); p = v; PIN_##n = v; } \
    void TogglePin##n(void) { SetPin##n(!PIN_##n); }  \
    u8_t GetPin##n(void) { return PIN_##n; } \
    void SetFlag##n(u8_t v) { PIN_##n = v; } \
    void PulsePin##n(void) { p##_OUT(); p = 1; __delay_ms(PULSE_LENGTH_MS); p = 0; p##_IN(); } 



PIN(UMIN1, UminP1)
PIN(UMIN2, UminP2)
PIN(UMIN3, UminP3)
PIN(UMIN4, UminP4)
        
PIN(UMAX1, UmaxP1)
PIN(UMAX2, UmaxP2)
PIN(UMAX3, UmaxP3)
PIN(UMAX4, UmaxP4)       

        
PIN(EMER1, UhavP1)
PIN(EMER2, UhavP2)
PIN(EMER3, UhavP3)


#define DUALPIN(n, a, b) u8_t PIN_##n = 0xFF; \
    void SetFlag##n(u8_t v) { PIN_##n = v; } \
    u8_t GetPin##n(void) { return PIN_##n; } \
    void PulsePin##n##_##a(void) { PulsePin##a();  PIN_##n = 1; } \
    void PulsePin##n##_##b(void) { PulsePin##b();  PIN_##n = 0; } \
    void TogglePulsePins##n(void) { if(PIN_##n) PulsePin##n##_##b(); else PulsePin##n##_##a(); }
        
DUALPIN(UMAX12, UMAX1, UMAX2)        

DUALPIN(UMIN12, UMIN1, UMIN2)

DUALPIN(EMER12, EMER1, EMER2)
                
