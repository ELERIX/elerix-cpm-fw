#include "sw_i2c.h"
#include <xc.h>

// switches between output and input DAC1_SDA_TRIS = 1 pin configured as input
#define DAC1_SDA_TRIS                TRISFbits.TRISF3 
#define DAC1_SDA_IN                  PORTFbits.RF3
#define DAC1_SDA_OUT                 LATFbits.LATF3

#define DAC2_SDA_TRIS                TRISFbits.TRISF2
#define DAC2_SDA_IN                  PORTFbits.RF2
#define DAC2_SDA_OUT                 LATFbits.LATF2

#define DAC_SCL_TRIS                 TRISGbits.TRISG6
#define DAC_SCL                      LATGbits.LATG6

void delay() 
{
    u8_t i;
    for (i = 0; i < 10; i++) 
        asm("NOP");
}

void i2c_init(void)
{
    DAC_SCL_TRIS = 0;
    DAC1_SDA_TRIS = 0;
    DAC2_SDA_TRIS = 0;    
}

void i2c1_stop(void) 
{

    DAC1_SDA_TRIS = 0;
    DAC_SCL_TRIS = 0;

    DAC_SCL = 0;
    delay();
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC1_SDA_TRIS = 1;
    DAC1_SDA_OUT = 1;
    delay();
}

void i2c1_set_as_input(void)
{
    DAC1_SDA_OUT = 1;
    WPUFbits.WPUF3 = 1;
    DAC1_SDA_TRIS = 1;    
}

void i2c1_start(void) 
{
    DAC_SCL_TRIS = 0;
    DAC_SCL = 0;
    DAC1_SDA_TRIS = 0;
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 0;
    delay();

}

void i2c1_write(u8_t o_byte) 
{
    u8_t n;
    for (n = 0; n < 8; n++) 
    {
        DAC_SCL = 0;
        delay();
        if (o_byte & 0x80) 
        {
            DAC1_SDA_OUT = 1;
            delay();
        } 
        else 
        {
            DAC1_SDA_OUT = 0;
            delay();
        }
        DAC_SCL = 1;
        delay();
        o_byte = o_byte << 1;
        DAC_SCL = 0;

    }
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();

}

void i2c1_nack(void) 
{
    DAC1_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

void i2c1_ack(void) 
{
    DAC1_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

u8_t i2c1_read() 
{
    u8_t i_byte = 0, n;
    DAC1_SDA_TRIS = 1;

    WPUFbits.WPUF3 = 1;
    for (n = 0; n < 8; n++) 
    {
        i_byte <<= 1;
        DAC_SCL = 0;
        delay();
        DAC_SCL = 1;
        delay();
        if (DAC1_SDA_IN) i_byte |= 0x01;
        delay();
        DAC_SCL = 0;
        delay();
    }
    DAC1_SDA_TRIS = 0;

    WPUFbits.WPUF3 = 0;
    return (i_byte);
}





void i2c2_stop(void) 
{
    DAC2_SDA_TRIS = 0;
    DAC_SCL_TRIS = 0;

    DAC_SCL = 0;
    delay();
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC2_SDA_TRIS = 1;
    DAC2_SDA_OUT = 1;
    delay();
}

void i2c2_set_as_input(void)
{
    DAC2_SDA_OUT = 1;
    WPUFbits.WPUF2 = 1;
    DAC2_SDA_TRIS = 1;
}


void i2c2_start(void) 
{
    DAC_SCL_TRIS = 0;
    DAC_SCL = 0;
    DAC2_SDA_TRIS = 0;
    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 0;
    delay();
}

void i2c2_write(u8_t o_byte) 
{
    u8_t n;
    for (n = 0; n < 8; n++) 
    {
        DAC_SCL = 0;
        delay();
        if (o_byte & 0x80) 
        {
            DAC2_SDA_OUT = 1;
            delay();
        } 
        else 
        {
            DAC2_SDA_OUT = 0;
            delay();
        }
        DAC_SCL = 1;
        delay();
        o_byte = o_byte << 1;
        DAC_SCL = 0;

    }

    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();

}

void i2c2_nack(void) 
{
    DAC2_SDA_OUT = 1;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

void i2c2_ack(void) 
{
    DAC2_SDA_OUT = 0;
    delay();
    DAC_SCL = 1;
    delay();
    DAC_SCL = 0;
    delay();
}

u8_t i2c2_read() 
{
    u8_t i_byte = 0, n;
    DAC2_SDA_TRIS = 1;

    WPUFbits.WPUF2 = 1;
    for (n = 0; n < 8; n++) 
    {
        i_byte <<= 1;
        DAC_SCL = 0;
        delay();

        DAC_SCL = 1;
        delay();
        if (DAC2_SDA_IN) i_byte |= 0x01;
        delay();
        DAC_SCL = 0;
        delay();
    }
    
    DAC2_SDA_TRIS = 0;

    WPUFbits.WPUF2 = 0;
    return (i_byte);
}

