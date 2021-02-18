#include "events.h"


u8_t EVENTCELLTYPE = 0xFF;
u8_t EVENTCELLID = 0xFF;
u16_t EVENTCELLV = 0x00;

u8_t EVENTTOTALflag = 0;
u16_t EVENTCELLTOTALV = 0;



void SetEventTotalFlag()
{
    EVENTTOTALflag = 1;
}

void ClearEventTotalFlag()
{
    EVENTTOTALflag = 0;
}



void SetEvent(u8_t cellID,  u8_t eventType, u16_t cellVoltage, u16_t totalVoltage)
{
    EVENTCELLID = cellID;
    EVENTCELLTYPE = eventType;
    EVENTCELLV = cellVoltage;    
    EVENTCELLTOTALV = totalVoltage;
}


u8_t EventType(void)
{
    return EVENTCELLTYPE;
}

u8_t EventCellID(void)
{
    return EVENTCELLID;
}

u16_t EventCellVoltage(void)
{
    return EVENTCELLV;
}


u16_t EventCellTotalVoltage(void)
{
    return EVENTCELLTOTALV;
}

