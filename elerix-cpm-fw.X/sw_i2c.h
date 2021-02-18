/* 
 * File:   sw_i2c.h
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 4:52 PM
 */

#include "integers.h"

#ifndef SW_I2C_H
#define	SW_I2C_H

#ifdef	__cplusplus
extern "C" {
#endif

void i2c_init(void);    
    
void i2c1_stop(void);
void i2c1_start(void);

void i2c1_write(u8_t o_byte);
u8_t i2c1_read();

void i2c1_nack(void);
void i2c1_ack(void);

void i2c1_set_as_input(void);

void i2c2_stop(void);
void i2c2_start(void);

void i2c2_write(u8_t o_byte);
u8_t i2c2_read();

void i2c2_nack(void);
void i2c2_ack(void);

void i2c2_set_as_input(void);



#ifdef	__cplusplus
}
#endif

#endif	/* SW_I2C_H */

