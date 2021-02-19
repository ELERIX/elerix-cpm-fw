/* 
 * File:   eeprom_regs.h
 * Author: Lukas Kvasnica
 *
 * Created on February 9, 2021, 9:17 PM
 */

#ifndef EEPROM_REGS_H
#define	EEPROM_REGS_H

#include "integers.h"

#ifdef	__cplusplus
extern "C" {
#endif


void events_reset(void);
void save_eeprom_event(void);


u8_t EepromEventCellID(void);
u8_t EepromEventType(void);
u16_t EepromEventCellVoltage(void);
u16_t EepromEventTotalCellVoltage(void);




#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM_REGS_H */

