/* 
 * File:   hw_i2c.h
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 8:55 PM
 */

#ifndef HW_I2C_H
#define	HW_I2C_H

#include "integers.h"

#define SDA PORTCbits.RC4
#define SCL PORTCbits.RC3

#ifdef	__cplusplus
extern "C" {
#endif
    
//registry
#define I2C_U1CELL       1   //read only
#define I2C_U2CELL       2   //read only
#define I2C_U3CELL       3   //read only
#define I2C_U4CELL       4   //read only
#define I2C_U5CELL       5   //read only
#define I2C_U6CELL       6   //read only
#define I2C_U7CELL       7   //read only
#define I2C_U8CELL       8   //read only
#define I2C_U9CELL       9   //read only
#define I2C_U10CELL      10  //read only
#define I2C_U11CELL      11  //read only
#define I2C_U12CELL      12  //read only
#define I2C_U13CELL      13  //read only
#define I2C_U14CELL      14  //read only
#define I2C_U15CELL      15  //read only
#define I2C_U16CELL      16  //read only
#define I2C_UCELLTOTAL   17  //read only
    
#define I2C_EVENTS       18  //zde jsou bity eventu umin,Ok,umaxOk, emergOk (3 bity)
#define I2C_UMINPOT      19  //napeti ktere je nastaveno na potacich (min) jen pro READ
#define I2C_UMAXPOT      20  //napeti ktere je nastaveno na potaku max jen pro READ, WRITE has no effect
//nasledujici registry  jsou nahrady misto potaku, tedy s tc840, platnost nastaveni 1minuta, od posledniho zapisu
//pote se setuji na ffff

#define I2C_RUMINPOT     21  //remote i2c napeti ktere je nastaveno na potacich (min) , pokud neni 0xFFFF taxe bere v potaz toto napeti
#define I2C_RUMAXPOT     22  //napeti ktere je nastaveno dalkove misto potaku, pokud je v mezich paxe bere toto napeti.

#define RESWITCH         0xA5A5
#define ONSWITCH         0xA115          //2020 zmena
#define OFFSWITCH        0xA005          //2020 zmena

//nasladujicich 6 registru vraci stav 0 nebo 0x0001 , WRITE 0 nebo 1 jej JENOM nuluje(zatim bez nastaveni rele),
// ale WRITE hodnoty 0xa5a5 jej nastavuje na opacny stav
#define I2C_UMIN12       23
#define I2C_UMIN3        24
#define I2C_UMIN4        25 //dodelavka 01 2020
#define I2C_UMAX12       26
#define I2C_UMAX3        27
#define I2C_UMAX4        28 //dodelavka 01 2020
#define I2C_EMERG12      29
#define I2C_EMERG3       30
#define I2C_RESET        31       //reset board, nastavuje do stavu po zapnuti, cte se 0 nebo 1
#define I2C_TURNOFF      32       //write only turnoff board, vypnuti desky


//dodelavka 06 2020  /read only
#define I2C_IDEVCELL      33       //cidlo clanku na kterem udalost vznikla U8
#define I2C_CELLV         34       //jeho napeti u16 v mV
#define I2C_IDTYPE        35       //jmeno udalosti , 0 umin, 1 umax, 2 uminhav, 3 umaxhav
#define I2C_EVTOTALV      36       ///celkove napeti baterie v dobe udalosti U16 v mv
    
    
#define maxreg 37

u16_t GetCPMREG(u16_t addr);
void SetCPMREG(u16_t addr, u16_t val);
    
void I2C1_Initialize(void);

void CPMOUTPUTGETREG(void);

void interruptI2C1(void);

void CheckU_WR(u32_t timeticks);

#ifdef	__cplusplus
}
#endif

#endif	/* HW_I2C_H */

