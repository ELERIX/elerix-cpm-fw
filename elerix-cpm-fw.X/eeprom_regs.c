#include "eeprom_regs.h"
#include <xc.h>
#include "interface_i2c.h"
#include "events.h"
#include "cpu_spec.h"

#define EEADDR_IDCELL     0
#define EEADDR_CELLV      1
#define EEADDR_IDNAME     3
#define EEADDR_TOTALV     4


u16_t eeprom_read_u16(u8_t addr)
{
   return (eeprom_read(addr) << 8) | eeprom_read(addr + 1);     
}

void eeprom_write_u16(u8_t addr, u16_t value)
{
    eeprom_write(addr + 1, value & 0xFF);
    eeprom_write(addr, value >> 8);
}

u8_t EepromEventCellID(void)
{
    return eeprom_read(EEADDR_IDCELL);
}

u8_t EepromEventType(void)
{
    return eeprom_read(EEADDR_IDNAME);
}

u16_t EepromEventCellVoltage(void)
{
    return eeprom_read_u16(EEADDR_CELLV);    
}

u16_t EepromEventTotalCellVoltage(void)
{
    return eeprom_read_u16(EEADDR_TOTALV);     
}

void save_eeprom_event(void) 
{

    eeprom_write(EEADDR_IDCELL, EventCellID());    
    eeprom_write_u16(EEADDR_CELLV, EventCellVoltage());
    eeprom_write(EEADDR_IDNAME, EventType());
    eeprom_write_u16(EEADDR_TOTALV, EventCellTotalVoltage());

    __delay_ms(20);
    
    SetCPMREG(I2C_IDEVCELL, EventCellID());
    SetCPMREG(I2C_CELLV, EventCellVoltage());
    SetCPMREG(I2C_IDTYPE, EventType());
    SetCPMREG(I2C_EVTOTALV, EventCellTotalVoltage());


}

void events_reset(void) 
{
    SetCPMREG(I2C_IDEVCELL, 0xFFFF);
    SetCPMREG(I2C_CELLV, 0xFFFF);
    SetCPMREG(I2C_IDTYPE, 0xFFFF);
    SetCPMREG(I2C_EVTOTALV, 0xFFFF);
    
    eeprom_write(EEADDR_IDCELL, 0xFF);
    eeprom_write(EEADDR_CELLV, 0xFF);
    eeprom_write(EEADDR_CELLV + 1, 0xFF);
    eeprom_write(EEADDR_IDNAME, 0xFF);
    eeprom_write(EEADDR_TOTALV, 0xFF);
    eeprom_write(EEADDR_TOTALV + 1, 0xFF);
    
    __delay_ms(20);
}

