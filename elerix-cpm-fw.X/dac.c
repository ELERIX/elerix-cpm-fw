#include "dac.h"
#include "sw_i2c.h"

#define MCP47X6_DEFAULT_ADDRESS           0xC0

#define MCP47X6_GAIN_MASK                 0xFE
#define MCP47X6_GAIN_1X                   0x00
#define MCP47X6_GAIN_2X                   0x01


#define MCP47X6_PWRDN_MASK                0xF9
#define MCP47X6_AWAKE                     0x00
#define MCP47X6_PWRDN_1K                  0x02
#define MCP47X6_PWRDN_100K                0x04
#define MCP47X6_PWRDN_500K                0x06


#define MCP47X6_VREF_MASK                 0xE7
#define MCP47X6_VREF_VDD                  0x00
#define MCP47X6_VREF_VREFPIN              0x10
#define MCP47X6_VREF_VREFPIN_BUFFERED     0x18

#define MCP47X6_CMD_MASK                  0x1F
#define MCP47X6_CMD_VOLDAC                0x00
#define MCP47X6_CMD_VOLALL                0x40
#define MCP47X6_CMD_VOLCONFIG             0x80
#define MCP47X6_CMD_ALL                   0x60


u8_t DAC1config;
u8_t DAC2config;


void write_DAC1_configreg(u8_t cmnd) 
{
    i2c1_start();
    i2c1_write(MCP47X6_DEFAULT_ADDRESS);
    i2c1_write(cmnd | MCP47X6_CMD_VOLALL);
    i2c1_stop();
}

void write_DAC2_configreg(u8_t cmnd) 
{
    i2c2_start();
    i2c2_write(MCP47X6_DEFAULT_ADDRESS);
    i2c2_write(cmnd | MCP47X6_CMD_VOLALL);
    i2c2_stop();
}


void DAC1_powerdown(u8_t pdOutR) 
{
    write_DAC1_configreg((pdOutR & MCP47X6_PWRDN_MASK) | (pdOutR & !MCP47X6_PWRDN_MASK));
}

void DAC1_setoutputlevel(u16_t level) 
{
    if (level > 0x1000) 
        level = 0x0FFF;
    
    i2c1_start();
    i2c1_write(MCP47X6_DEFAULT_ADDRESS);
    i2c1_write(DAC1config);
    i2c1_write((u8_t) ((level >> 4) & 0xFF));
    i2c1_write((u8_t) ((level << 4) & 0xF0));
    i2c1_stop();
    i2c1_set_as_input();
}

void DAC2_setoutputlevel(u16_t level) 
{
    if (level > 0x1000) 
        level = 0x0FFF;
    
    i2c2_start();
    i2c2_write(MCP47X6_DEFAULT_ADDRESS);
    i2c2_write(DAC2config);
    i2c2_write((u8_t) ((level >> 4) & 0xFF));
    i2c2_write((u8_t) ((level << 4) & 0xF0));
    i2c2_stop();
    i2c2_set_as_input();    
}

void DACs_init(void) 
{
    i2c_init();    

//    DAC1config = 0;
//    DAC2config = 0;

    DAC1config = MCP47X6_CMD_VOLALL | MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED | MCP47X6_GAIN_1X;
    DAC1_setoutputlevel(0);


    DAC2config = MCP47X6_CMD_VOLALL | MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED | MCP47X6_GAIN_1X;
    DAC2_setoutputlevel(0x7ff);
}
