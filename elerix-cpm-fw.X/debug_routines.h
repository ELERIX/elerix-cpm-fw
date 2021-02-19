/*
 * File:   debug_routines.h
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 4:07 PM
 */

#ifndef DEBUG_ROUTINES_H
#define	DEBUG_ROUTINES_H

#include "integers.h"

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    // TODO If C++ is being used, regular C code needs function names to have C 
    // linkage so the functions can be used by the c code. 
                          
#ifdef DEBUG
        
#define DEBUG_CLOCK LATBbits.LATB7
#define DEBUG_DATA_OUT() TRISBbits.TRISB7 = 0
#define DEBUG_CLOCK_OUT() TRISBbits.TRISB6 = 0 
#define DEBUG_DATA LATBbits.LATB6

#endif
    
void debug_init(void);
void debug_send_byte(u8_t byte);
void debug_print_hex_u8(u8_t byt);
void debug_print_hex_u16(u16_t byte);
void debug_print_strROM(const char *s);
void debug_print_hex_u32(u32_t byte);
void debug_print_str(char *s);
void debug_print_udec(unsigned int prd);

         
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* DEBUG_ROUTINES_H */

