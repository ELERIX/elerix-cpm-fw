/*
 * File:   debug_routines.c
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 4:07 PM
 */ 
#ifndef DAC_H
#define	DAC_H

#include "integers.h"

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */    
    
void DACs_init(void);

void write_DAC1_configreg(u8_t cmnd);
void write_DAC2_configreg(u8_t cmnd);

void DAC1_powerdown(u8_t pdOutR);

void DAC1_setoutputlevel(u16_t level);
void DAC2_setoutputlevel(u16_t level);
               
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* DAC_H */

