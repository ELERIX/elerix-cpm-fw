/* 
 * File:   multiplexer.h
 * Author: Lukas Kvasnica
 *
 * Created on February 5, 2021, 12:55 PM
 */

#ifndef MULTIPLEXER_H
#define	MULTIPLEXER_H

#include "integers.h"

#ifdef	__cplusplus
extern "C" {
#endif

#define AGND_CHN  17
#define VREF_CHN  18
        
void init_multiplex(void);
void set_CELL_channel(u8_t chn);

void multiplex_enable(u8_t enable);


#ifdef	__cplusplus
}
#endif

#endif	/* MULTIPLEXER_H */

