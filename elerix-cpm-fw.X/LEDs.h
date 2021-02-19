/*
 * File:   debug_routines.c
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 4:07 PM
 */

#ifndef LEDS_H
#define	LEDS_H

#include "integers.h"


void init_LED(void);
void start_LED(u8_t *CELL_connect);
void EVENT_LED(void);
void LED_poll(void);
void CopyLED_statFromTemp_LED_stat(void);


void SetLED_statOFF(u8_t i);
void SetLED_statBlue(u8_t i);
void SetLED_statRed(u8_t i);

void SetTempLED_statOFF(u8_t i);
void SetTempLED_statBlue(u8_t i);
void SetTempLED_statRed(u8_t i);


#endif	/* LEDS_H */

