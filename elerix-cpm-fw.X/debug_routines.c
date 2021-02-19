/*
 * File:   debug_routines.c
 * Author: Lukas Kvasnica
 *
 * Created on February 4, 2021, 4:07 PM
 */


#include "debug_routines.h"
#include <xc.h>
#include <string.h>


#ifdef DEBUG

void debug_init(void) 
{
    DEBUG_DATA_OUT();
    DEBUG_CLOCK_OUT();

}

void debug_send_byte(u8_t byte) 
{
    u8_t i, parita, j, st;
    parita = 0;
    
    if (byte & 0x01) 
        st = 1;
    else 
        st = 0;
    
    for (i = 0; i < 8; i++) 
    {
        DEBUG_CLOCK = 0;
        if (byte & 0x01) 
        {
            DEBUG_DATA = 1;
            DEBUG_CLOCK = 1;
            parita++;
        } 
        else 
        {
            DEBUG_DATA = 0;
            DEBUG_CLOCK = 1;
        }
        byte = byte >> 1;
    }

    DEBUG_CLOCK = 0;
    for (j = 0; j < 1; j++) 
    {
        ;
    }
    
    if (parita & 0x01) 
    {
        DEBUG_DATA = 1;
        DEBUG_CLOCK = 1;
    } 
    else 
    {
        DEBUG_DATA = 0;
        DEBUG_CLOCK = 1;
    }
    
    DEBUG_CLOCK = 0;
    DEBUG_DATA = 0;

}

void debug_print_hex_u8(u8_t byt) 
{
    u8_t a, b, c;
    c = byt;
    a = c & 0x0f;
    b = (c & 0xF0);
    b = b >> 4;
    b = b & 0xf;
    if (b > 9) 
        debug_send_byte(b + 55);
    else 
        debug_send_byte(b + 48);

    if (a > 9) 
        debug_send_byte(a + 55);
    else 
        debug_send_byte(a + 48);
}

void debug_print_hex_u16(u16_t byte)
{
    debug_print_hex_u8(byte >> 8);
    debug_print_hex_u8(byte);
}

void debug_print_hex_u32(u32_t byte) 
{
    debug_print_hex_u16(byte >> 16);
    debug_print_hex_u16(byte);
}

void debug_print_str(char *s) 
{
    u16_t i, len;
    len = strlen((const char *)s);
    for (i = 0; i < len; i++) 
        debug_send_byte(*s++);
}

void debug_print_strROM(const char *s) 
{
    u16_t i, len;
    len = 10000;
    while (len--) 
    {
        if (*s == 0) 
            break;
        
        debug_send_byte(*s++);
    }
}

void debug_print_sdec(signed int prd) 
{
    u8_t i, f;
    signed int t;
    u16_t wrd;



    if (prd & 0x1000) 
    {
        debug_send_byte('-');
        t = prd & 0x7fff;
        prd = 0x8000 - t;

    }

    wrd = (u16_t) prd;

    f = 0;
    if (wrd >= 10000) 
    {
        i = wrd / 10000;
        debug_send_byte(i + 48);
        wrd = wrd % 10000;
        f = 1;
    }

    if ((wrd >= 1000) || f) {
        i = wrd / 1000;
        debug_send_byte(i + 48);
        wrd = wrd % 1000;
        f = 1;
    }

    if ((wrd >= 100) || f) 
    {
        i = wrd / 100;
        debug_send_byte(i + 48);
        wrd = wrd % 100;
        f = 1;
    }

    if ((wrd >= 10) || f) 
    {
        i = wrd / 10;
        debug_send_byte(i + 48);
        wrd = wrd % 10;

    }

    debug_send_byte(wrd + 48);


}

void debug_print_udec(unsigned int prd) 
{
    u8_t i, f;
    signed int t;
    u16_t wrd;

    wrd = prd;

    f = 0;
    if (wrd >= 10000) 
    {
        i = wrd / 10000;
        debug_send_byte(i + 48);
        wrd = wrd % 10000;
        f = 1;
    }

    if ((wrd >= 1000) || f) 
    {
        i = wrd / 1000;
        debug_send_byte(i + 48);
        wrd = wrd % 1000;
        f = 1;
    }

    if ((wrd >= 100) || f) 
    {
        i = wrd / 100;
        debug_send_byte(i + 48);
        wrd = wrd % 100;
        f = 1;
    }

    if ((wrd >= 10) || f) 
    {
        i = wrd / 10;
        debug_send_byte(i + 48);
        wrd = wrd % 10;

    }

    debug_send_byte(wrd + 48);


}

void debug_print_float(double b, u8_t des) 
{
    u8_t i, j, id, zero, sgn, nuly;
    char OString[30];
    u32_t exp;
    u8_t temp;
    u32_t ccast;
    u32_t tccast, dccast;

    memset(OString, 0x00, 30);

    id = 0;
    zero = 0;
    for (i = 0; i<sizeof (OString); i++) OString[i] = 0x00;
    sgn = 0;
    if (((float) b) < 0) 
    {
        OString[id++] = '-';
        b = b* -1;
        sgn = 1;
    }


    exp = 1000000000;
    ccast = (long int) b;
    tccast = ccast;
    dccast = ccast;

    for (i = 0; i < 10; i++) 
    {
        j = ccast / exp;
        
        if (!((!j) && (!zero))) 
        {
            OString[id++] = j + 48;
            zero = 1;
        }
        
        if (zero) 
            ccast = ccast % exp;
        
        exp = exp / 10;

    }

    if (!tccast) 
        OString[id++] = '0';
    
    if (des) 
        OString[id++] = '.';


    nuly = 0;
    for (i = 0; i < des; i++) 
    {
        b = b - tccast;
        b = b * 10;
        OString[id] = (u8_t) b + 48;
        if (OString[id] == 48) nuly++;
        id++;
        tccast = b;
    }

    OString[id++] = 0;

    if (!dccast) 
    {
        if ((nuly == des) && (sgn)) 
        {
            for (i = 0; i < id; i++) 
            {
                OString[i] = OString[i + 1];
            }
        }
    }
    
    debug_print_str(OString);
}

#else


void debug_init(void){}
void debug_send_byte(u8_t byte){}
void debug_print_hex_u8(u8_t byt){}
void debug_print_hex_u16(u16_t byte){}
void debug_print_strROM(const char *s){}
void debug_print_hex_u32(u32_t byte){}
void debug_print_str(char *s){}
void debug_print_udec(unsigned int prd){}


#endif 