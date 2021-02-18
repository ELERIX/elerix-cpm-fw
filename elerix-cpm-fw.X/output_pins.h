/* 
 * File:   output_pins.h
 * Author: Lukas Kvasnica
 *
 * Created on February 7, 2021, 10:14 AM
 */

#include "integers.h"

#ifndef MIN_MAX_PINS_H
#define	MIN_MAX_PINS_H

#ifdef	__cplusplus
extern "C" {
#endif
        
#define   PINUMIN12  1
#define   PINUMIN3   2
#define   PINUMIN4   3
    
#define   PINUMAX12  4
#define   PINUMAX3   5
#define   PINUMAX4   6
    
#define   PINEMER12  7
#define   PINEMER3   8
    
#define PIN_OFF 0    
#define PIN_ON 1
    
#define PULSE_LENGTH_MS 130 
    
    
#define PinFuncs(p)  void SetPin##p(u8_t v); void TogglePin##p(void); u8_t GetPin##p(void); void PulsePin##p(void); void SetFlag##n(u8_t v);
    
PinFuncs(UMIN1)

PinFuncs(UMIN2)        

PinFuncs(UMIN3)
        
PinFuncs(UMIN4)
        
PinFuncs(UMAX1)

PinFuncs(UMAX2)
        
PinFuncs(UMAX3)
        
PinFuncs(UMAX4)

PinFuncs(EMER1)
        
PinFuncs(EMER2)
        
PinFuncs(EMER3)
        
#define DualPinFunc(n, a, b) void PulsePin##n##_##a(void); void PulsePin##n##_##b(void); void TogglePulsePins##n(void); void SetFlag##n(u8_t v); u8_t GetPin##n(void);
        
DualPinFunc(UMAX12, UMAX1, UMAX2)        

DualPinFunc(UMIN12, UMIN1, UMIN2)

DualPinFunc(EMER12, EMER1, EMER2)

#ifdef	__cplusplus
}
#endif

#endif	/* MIN_MAX_PINS_H */

