#include "adc.h"
#include <xc.h>

#define ADIN     PORTFbits.RF0
#define VOLTAGEPIN_IN() TRISFbits.TRISF0 = 1
#define VOLTAGEINPUT      0x28

#define UMININ     PORTGbits.RG7
#define UMINPIN_IN() TRISGbits.TRISG7 = 1
#define UMININPUT       0x37

#define UMIMAX     PORTFbits.RF1
#define UMAXPIN_IN() TRISFbits.TRISF1 = 1
#define UMAXINPUT      0x29


void init_adc(void) 
{
    PMD2 = 0xFF;
    PMD2bits.ADCMD = 0;
    PMD3 = 0xFF;
    PMD1 = 0xFF;
    PMD4 = 0xFF;
    PMD5 = 0xFF;
    ANSELF = 0x03;
    ANSELG = 0x80;
    ANSELB = 0x00;
    ANSELC = 0x00;
    ANSELD = 0x00;
    ANSELE = 0x00;
    
    VOLTAGEPIN_IN();
    UMINPIN_IN();
    UMAXPIN_IN();
    
    ADRESH = 0x00;
    ADRESL = 0x00;
    ADCLK = 0x07;

    ADCAP = 0x0F;
    ADLTHL = 0x00;
    ADLTHH = 0x00;
    ADUTHL = 0x00;
    ADUTHH = 0x00;
    ADSTPTL = 0x00;
    ADSTPTH = 0x00;
    ADCON1 = 0x00;
    ADCON2 = 0x00;

    ADCON3 = 0x0F;
    ADCON0 = 0xC4;

    ADPREH = 0x00;
    ADPREL = 0x00;
    ADACQH = 0x00;
    ADACQL = 0x00;
    ADREF = 0x02;
    ANSELAbits.ANSA3 = 1;
}

u16_t adc_getval(u8_t channel) 
{
    ADPCH = channel;
    ADCON0bits.ADON = 1;
    ADCON2bits.ADACLR = 1;
    while (ADCON2bits.ADACLR);
    ADCON0bits.GO = 1;
    while (ADCON0bits.GO);
    return ((ADRESH << 8) + ADRESL);
}

u32_t adc_get_avg_val(u8_t channel, u8_t samples)
{
    u32_t suma = 0;
    
    for(u8_t i = 0; i < samples; i++) 
    {
        suma += adc_getval(channel);
    }   
    
    return suma / samples;
}


u16_t adc_get_voltage_input(void)
{
    return adc_getval(VOLTAGEINPUT);
}

u32_t adc_get_avg_voltage_input(u8_t samples)
{
    return adc_get_avg_val(VOLTAGEINPUT, samples);
}       


u16_t adc_get_minimum_input(void)
{
    return adc_getval(UMININPUT);    
}

u32_t adc_get_avg_minimum_input(u8_t samples)
{
    return adc_get_avg_val(UMININPUT, samples);
}       

u16_t adc_get_maximum_input(void)
{
    return adc_getval(UMAXINPUT);
}

u32_t adc_get_avg_maximum_input(u8_t samples)
{
    return adc_get_avg_val(UMAXINPUT, samples);
}       

        
