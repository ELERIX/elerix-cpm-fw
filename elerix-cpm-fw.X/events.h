/* 
 * File:   events.h
 * Author: Lukas Kvasnica
 *
 * Created on February 13, 2021, 11:16 AM
 */

#ifndef EVENTS_H
#define	EVENTS_H

#include "integers.h"

#ifdef	__cplusplus
extern "C" {
#endif

#define EVENT_UMIN        0
#define EVENT_UMAX        1
#define EVENT_UMINHAV     2
#define EVENT_UMAXHAV     3
    
    

void SetEvent(u8_t cellID,  u8_t eventType, u16_t cellVoltage, u16_t totalVoltage);

u8_t EventType(void);
u8_t EventCellID(void);
u16_t EventCellVoltage(void);
u16_t EventCellTotalVoltage(void);

#ifdef	__cplusplus
}
#endif

#endif	/* EVENTS_H */

