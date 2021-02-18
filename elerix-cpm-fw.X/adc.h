/* 
 * File:   adc.h
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 8:15 PM
 */

#include "integers.h"

#ifndef ADC_H
#define	ADC_H

#ifdef	__cplusplus
extern "C" {
#endif

void init_adc(void);

u16_t adc_getval(u8_t channel);
u32_t adc_get_avg_val(u8_t channel, u8_t samples);

u16_t adc_get_voltage_input(void);
u32_t adc_get_avg_voltage_input(u8_t samples);

u16_t adc_get_minimum_input(void);
u32_t adc_get_avg_minimum_input(u8_t samples);

u16_t adc_get_maximum_input(void);
u32_t adc_get_avg_maximum_input(u8_t samples);



#ifdef	__cplusplus
}
#endif

#endif	/* ADC_H */

