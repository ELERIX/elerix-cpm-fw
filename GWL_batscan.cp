#line 1 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
#line 28 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
 unsigned char  EVENTCELLID;
 unsigned int  EVENTCELLV;
 unsigned char  EVENTCELLTYPE;
 unsigned int  EVENTCELLTOTALV;
 unsigned char  DISCONNECTFLAG;
 unsigned char  startflag;
 unsigned int  GB_Umin=0,GB_Umax=0;
 unsigned int  TGB_Umin=0,TGB_Umax=0;
 unsigned int  testUmin,testUmax;
#line 66 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
 unsigned int  GB_Uhavmin=0xFFFF;
 unsigned int  GB_Uhavmax=0x0000;
#line 79 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
 unsigned char  DISCflag=0,startupflag=0,TOFFFLAG=0;
 unsigned long  discontime=0;
 unsigned char  DLDISCflag=0;




 unsigned long  Umin_relay_delay;
 unsigned char  Umin_relay_event=0xFF;
 unsigned long  Umax_relay_delay;
 unsigned char  Umax_relay_event=0xFF;


 unsigned long  Umin4_relay_delay;
 unsigned char  Umin4_relay_event=0xFF;
 unsigned long  Umax4_relay_delay;
 unsigned char  Umax4_relay_event=0xFF;


 unsigned char  GBUmaxBlockLR=1;
 unsigned char  GBUmaxBlock=1;


 unsigned long  Umin_ltrelay_delay;
 unsigned char  Umin_ltrelay_event=0xFF;
 unsigned long  Umax_ltrelay_delay;
 unsigned char  Umax_ltrelay_event=0xFF;
 unsigned char  GBUminBlockLR=1;
 unsigned char  GBUminBlock=1;
 unsigned char  GBUhavBlock=1;


 unsigned char  GBUhavUminident=0;
 unsigned char  GBUhavUmaxident=0;



 unsigned long  Uhav_ltrelay_delay;
 unsigned char  Uhav_ltrelay_event=0xFF;


 unsigned char  CHN_voltageMINEvent[16];
 unsigned char  CHN_voltageMAXEvent[16];
 unsigned char  CHN_voltageMINEventTemp[16];
 unsigned char  CHN_voltageMAXEventTemp[16];


 unsigned char  LEDSTATFLAG=0;
 unsigned char  GBUminEvent;
 unsigned char  GBUmaxEvent;
 unsigned char  GB_chn=1;
 unsigned char  GBmaxid=0xFF;
 unsigned char  GBminid=0xFF;

 unsigned int  GBCELLUmax;
 unsigned int  GBCELLUmin;
#line 147 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
 unsigned char  UminOKstatus= 0xFF ;




 unsigned char  UmaxOKstatus= 0xFF ;







 unsigned char  UhavOKstatus= 0 ;

 unsigned char  LED_stat[16];
 unsigned char  temp_LED_stat[16];

 unsigned int  CHN_voltage[16];

 unsigned char  tempmil=0,LEDchangeflag=0;
 unsigned long  timeticks=0,miliseconds=0,LEDchangetime=0;

 unsigned char  CELL_connect[16];
 unsigned char  cellconnectflag=0;

 unsigned char  MISSEDINTERCELLFLAG;
 unsigned char  MISSEDBUTTONFLAG;
 unsigned char  Missed_cell_TEST;
 unsigned char  Missed_cell_ID;
 unsigned char  MAXMINFLAG;
#line 415 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
void debug_init();
void debug_send_byte( unsigned char  byte);
void debug_print_hex_u8( unsigned char  byt);
void debug_print_hex_u16( unsigned int  byte);
void debug_print_strROM(const  unsigned char  *s);
void debug_print_hex_u32( unsigned long  byte);
void debug_print_str( unsigned char  *s);






 unsigned char  PIN_UMIN12;
 unsigned char  PIN_UMIN3;
 unsigned char  PIN_UMIN4;

 unsigned char  PIN_UMAX12;
 unsigned char  PIN_UMAX3;
 unsigned char  PIN_UMAX4;


 unsigned char  PIN_EMERG12;
 unsigned char  PIN_EMERG3;


void set_Umin4_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISG0_bit=0 ;
  LATG.F0 =1;

 PIN_UMIN4=1;

 }
else {
  TRISG0_bit=0 ;
  LATG.F0 =0;

 PIN_UMIN4=0;

}
}
void set_Umax4_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISG4_bit=0 ;
  LATG.F4 =1;

 PIN_UMAX4=1;

 }
else {
  TRISG4_bit=0 ;
  LATG.F4 =0;


 PIN_UMAX4=0;
}
}


void set_Umin_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISG1_bit=0 ;
  LATG.F1 =1;
 PIN_UMIN3=1;

 }
else {

  TRISG1_bit=0 ;
  LATG.F1 =0;
 PIN_UMIN3=0;
}
}

void set_Umin_LT_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {

  TRISG3_bit=0 ;
  LATG.F3 =1;
 delay_ms(130);
  LATG.F3 =0;
  TRISG3_bit=1 ;
 PIN_UMIN12=1;

 }
else {
  TRISG2_bit=0 ;
  LATG.F2 =1;
 delay_ms(130);
  LATG.F2 =0;
  TRISG2_bit=1 ;
 PIN_UMIN12=0;
}
}










void reswitchoutputspinfromI2C( unsigned char  iopin)
{

if (iopin== 1 ) {
 if (PIN_UMIN12) {
  TRISG2_bit=0 ;
  LATG.F2 =1;
 delay_ms(130);
  LATG.F2 =0;
  TRISG2_bit=1 ;
 }
 else {
  TRISG3_bit=0 ;
  LATG.F3 =1;
 delay_ms(130);
  LATG.F3 =0;
  TRISG3_bit=1 ;
 }
 PIN_UMIN12=!PIN_UMIN12;
}

if (iopin== 2 ) {
 if (PIN_UMIN3) {
  TRISG1_bit=0 ;
  LATG.F1 =0;
 } else {
  TRISG1_bit=0 ;
  LATG.F1 =1;
 }
 PIN_UMIN3=!PIN_UMIN3;
}



if (iopin== 3 ) {
 if (PIN_UMIN4) {
  TRISG0_bit=0 ;
  LATG.F0 =0;
 } else {
  TRISG0_bit=0 ;
  LATG.F0 =1;
 }
 PIN_UMIN4=!PIN_UMIN4;
}


if (iopin== 4 ) {
 if (PIN_UMAX12) {
  TRISF6_bit=0 ;
  LATF.F6 =1;
 delay_ms(130);
  LATF.F6 =0;
  TRISF6_bit=1 ;
 }
 else {
  TRISF5_bit=0 ;
  LATF.F5 =1;
 delay_ms(130);
  LATF.F5 =0;
  TRISF5_bit=1 ;
 }
 PIN_UMAX12=!PIN_UMAX12;
}
if (iopin== 5 ) {
 if (PIN_UMAX3) {
  TRISF7_bit=0 ;
  LATF.F7 =0;
 } else {
  TRISF7_bit=0 ;
  LATF.F7 =1;
 }
 PIN_UMAX3=!PIN_UMAX3;
}

if (iopin== 6 ) {
 if (PIN_UMAX4) {
  TRISG4_bit=0 ;
  LATG.F4 =0;
 } else {
  TRISG4_bit=0 ;
  LATG.F4 =1;
 }
 PIN_UMAX4=!PIN_UMAX4;
}

if (iopin== 7 ) {
 if (PIN_EMERG12) {
  TRISB3_bit=0 ;
  LATB.F3 =1;
 delay_ms(130);
  LATB.F3 =0;
  TRISB3_bit=1 ;
 }
 else {
  TRISB4_bit=0 ;
  LATB.F4 =1;
 delay_ms(130);
  LATB.F4 =0;
  TRISB4_bit=1 ;
 }
 PIN_EMERG12=!PIN_EMERG12;
}
if (iopin== 8 ) {
 if (PIN_EMERG3) {
  TRISB2_bit=0 ;
  LATB.F2 =0;
 } else {
  TRISB2_bit=0 ;
  LATB.F2 =1;
 }
 PIN_EMERG3=!PIN_EMERG3;
}


}


void offswitchoutputspinfromI2C( unsigned char  iopin)
{
if (iopin== 1 ) {
  TRISG2_bit=0 ;
  LATG.F2 =1;
 delay_ms(130);
  LATG.F2 =0;
  TRISG2_bit=1 ;

 PIN_UMIN12=0;
}
if (iopin== 2 ) {
  TRISG1_bit=0 ;
  LATG.F1 =0;

 PIN_UMIN3=0;
}


if (iopin== 3 ) {
  TRISG0_bit=0 ;
  LATG.F0 =0;

 PIN_UMIN4=0;
}

if (iopin== 4 ) {
  TRISF6_bit=0 ;
  LATF.F6 =1;
 delay_ms(130);
  LATF.F6 =0;
  TRISF6_bit=1 ;

 PIN_UMAX12=0;
}
if (iopin== 5 ) {
  TRISF7_bit=0 ;
  LATF.F7 =0;

 PIN_UMAX3=0;
}

if (iopin== 6 ) {
  TRISG4_bit=0 ;
  LATG.F4 =0;

 PIN_UMAX4=0;
}

if (iopin== 7 ) {
  TRISB3_bit=0 ;
  LATB.F3 =1;
 delay_ms(130);
  LATB.F3 =0;
  TRISB3_bit=1 ;

 PIN_EMERG12=0;
}
if (iopin== 8 ) {
  TRISB2_bit=0 ;
  LATB.F2 =0;

 PIN_EMERG3=0;
}


}
void onswitchoutputspinfromI2C( unsigned char  iopin)
{

if (iopin== 1 ) {
  TRISG2_bit=0 ;
  LATG.F2 =0;
 delay_ms(130);
  LATG.F2 =1;
  TRISG2_bit=1 ;

 PIN_UMIN12=1;
}
if (iopin== 2 ) {
  TRISG1_bit=0 ;
  LATG.F1 =1;

 PIN_UMIN3=1;
}


if (iopin== 3 ) {
  TRISG0_bit=0 ;
  LATG.F0 =1;

 PIN_UMIN4=1;
}

if (iopin== 4 ) {
  TRISF6_bit=0 ;
  LATF.F6 =0;
 delay_ms(130);
  LATF.F6 =1;
  TRISF6_bit=1 ;

 PIN_UMAX12=1;
}
if (iopin== 5 ) {
  TRISF7_bit=0 ;
  LATF.F7 =1;

 PIN_UMAX3=1;
}

if (iopin== 6 ) {
  TRISG4_bit=0 ;
  LATG.F4 =1;

 PIN_UMAX4=1;
}

if (iopin== 7 ) {
  TRISB3_bit=0 ;
  LATB.F3 =0;
 delay_ms(130);
  LATB.F3 =1;
  TRISB3_bit=1 ;

 PIN_EMERG12=1;
}
if (iopin== 8 ) {
  TRISB2_bit=0 ;
  LATB.F2 =1;

 PIN_EMERG3=1;
}


}

void set_Umax_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISF7_bit=0 ;
  LATF.F7 =1;
 PIN_UMAX3=1;

 }
else {
  TRISF7_bit=0 ;
  LATF.F7 =0;
 PIN_UMAX3=0;

}
}
void set_Umax_LT_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISF5_bit=0 ;
  LATF.F5 =1;
 delay_ms(130);
  LATF.F5 =0;
  TRISF5_bit=1 ;

 PIN_UMAX12=1;

 }
else {
  TRISF6_bit=0 ;
  LATF.F6 =1;
 delay_ms(130);
  LATF.F6 =0;
  TRISF6_bit=1 ;
 PIN_UMAX12=0;

}
}


void set_Uhav_OUTPUT( unsigned char  status)
{
 if (status== 1 ) {
  TRISB4_bit=0 ;
  LATB.F4 =1;
 delay_ms(130);
  LATB.F4 =0;
  TRISB4_bit=1 ;
 PIN_EMERG12=1;
  TRISB2_bit=0 ;
  LATB.F2 =1;
 PIN_EMERG3=1;

 }
else {
  TRISB3_bit=0 ;
  LATB.F3 =1;
 delay_ms(130);
  LATB.F3 =0;
  TRISB3_bit=1 ;
 PIN_EMERG12=0;

  TRISB2_bit=0 ;
  LATB.F2 =0;
 PIN_EMERG3=0;

}
}







void debug_init(){
 TRISB7_bit = 0 ;
 TRISB6_bit = 0 ;

}

void debug_send_byte( unsigned char  byte)
{
 unsigned char  i,parita,j,st;
parita=0;
if (byte&0x01) st=1; else st=0;
for (i=0; i<8; i++) {
  LATB.F7 =0;
 if (byte&0x01) { LATB.F6 =1; LATB.F7 =1; parita++;}
 else { LATB.F6 =0; LATB.F7 =1;}
 byte=byte>>1;
 }

  LATB.F7 =0;
 for (j=0; j<1; j++) {;}
 if (parita&0x01) { LATB.F6 =1; LATB.F7 =1;} else { LATB.F6 =0; LATB.F7 =1;}
  LATB.F7 =0;
  LATB.F6 =0;

}

void debug_print_hex_u8( unsigned char  byt)
{ unsigned char  a,b,c;
c=byt;
a=c&0x0f;
b=(c&0xF0);
b=b>>4;
b=b&0xf;
if (b>9) debug_send_byte(b+55);
else debug_send_byte(b+48);

if (a>9) debug_send_byte(a+55);
else debug_send_byte(a+48);
}


void debug_print_hex_u16( unsigned int  byte)
{
debug_print_hex_u8(byte>>8);
debug_print_hex_u8(byte);
}

void debug_print_hex_u32( unsigned long  byte)
{
debug_print_hex_u16(byte>>16);
debug_print_hex_u16(byte);
}


void debug_print_str( unsigned char  *s)
{ unsigned int  i,len;
len=strlen(s);
for (i=0; i<len; i++) debug_send_byte(*s++);
}
void debug_print_strROM(const  unsigned char  *s)
{ unsigned int  i,len;
len=10000;
while (len--) {
 if (*s==0) break;
 debug_send_byte(*s++);
}
}


void debug_print_sdec(signed int prd)
{ unsigned char  i,f;
signed int t;
 unsigned int  wrd;



if (prd&0x1000) {
 debug_send_byte('-');
 t=prd&0x7fff;
 prd=0x8000-t;

}

wrd=( unsigned int )prd;

f=0;
if (wrd>=10000) {
 i=wrd/10000;
 debug_send_byte(i+48);
 wrd=wrd%10000;
 f=1;
}

if ((wrd>=1000) || f){
 i=wrd/1000;
 debug_send_byte(i+48);
 wrd=wrd%1000;
 f=1;
}

if ((wrd>=100) || f){
 i=wrd/100;
 debug_send_byte(i+48);
 wrd=wrd%100;
 f=1;
}

if ((wrd>=10) || f){
 i=wrd/10;
 debug_send_byte(i+48);
 wrd=wrd%10;

}

debug_send_byte(wrd+48);


}
void debug_print_udec(unsigned int prd)
{ unsigned char  i,f;
signed int t;
 unsigned int  wrd;

wrd=prd;

f=0;
if (wrd>=10000) {
 i=wrd/10000;
 debug_send_byte(i+48);
 wrd=wrd%10000;
 f=1;
}

if ((wrd>=1000) || f){
 i=wrd/1000;
 debug_send_byte(i+48);
 wrd=wrd%1000;
 f=1;
}

if ((wrd>=100) || f){
 i=wrd/100;
 debug_send_byte(i+48);
 wrd=wrd%100;
 f=1;
}

if ((wrd>=10) || f){
 i=wrd/10;
 debug_send_byte(i+48);
 wrd=wrd%10;

}

debug_send_byte(wrd+48);


}





void debug_print_float(double b,  unsigned char  des)
{
 unsigned char  i,j,id,zero,sgn,nuly,OString[30];
 unsigned long  exp;
 unsigned char  temp;
 unsigned long  ccast;
 unsigned long  tccast,dccast;

memset(&OString,0x00,30);

id=0;
zero=0;
for(i=0;i<sizeof(OString);i++) OString[i]=0x00;
sgn=0;
if (((float)b)<0) {OString[id++]='-'; b=b* -1; sgn=1;}


exp=1000000000;
ccast=(long int)b;
tccast=ccast;
dccast=ccast;

for (i=0; i<10; i++) {
 j=ccast/exp;
 if (! ((!j) && (!zero))) {OString[id++]=j+48; zero=1;
 }
 if (zero) ccast=ccast%exp;
 exp=exp/10;

}

if (!tccast) OString[id++]='0';
if (des) OString[id++]='.';


nuly=0;
for (i=0; i<des; i++) {
 b=b-tccast;
 b=b*10;
 OString[id]=( unsigned char )b+48;
 if(OString[id]==48) nuly++;
 id++;
 tccast=b;
 }

OString[id++]=0;

if (!dccast) {
 if ((nuly==des) && (sgn)) {
 for (i=0; i<id; i++) {OString[i]=OString[i+1];}
 }
}
debug_print_str(&OString);
}







 void I2C1_Initialize(void) {
 INTCON.PEIE=1;
 INTCON.GIE=1;

 IOCCF.IOCCF4=0;
 IOCCN.IOCCN4=1;

 IOCCF.IOCCF3=0;
 PIR0.IOCIF=0;
 PIE0.IOCIE=1;


}
 unsigned char  I2C1_slaveWriteData;


 unsigned char  retval=0;
 unsigned char  CHK1,CHK2;
#line 1105 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
  unsigned char  bitcnt=0,i;
  unsigned char  i2cstatus=0;
  unsigned char  tempSDA,tempVALBYTE;
  unsigned char  REGCHK,REGPOINTER;
  unsigned char  *VALBYTE,I2CVAL;
  unsigned int  timeout;
  unsigned char  SDABUSHI;
  unsigned char  I2C_PROCESS;
  unsigned char  READ = 1;
  unsigned char  READCONT = 2;
  unsigned char  WRITE = 3;

  unsigned char  UNKW = 0;

  unsigned char  i2cdatasekvence=0;

  unsigned char  I2CREGID=0;
  unsigned int  I2CREGVAL=0;
  unsigned long  WEBPOTMINtimeout;
  unsigned long  WEBPOTMAXtimeout;


  unsigned char  WR_I2C_DEVADDR =  0x2A <<1;
  unsigned char  RD_I2C_DEVADDR = ( 0x2A <<1) | 0x01;



  unsigned int  CPMREGDATA[ 37 ];
  unsigned int  TEMPCPMREGDATA[ 37 ];
#line 1192 "C:/ubiprojects/GWL_CPM/version_fianlni_upravene108_062020/GWL_batscan.c"
  unsigned char  trd=0;

  unsigned char  UMIN_WR;
  unsigned char  UMAX_WR;

  unsigned char  I2CWRITEFLAG;

 void wait_for_SCL()
 {
 timeout=0x00FF;
 while ( PORTC.F3 ) {
 if (!timeout) {
 TRISC4_bit=1;
 IOCCN.IOCCN4=1;
 return;
 }
 else timeout--;
 }
 }

 void send_ACK()
 {
 TRISC4_bit=0;
 LATC.F4=0;
 wait_for_SCL();
 TRISC4_bit=1;

 }
  unsigned char  ti,en_sda;

 void interrupt() {


 if (PIR0.IOCIF) {
 PIR0.IOCIF=0;

 if (IOCCF.IOCCF4) {
 IOCCF.IOCCF4=0;
 if ( PORTC.F3 ) {
 IOCCN.IOCCN4=0;
 timeout=0x00FF;
 while ( PORTC.F3 ) {
 if (timeout) timeout--;
 else {
 i2cstatus= 0 ;
 IOCCP.IOCCP3=0;
 IOCCN.IOCCN4=1;
 return;
 }
 }

 i2cstatus= 1 ;
 IOCCP.IOCCP3=1;
 retval=0;
 bitcnt=0;
 i2cdatasekvence=0;
 I2CWRITEFLAG=0;
 }
 return;
 }
 if (IOCCF.IOCCF3) {
 IOCCP.IOCCP3=0;
 IOCCF.IOCCF3=0;
 tempSDA= PORTC.F4 ;

 if (i2cstatus== 1 )
 {
 if (!i2cdatasekvence) {
 if (bitcnt<8) {
 retval = (retval << 1) |  PORTC.F4 ;
 bitcnt++;
 }
 else if (bitcnt==8) {
 en_sda=1;
 if (retval==WR_I2C_DEVADDR) {
 send_ACK();
 if (IOCCN.IOCCN4==0) {
 IOCCP.IOCCP3=1;
 }
 i2cdatasekvence=1;
 i2cstatus= 4 ;
 en_sda=0;
 }
 else if (retval==RD_I2C_DEVADDR) {
 send_ACK();
 if (IOCCN.IOCCN4==0) {
 IOCCP.IOCCP3=1;
 }
 i2cdatasekvence=1;
 i2cstatus= 3 ;
 en_sda=0;
 }
 bitcnt=0;
 if (retval==RD_I2C_DEVADDR) {
 for (ti=0; ti< 37 ; ti++) {
 TEMPCPMREGDATA[ti]=CPMREGDATA[ti];
 }
 VALBYTE=(char*)&TEMPCPMREGDATA[I2CREGID];
 I2CVAL=*VALBYTE;
 REGPOINTER=0;
 REGCHK=I2CVAL;
 }
 retval=0;
 if (en_sda) IOCCN.IOCCN4=1;
 return;
 }
 }
 }
 else if (i2cstatus== 3 ) {

 if (bitcnt<8) {
 bitcnt++;
 if (I2CVAL &0x80) {
 TRISC4_bit=1;
 }
 else {
 TRISC4_bit=0;
 LATC.F4=0;
 }
 wait_for_SCL();
 I2CVAL=I2CVAL<<1;

 if (IOCCN.IOCCN4==0) {
 IOCCP.IOCCP3=1;
 } else TRISC4_bit=1;


 }
 else if (bitcnt==8) {
 TRISC4_bit=1;
 bitcnt=0;
 if ( PORTC.F4 ) {
 IOCCP.IOCCP4=1;
 }
 else {
 REGPOINTER++;
 if (REGPOINTER==2) {
 REGPOINTER=0;
 I2CVAL=REGCHK;
 REGCHK=0;
 }
 else {
 *VALBYTE++;
 I2CVAL=*VALBYTE;
 REGCHK=REGCHK^I2CVAL;
 }

 IOCCP.IOCCP3=1;
 }
 }
 return;
 }
 else if (i2cstatus== 4 ) {
 if (bitcnt<8) {
 retval = (retval << 1) |  PORTC.F4 ;
 bitcnt++;
 }
 else if (bitcnt==8) {
 send_ACK();
 if (IOCCN.IOCCN4==0) {
 IOCCP.IOCCP3=1;
 }
 bitcnt=0;
 if (i2cdatasekvence==1) I2CREGID=retval;
 else if (i2cdatasekvence==2) { ((char *)&I2CREGVAL)[0] =retval; CHK1=retval;}
 else if (i2cdatasekvence==3) { ((char *)&I2CREGVAL)[1] =retval; CHK2=retval;}
 else if (i2cdatasekvence==4) {CHK1=CHK1^CHK2; if (retval==CHK1) I2CWRITEFLAG=1;}

 i2cdatasekvence++;
 return;
 }

 }
 timeout=0x00FF;
 while ( PORTC.F3 ) {
 if ((tempSDA!= PORTC.F4 )) {
 retval=0;
 if ( PORTC.F4 ) {
 if (I2CWRITEFLAG) {
 if ((I2CREGID>= 21 ) && (I2CREGID<= 37 )) CPMREGDATA[I2CREGID]=I2CREGVAL;
 if (I2CREGID== 21 ) {UMIN_WR=1; }
 else if (I2CREGID== 22 ) {UMAX_WR=1; }


 I2CWRITEFLAG=0;
 }
 i2cstatus= 2 ;
 IOCCN.IOCCN4=1;

 }
 else {i2cstatus= 1 ;
 i2cdatasekvence=0;
 IOCCP.IOCCP3=1;
 bitcnt=0;
 I2CWRITEFLAG=0;

 }
 return;
 }
 else if (!timeout) {
 i2cstatus= 5 ;
 retval=0;
 bitcnt=0;
 IOCCN.IOCCN4=1;
 return;
 }
 else timeout--;


 }
 IOCCP.IOCCP3=1;
 }



 }


 if (PIR4.TMR1IF){
 PIR4.TMR1IF = 0;
 TMR1H = 0xE0;
 TMR1L = 0xC0;
 tempmil++;
 if (tempmil==100) {timeticks++; tempmil=0; }
 miliseconds++;
 return;

 }
}


 unsigned char  diginf1=0;
 unsigned long  digintime1;

 unsigned char  diginf2=0;
 unsigned long  digintime2;

void init_outputstatus();
void events_reset();

void triginiput1()
{

if ( PORTC.F2 ) {
 if (diginf1==0) {
 diginf1=1;
 digintime1=timeticks;
 }
}


if (diginf1==1) {
 if (! PORTC.F2 ) {
 if (timeticks<(digintime1+30)) diginf1=0;
 else {
 debug_print_str("\r\nDIGIN1ACT!");
 diginf1=0;
 init_outputstatus();
 events_reset();
 }
 }
 }

}
void triginiput2()
{

if ( PORTB.F5 ) {

 if (diginf2==0) {
 diginf2=1;
 digintime2=timeticks;
 }
}


if (diginf2==1) {
 if (! PORTB.F5 ) {
 if (timeticks<(digintime2+30)) diginf1=0;
 else {
 debug_print_str("\r\nVYPINAMEOPTOVSTUP!");
 diginf2=0;
 set_Uhav_OUTPUT( 0 );
 set_Umin_LT_OUTPUT( 0 );
 set_Umax_LT_OUTPUT( 0 );





  LATF.F4 =0;
 delay_ms(2000);
  TRISF4_bit = 1 ;
 }
 }
 }

}


void start_timer()
{
 PMD1.TMR1MD =0;
 PMD5.SMT1MD=0;
 T1CLK = 0x01;
 T1CON = 0x01;
 PIR4.TMR1IF = 0;
 TMR1H = 0xE0;
 TMR1L = 0xC0;
 PIE4.TMR1IE = 1;
 INTCON = 0xC0;

}




void init_LED()
{

  TRISB0_bit=0 ;
  TRISD7_bit=0 ;
  TRISE3_bit=0 ;
  TRISE4_bit=0 ;
  TRISE5_bit=0 ;
  TRISE6_bit=0 ;
  TRISE7_bit=0 ;
  TRISD0_bit=0 ;
  TRISH2_bit=0 ;
  TRISH3_bit=0 ;
  TRISD1_bit=0 ;
  TRISD2_bit=0 ;
  TRISD3_bit=0 ;
  TRISD4_bit=0 ;
  TRISD5_bit=0 ;
  TRISD6_bit=0 ;
  TRISE1_bit=0 ;
  TRISE0_bit=0 ;

 memset(&LED_stat, 0 ,16);
 memset(&temp_LED_stat, 0 ,16);




}
void start_LED()
{
 if (CELL_connect[0])  LATB.F0 =1;
 if (CELL_connect[1])  LATD.F7 =1;
 if (CELL_connect[2])  LATE.F3 =1;
 if (CELL_connect[3])  LATE.F4 =1;
 if (CELL_connect[4])  LATE.F5 =1;
 if (CELL_connect[5])  LATE.F6 =1;
 if (CELL_connect[6])  LATE.F7 =1;
 if (CELL_connect[7])  LATD.F0 =1;
 if (CELL_connect[8])  LATH.F2 =1;
 if (CELL_connect[9])  LATH.F3 =1;
 if (CELL_connect[10])  LATD.F1 =1;
 if (CELL_connect[11])  LATD.F2 =1;
 if (CELL_connect[12])  LATD.F3 =1;
 if (CELL_connect[13])  LATD.F4 =1;
 if (CELL_connect[14])  LATD.F5 =1;
 if (CELL_connect[15])  LATD.F6 =1;
  LATE.F1 =0;
  LATE.F0 =1;
 delay_ms(1000);
  LATE.F1 =1;
  LATE.F0 =0;
 delay_ms(1000);
  LATE.F0 =0;
  LATE.F1 =0;
 delay_ms(2000);


}


void EVENT_LED()
{
 unsigned char  LD;

 LD=eeprom_read ( 0 );
  LATB.F0 =0;  LATD.F7 =0;  LATE.F3 =0;  LATE.F4 =0;  LATE.F5 =0;  LATE.F6 =0;  LATE.F7 =0;  LATD.F0 =0;  LATH.F2 =0;  LATH.F3 =0;  LATD.F1 =0;  LATD.F2 =0;  LATD.F3 =0;  LATD.F4 =0;  LATD.F5 =0;  LATD.F6 =0;
 if ((LD>0) && (LD<17)) {
 if (LD==1)  LATB.F0 =1;
 if (LD==2)  LATD.F7 =1;
 if (LD==3)  LATE.F3 =1;
 if (LD==4)  LATE.F4 =1;
 if (LD==5)  LATE.F5 =1;
 if (LD==6)  LATE.F6 =1;
 if (LD==7)  LATE.F7 =1;
 if (LD==8)  LATD.F0 =1;
 if (LD==9)  LATH.F2 =1;
 if (LD==10)  LATH.F3 =1;
 if (LD==11)  LATD.F1 =1;
 if (LD==12)  LATD.F2 =1;
 if (LD==13)  LATD.F3 =1;
 if (LD==14)  LATD.F4 =1;
 if (LD==15)  LATD.F5 =1;
 if (LD==16)  LATD.F6 =1;

 if (eeprom_read( 3 )== 0 ) {
  LATE.F1 =0;
  LATE.F0 =1;
 }
 if (eeprom_read( 3 )== 1 ) {
  LATE.F1 =1;
  LATE.F0 =0;
 }
 delay_ms(2000);
  LATE.F0 =0;
  LATE.F1 =0;
 delay_ms(1000);
 }


}




void save_eeprom_event()
 {

 eeprom_write( 0 ,EVENTCELLID);
 eeprom_write( 1 +1,EVENTCELLV);

 eeprom_write( 1 ,EVENTCELLV>>8);

 eeprom_write( 3 ,EVENTCELLTYPE);
 eeprom_write( 4 +1,EVENTCELLTOTALV);
 eeprom_write( 4 ,EVENTCELLTOTALV>>8);

 delay_ms(20);
 CPMREGDATA[ 33 ]=EVENTCELLID;
 CPMREGDATA[ 34 ]=EVENTCELLV;
 CPMREGDATA[ 35 ]=EVENTCELLTYPE;
 CPMREGDATA[ 36 ]=EVENTCELLTOTALV;


}

void events_reset()
{
 CPMREGDATA[ 33 ]=0xFFFF;
 CPMREGDATA[ 34 ]=0xFFFF;
 CPMREGDATA[ 35 ]=0xFFFF;
 CPMREGDATA[ 36 ]=0xFFFF;
 eeprom_write( 0 ,0xFF);
 eeprom_write( 1 ,0xFF);
 eeprom_write( 1 +1,0xFF);
 eeprom_write( 3 ,0xFF);
 eeprom_write( 4 ,0xFF);
 eeprom_write( 4 +1,0xFF);
 delay_ms(20);


 }


void eeprom_event_i2c_register_initialize()
{  unsigned int  LD;
 LD=eeprom_read ( 0 );
 if ((LD>0) && (LD<17)) {
 CPMREGDATA[ 33 ]=( unsigned int )(LD);
 CPMREGDATA[ 34 ]=(eeprom_read( 1 )<<8);
 CPMREGDATA[ 34 ]|=eeprom_read( 1 +1);
 CPMREGDATA[ 35 ]=eeprom_read( 3 );
 CPMREGDATA[ 36 ]=(eeprom_read( 4 )<<8);
 CPMREGDATA[ 36 ]|=eeprom_read( 4 +1);
 }

}




 unsigned char  fl=0;

void LED_poll()
{

  LATB.F0 =0; LATD.F7 =0; LATE.F3 =0; LATE.F4 =0; LATE.F5 =0; LATE.F6 =0; LATE.F7 =0; LATD.F0 =0;
  LATH.F2 =0; LATH.F3 =0; LATD.F1 =0; LATD.F2 =0; LATD.F3 =0; LATD.F4 =0; LATD.F5 =0; LATD.F6 =0;
 if (LED_stat[0]== 2 ) { LATB.F0 =1; TRISB0_bit=0 ;fl=1;}
 if (LED_stat[1]== 2 ) { LATD.F7 =1; }
 if (LED_stat[2]== 2 ) { LATE.F3 =1; }
 if (LED_stat[3]== 2 )  LATE.F4 =1;
 if (LED_stat[4]== 2 )  LATE.F5 =1;
 if (LED_stat[5]== 2 )  LATE.F6 =1;
 if (LED_stat[6]== 2 )  LATE.F7 =1;
 if (LED_stat[7]== 2 )  LATD.F0 =1;
 if (LED_stat[8]== 2 )  LATH.F2 =1;
 if (LED_stat[9]== 2 )  LATH.F3 =1;
 if (LED_stat[10]== 2 )  LATD.F1 =1;
 if (LED_stat[11]== 2 )  LATD.F2 =1;
 if (LED_stat[12]== 2 )  LATD.F3 =1;
 if (LED_stat[13]== 2 )  LATD.F4 =1;
 if (LED_stat[14]== 2 )  LATD.F5 =1;
 if (LED_stat[15]== 2 )  LATD.F6 =1;




  LATE.F1 =1; TRISE1_bit=0 ;  LATE.F0 =0;  TRISE0_bit=1 ;
 delay_ms(4);
  LATE.F1 =0;

  LATB.F0 =0; LATD.F7 =0; LATE.F3 =0; LATE.F4 =0; LATE.F5 =0; LATE.F6 =0; LATE.F7 =0; LATD.F0 =0;
  LATH.F2 =0; LATH.F3 =0; LATD.F1 =0; LATD.F2 =0; LATD.F3 =0; LATD.F4 =0; LATD.F5 =0; LATD.F6 =0;
 delay_us(1000);
 if (LED_stat[0]== 1 ) { LATB.F0 =1; }
 if (LED_stat[1]== 1 ) { LATD.F7 =1; }
 if (LED_stat[2]== 1 ) { LATE.F3 =1; }
 if (LED_stat[3]== 1 )  LATE.F4 =1;
 if (LED_stat[4]== 1 )  LATE.F5 =1;
 if (LED_stat[5]== 1 )  LATE.F6 =1;
 if (LED_stat[6]== 1 )  LATE.F7 =1;
 if (LED_stat[7]== 1 )  LATD.F0 =1;
 if (LED_stat[8]== 1 )  LATH.F2 =1;
 if (LED_stat[9]== 1 )  LATH.F3 =1;
 if (LED_stat[10]== 1 )  LATD.F1 =1;
 if (LED_stat[11]== 1 )  LATD.F2 =1;
 if (LED_stat[12]== 1 )  LATD.F3 =1;
 if (LED_stat[13]== 1 )  LATD.F4 =1;
 if (LED_stat[14]== 1 )  LATD.F5 =1;
 if (LED_stat[15]== 1 )  LATD.F6 =1;

  LATE.F0 =1; TRISE0_bit=0 ;  LATE.F1 =0;  TRISE1_bit=1 ;
 delay_ms(4);
  LATE.F0 =0;
  TRISE0_bit=1 ;


}

void multiplex_init()
{
 LATB.F1 =1;
 TRISB1_bit=0 ;
 LATA.F2 =1;
 TRISA2_bit=0 ;
 LATH.F0 =1;
 LATH.F1 =1;
 LATA.F0 =1;
 LATA.F1 =1;
 TRISH0_bit=0 ;
 TRISH1_bit=0 ;
 TRISA0_bit=0 ;
 TRISA1_bit=0 ;

 LATC.F6 =1;
 LATC.F0 =1;
 LATC.F1 =1;
 LATA.F4 =1;

 TRISC6_bit=0 ;
 TRISC0_bit=0 ;
 TRISC1_bit=0 ;
 TRISA4_bit=0 ;

memset(&CHN_voltage,0x00,32);


}





void set_CELL_channel( unsigned char  chn)
{


if (chn==1) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =0; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =0; LATH.F0 =0;
 }
else
if (chn==2) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =0; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =0; LATH.F0 =0;
 }
else
if (chn==3) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =0; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =0; LATH.F0 =1;
 }
else
if (chn==4) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =1; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =0; LATH.F0 =1;
 }
else
if (chn==5) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =1; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =1; LATH.F0 =0;
 }
else
if (chn==6) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =1; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =1; LATH.F0 =0;
 }
else
if (chn==7) { LATA.F4 =0; LATC.F1 =0; LATC.F0 =1; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =1; LATH.F0 =1;
 }
else
if (chn==8) { LATA.F4 =0; LATC.F1 =1; LATC.F0 =0; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =0; LATH.F1 =1; LATH.F0 =1;
 }
else
if (chn==9) { LATA.F4 =0; LATC.F1 =1; LATC.F0 =0; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =0; LATH.F0 =0;
 }
else
if (chn==10){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =0; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =0; LATH.F0 =0;
 }
else
if (chn==11){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =0; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =0; LATH.F0 =1;
 }
else
if (chn==12){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =1; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =0; LATH.F0 =1;
 }
else
if (chn==13){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =1; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =1; LATH.F0 =0;
 }
else
if (chn==14){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =1; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =1; LATH.F0 =0;
 }
else
if (chn==15){ LATA.F4 =0; LATC.F1 =1; LATC.F0 =1; LATC.F6 =1;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =1; LATH.F0 =1;
 }
else
if (chn==16){ LATA.F4 =1; LATC.F1 =0; LATC.F0 =0; LATC.F6 =0;
  LATA.F1 =0; LATA.F0 =1; LATH.F1 =1; LATH.F0 =1;
 }


else
if (chn== 17 ){
  LATA.F4 =1; LATC.F1 =0; LATC.F0 =0; LATC.F6 =1;
  LATA.F1 =1; LATA.F0 =0; LATH.F1 =0; LATH.F0 =1;
 }

else
if (chn== 18 ){
  LATA.F4 =1; LATC.F1 =0; LATC.F0 =1; LATC.F6 =0;
  LATA.F1 =1; LATA.F0 =0; LATH.F1 =1; LATH.F0 =0;
 }


 TRISH0_bit=0 ;
 TRISH1_bit=0 ;
 TRISA0_bit=0 ;
 TRISA1_bit=0 ;


 TRISC6_bit=0 ;
 TRISC0_bit=0 ;
 TRISC1_bit=0 ;
 TRISA4_bit=0 ;

}


 unsigned int  adc_getval( unsigned char  channel)
{
 ADPCH=channel;
 ADCON0.ADON = 1;
 ADCON2.ADACLR = 1;
 while(ADCON2.ADACLR);
 ADCON0.GO = 1;
 while (ADCON0.GO);
 return ((ADRESH << 8) + ADRESL);


}



 unsigned int  TEST_CELL( unsigned char  chn)
{
 unsigned long  suma,result;
 unsigned char  i;
 unsigned int  testtemp,max;
suma=0;


set_CELL_channel ( 17 );
 LATB.F1 =0;  LATA.F2 =0;
 TRISB1_bit=0 ;
 TRISA2_bit=0 ;

delay_ms(6);

 LATB.F1 =1;  LATA.F2 =1;
 TRISB1_bit=0 ;
 TRISA2_bit=0 ;

set_CELL_channel(chn);


 LATB.F1 =0;  LATA.F2 =0;
 TRISB1_bit=0 ;
 TRISA2_bit=0 ;
delay_ms(6);
for (i=0; i<20; i++) {
 suma+=adc_getval( 0x28 );
 }
result=suma/20;
testtemp=result;

 LATB.F1 =1;  LATA.F2 =1;
 TRISB1_bit=0 ;
 TRISA2_bit=0 ;
return testtemp;

}


 unsigned long  voltsuma=0;
 unsigned char  CONDUMAXWAIT,CONDUMAXNOW;
 unsigned char  CONDUMINWAIT,CONDUMINNOW;
 unsigned char  CELLUNDERMIN,CELLABOVEMAX;

void TEST_CELL_poll()
{  unsigned char  odd=0;
  unsigned int  Vdif,Voff;
  signed int  Vres;
  unsigned long  vysledek,test;
  unsigned char  i;
  unsigned int  Ucell;



 Voff=TEST_CELL( 18 );
 Vdif=TEST_CELL(GB_chn);

 odd=GB_chn & 0x01;



 Vysledek=0;
 Vres=Vdif;
 Vres=Vres-Voff;
 if (!odd) {Vres=Vres* -1;}

 if (Vres>0) {
 if ((Vres> 250 ) && (Vres<1700)) {
 Vysledek=Vres;
 Vysledek*=2560;
 Vysledek/=1000;
 if (GB_chn==1) Vysledek+= 20 ;

 } else {Vres=0; Vysledek=0;}
 }
 else {Vysledek=0; Vres=0;}


 test=( unsigned int )Vysledek;
 CHN_voltage[Gb_chn-1]=test;






 if (test> 250 ) {
 CELL_connect[GB_chn-1]=1;
 if (!Missed_cell_TEST) Missed_cell_ID=GB_chn;

 if ( (test>=GB_Umin) && (test<=GB_Umax) ) temp_LED_stat[GB_chn-1]= 0 ;
 else {
 temp_LED_stat[GB_chn-1]= 0 ;
 if (test<=GB_Umin) temp_LED_stat[GB_chn-1]= 1 ;
 if (test>=GB_Umax) {temp_LED_stat[GB_chn-1]= 2 ;

 }

 }

 CPMREGDATA[Gb_chn]=test;

 } else
 { temp_LED_stat[GB_chn-1]= 0 ;
 if (CELL_connect[GB_chn-1]) {
 DISCONNECTFLAG=1;
 }

 }


 GB_chn++;
 if (GB_chn>16) {
 if (!Missed_cell_TEST) Missed_cell_TEST=1;
 GB_chn=1;
 if (!cellconnectflag) cellconnectflag=1;
 LEDSTATFLAG=1;

 voltsuma=0;
 testUmax=0;
 testUmin=0xFFFF;
 CONDUMAXNOW=0;
 CONDUMAXWAIT=0;
 CONDUMINNOW=0;
 CONDUMINWAIT=0;

 CELLUNDERMIN=0;
 CELLABOVEMAX=0;

 for (i=0; i<16; i++) {
 if (CELL_connect[i]) {
 Ucell=CHN_voltage[i];

 voltsuma+= Ucell;
 if (testUmax<CHN_voltage[i]) testUmax=CHN_voltage[i];
 if (testUmin>CHN_voltage[i]) testUmin=CHN_voltage[i];

 if (Ucell<=(GB_Umin+ 100 )) CONDUMAXWAIT=1;
 if (Ucell<=GB_Umin) CONDUMAXNOW=1;
 if (Ucell>=(GB_Umax- 100 )) CONDUMINWAIT=1;
 if (Ucell<=GB_Umin) CONDUMINNOW=1;

 if (Ucell<=GB_Umin) CELLUNDERMIN=1;
 if (Ucell>=GB_Umax) CELLABOVEMAX=1;

 } else break;
 }


 if (voltsuma>0xFFFF) voltsuma=0xFFFF;
 CPMREGDATA[ 17 ]=( unsigned int )voltsuma;

 if (Umax4_relay_event== 2 ) {
 if ((CONDUMAXWAIT==1) && (CELLABOVEMAX==0)) {
 Umax4_relay_delay=timeticks+ 150 ;
 Umax4_relay_event= 3 ;
 debug_print_str("\r\nUMAX COND 4WAITTIME!");
 }
 }
 else if (Umax4_relay_event== 3 ) {
 if (CONDUMAXWAIT==0) {
 Umax4_relay_event= 2 ;
 debug_print_str("\r\nUMAX4RETURN!");
 }
 if (timeticks>Umax4_relay_delay) {
 set_Umax4_OUTPUT( 1 );
 Umax4_relay_event= 1 ;
 debug_print_str("\r\nUMAX4EVRETHYSTTIME!");
 }
 if ((CONDUMAXNOW==1) && (CELLABOVEMAX==0)) {

 debug_print_str("\r\nUMAX4EVRET NOW:");
 debug_print_udec(testUmin);
 debug_print_str(">GBUMIN:");
 debug_print_udec(GB_Umin);
 debug_print_str("GBUMIN-UMINHYST:");
 debug_print_udec(GB_Umin+ 100 );

 set_Umax4_OUTPUT( 1 );
 Umax4_relay_event= 1 ;

 }

 }



 if (Umin4_relay_event== 2 ) {
 if ((CONDUMINWAIT==1) && (CELLUNDERMIN==0)) {
 Umin4_relay_delay=timeticks+ 150 ;
 Umin4_relay_event= 3 ;
 debug_print_str("\r\nUMIN COND 4WAITTIME!");
 }
 }
 else if (Umin4_relay_event== 3 ) {
 if (CONDUMINWAIT==0) {
 Umin4_relay_event= 2 ;
 debug_print_str("\r\nUMIN4RETURN!");
 }
 if (timeticks>Umin4_relay_delay) {
 set_Umin4_OUTPUT( 1 );
 Umin4_relay_event= 0xFF ;
 debug_print_str("\r\nUMIN4EVRETHYSTTIME!");
 }
 if ((CONDUMINNOW==1) && (CELLUNDERMIN==0)) {
 debug_print_str("\r\nUMIN4EVRET.TESTUMAX:");
 debug_print_udec(testUmax);
 debug_print_str(">GBUMAX:");
 debug_print_udec(GB_Umax);
 debug_print_str("GBUMAX-UMAXHYST:");
 debug_print_udec(GB_Umax- 100 );

 set_Umin4_OUTPUT( 1 );
 Umin4_relay_event= 0xFF ;
 }



 }




 }
 if (Missed_cell_TEST==1) {


 debug_print_str("\r\nMISSED CELL TEST:");
 debug_print_hex_u8(Missed_cell_ID);
 Missed_cell_TEST=2;
 for (i=0; i<Missed_cell_ID; i++) {
 if (!CELL_connect[i]) MISSEDINTERCELLFLAG=1;
 debug_print_hex_u8(CELL_connect[i]);

 }
 debug_print_str("\r\nMISSED CELL TESTRES:");
 debug_print_hex_u8(MISSEDINTERCELLFLAG);
 }








}


 unsigned char  Umin_button()
{  unsigned char  i;
  unsigned int  temp;
  unsigned long  suma;
 suma=0;



 for (i=0; i<50; i++) {
 suma+=adc_getval( 0x37 );
 }
 temp=suma/50;

 if (temp<0x0020) {GB_Umin= 1700 ;GB_Uhavmin= 1700 - 300 ; MISSEDBUTTONFLAG=0; return 0;}
 else if ((temp>0x006E) && (temp<0x00AA)) {GB_Umin= 1800 ; GB_Uhavmin= 1800 - 300 ; MISSEDBUTTONFLAG=0; return 1;}
 else if ((temp>0x00F0) && (temp<0x0168)) {GB_Umin= 1900 ; GB_Uhavmin= 1900 - 300 ; MISSEDBUTTONFLAG=0; return 2;}
 else if ((temp>0x0180) && (temp<0x01E0)) {GB_Umin= 2000 ; GB_Uhavmin= 2000 - 300 ; MISSEDBUTTONFLAG=0; return 3;}
 else if ((temp>0x0250) && (temp<0x02A0)) {GB_Umin= 2800 ; GB_Uhavmin= 2800 - 300 ; MISSEDBUTTONFLAG=0; return 4;}
 else if ((temp>0x02C0) && (temp<0x0314)) {GB_Umin= 2900 ; GB_Uhavmin= 2900 - 300 ; MISSEDBUTTONFLAG=0; return 5;}
 else if ((temp>0x0340) && (temp<0x0390)) {GB_Umin= 3000 ; GB_Uhavmin= 3000 - 300 ; MISSEDBUTTONFLAG=0; return 6;}
 else if ((temp>0x03A9) && (temp<0x03F9)) {GB_Umin= 3100 ; GB_Uhavmin= 3100 - 300 ; MISSEDBUTTONFLAG=0; return 7;}
 else {
 MISSEDBUTTONFLAG=1;
 debug_print_str("\r\nUMINBUTERR:");
 debug_print_hex_u16(temp);
 }


 return 0xFF;
}

 unsigned char  Umax_button()
{
  unsigned char  i;
  unsigned int  temp;
  unsigned long  suma;
 suma=0;
 for (i=0; i<50; i++) {
 suma+=adc_getval( 0x29 );
 }
 temp=suma/50;

 if (temp<0x0020) {GB_Umax= 2500 ;GB_Uhavmax= 2500 + 300 ; MISSEDBUTTONFLAG=0; return 0;}
 else if ((temp>0x0170) && (temp<0x0180)) {GB_Umax= 2600 ; GB_Uhavmax= 2600 + 300 ; MISSEDBUTTONFLAG=0; return 1;}
 else if ((temp>0x02E5) && (temp<0x0320)) {GB_Umax= 2700 ; GB_Uhavmax= 2700 + 300 ; MISSEDBUTTONFLAG=0; return 2;}
 else if ((temp>0x03F0) && (temp<0x0420)) {GB_Umax= 2800 ; GB_Uhavmax= 2800 + 300 ; MISSEDBUTTONFLAG=0; return 3;}
 else if ((temp>0x0570) && (temp<0x05B0)) {GB_Umax= 3500 ; GB_Uhavmax= 3500 + 300 ; MISSEDBUTTONFLAG=0; return 4;}
 else if ((temp>0x0640) && (temp<0x0680)) {GB_Umax= 3600 ; GB_Uhavmax= 3600 + 300 ; MISSEDBUTTONFLAG=0; return 5;}
 else if ((temp>0x0710) && (temp<0x0740)) {GB_Umax= 3700 ; GB_Uhavmax= 3700 + 300 ; MISSEDBUTTONFLAG=0; return 6;}
 else if ((temp>0x07B0) && (temp<0x07DA)) {GB_Umax= 3800 ; GB_Uhavmax= 3800 + 300 ; MISSEDBUTTONFLAG=0; return 7;}
 else {
 MISSEDBUTTONFLAG=1;
 debug_print_str("\r\nUMAXBUTERR:");
 debug_print_hex_u16(temp);


 }


}

 void init_adc()
{
 PMD2=0xFF;
 PMD2.ADCMD=0;
 PMD3=0xFF;
 PMD1=0xFF;
 PMD4=0xFF;
 PMD5=0xFF;
 ANSELF=0x03;
 ANSELG=0x80;
 ANSELB=0x00;
 ANSELC=0x00;
 ANSELD=0x00;
 ANSELE=0x00;
  TRISF0_bit = 1 ;
  TRISG7_bit = 1 ;
  TRISF1_bit = 1 ;
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

 ADPREH=0x00;
 ADPREL=0x00;
 ADACQH=0x00;
 ADACQL=0x00;
 ADREF = 0x02;
 ANSELA.ANSA3=1;




}

 unsigned char  pushf=0;
 unsigned long  pushtime=0;
 unsigned char  LEDOFFflag=0;
 unsigned long  LEdtime;

 unsigned char  GBchn=0,GBstatus=0;

void DACs_init();

void push_poll()

{
 signed int  Vres;
float vysledek;
 unsigned int  Voffset,Vdif;

if (! PORTC.F5 ) {
 if (pushf==0) {
 pushf=1;
 pushtime=timeticks;
 debug_print_strROM("\r\nPUSH1");
 }
}
if (pushf==1) {

 if (timeticks>(pushtime+20)) {
 debug_print_strROM("\r\nVYPINAME!");
 TOFFFLAG=1;
 Discontime=timeticks+5;
 init_LED();
 pushf=2;
 return;
 }
}


}

void delay()
{ unsigned char  i;
 for (i=0; i<10; i++) asm NOP;

}

void dac_i2c1_stop (void)
{

 TRISF3_bit =0;
 TRISG6_bit =0;

 LATG.F6 =0;
 delay();
 LATF.F3 =0;
 delay();
 LATG.F6 =1;
 delay();
 TRISF3_bit =1;
 LATF.F3 =1;
 delay();
}


void dac_i2c1_start(void)
{
  TRISG6_bit =0;
  LATG.F6 =0;
  TRISF3_bit =0;
  LATF.F3 =1;
 delay();
  LATG.F6 =1;
 delay();
  LATF.F3 =0;
 delay();
  LATG.F6 =0;
 delay();

}


void dac_i2c1_write( unsigned char  o_byte)
{
  unsigned char  n;
 for(n=0; n<8; n++)
 {  LATG.F6 =0;
 delay();
 if(o_byte&0x80)
 {
  LATF.F3 =1;
 delay();
 }
 else
 {
  LATF.F3 =0;
 delay();
 }
  LATG.F6 =1;
 delay();
 o_byte = o_byte << 1;
  LATG.F6 =0;

 }
  LATF.F3 =1;
 delay();
  LATG.F6 =0;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();

}

void dac_i2c1_nack(void)
{
  LATF.F3 =1;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();
}

void dac_i2c1_ack(void)
{  LATF.F3 =0;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();
}


 unsigned char  dac_i2c1_read()
{
  unsigned char  i_byte=0, n;
  TRISF3_bit =1;

 WPUF.WPUF3=1;
 for (n=0; n<8; n++)
 { i_byte<<=1;
  LATG.F6 =0;
 delay();
  LATG.F6 =1;
 delay();
 if ( PORTF.F3 ) i_byte |=0x01;
 delay();
  LATG.F6 =0;
 delay();
 }
  TRISF3_bit =0;

 WPUF.WPUF3=0;
 return(i_byte);
}

void dac_i2c2_stop (void)
{

 TRISF2_bit =0;
 TRISG6_bit =0;

 LATG.F6 =0;
delay();
 LATF.F2 =0;
delay();
 LATG.F6 =1;
delay();
 TRISF2_bit =1;
 LATF.F2 =1;
delay();
}


void dac_i2c2_start(void)
{
  TRISG6_bit =0;
  LATG.F6 =0;
  TRISF2_bit =0;
  LATF.F2 =1;
 delay();
  LATG.F6 =1;
 delay();
  LATF.F2 =0;
 delay();
  LATG.F6 =0;
 delay();

}


void dac_i2c2_write( unsigned char  o_byte)
{
  unsigned char  n;
 for(n=0; n<8; n++)
 {  LATG.F6 =0;
 delay();
 if(o_byte&0x80)
 {
  LATF.F2 =1;
 delay();
 }
 else
 {
  LATF.F2 =0;
 delay();
 }
  LATG.F6 =1;
 delay();
 o_byte = o_byte << 1;
  LATG.F6 =0;

 }

  LATF.F2 =1;
 delay();
  LATG.F6 =0;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();

}

void dac_i2c2_nack(void)
{
  LATF.F2 =1;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();
}

void dac_i2c2_ack(void)
{  LATF.F2 =0;
 delay();
  LATG.F6 =1;
 delay();
  LATG.F6 =0;
 delay();
}


 unsigned char  dac_i2c2_read()
{
  unsigned char  i_byte=0, n;
  TRISF2_bit =1;

 WPUF.WPUF2=1;
 for (n=0; n<8; n++)
 { i_byte<<=1;
  LATG.F6 =0;
 delay();

  LATG.F6 =1;
 delay();
 if ( PORTF.F2 ) i_byte |=0x01;
 delay();
  LATG.F6 =0;
 delay();
 }
  TRISF2_bit =0;

 WPUF.WPUF2=0;
 return(i_byte);
}

 unsigned char  DAC1config;
 unsigned char  DAC2config;

void write_DAC1_configreg( unsigned char  cmnd)
{
 dac_i2c1_start();
 dac_i2c1_write( 0xC0 );
 dac_i2c1_write(cmnd |  0x40  );
 dac_i2c1_stop();
}

void write_DAC2_configreg( unsigned char  cmnd)
{
 dac_i2c2_start();
 dac_i2c2_write( 0xC0 );
 dac_i2c2_write(cmnd |  0x40  );
 dac_i2c2_stop();
}

void DAC1_powerdown( unsigned char  pdOutR)
{
 write_DAC1_configreg((pdOutR &  0xF9 ) | (pdOutR & ! 0xF9 ));
}

void DAC1_setoutputlevel( unsigned int  level)
{
 if (level>0x1000) level=0x0FFF;
 dac_i2c1_start();
 dac_i2c1_write( 0xC0 );
 dac_i2c1_write(DAC1config);
 dac_i2c1_write(( unsigned char ) ((level>>4) & 0xFF));
 dac_i2c1_write(( unsigned char ) ((level<<4) & 0xF0));
 dac_i2c1_stop();
  LATF.F3 =1;
 WPUF.WPUF3=1;
  TRISF3_bit =1;
}
void DAC2_setoutputlevel( unsigned int  level)
{
 if (level>0x1000) level=0x0FFF;
 dac_i2c2_start();
 dac_i2c2_write( 0xC0 );
 dac_i2c2_write(DAC2config);
 dac_i2c2_write(( unsigned char ) ((level>>4) & 0xFF));
 dac_i2c2_write(( unsigned char ) ((level<<4) & 0xF0));
 dac_i2c2_stop();
  LATF.F2 =1;
 WPUF.WPUF2=1;
  TRISF2_bit =1;

}





void DACs_init()
{

  TRISG6_bit =0;
  TRISF3_bit =0;
  TRISF2_bit =0;

 DAC1config=0;
 DAC2config=0;

 DAC1config= 0x40 |  0x00  |  0x18  | 0x00  ;
 DAC1_setoutputlevel(0);


 DAC2config= 0x40 |  0x00  |  0x18  | 0x00  ;
 DAC2_setoutputlevel(0x7ff);



}

void DAC_poll()
{
  unsigned char  i;
  unsigned int  min,max;
 min=0x0FFF;
 max=0;



for (i=0; i<Missed_cell_ID; i++) {


 if (CHN_voltage[i]> 250 ) {

 if (CHN_voltage[i]>max) {max=CHN_voltage[i]; GBmaxid=i;}
 if (CHN_voltage[i]<min) {min=CHN_voltage[i]; GBminid=i; }
 }
 }
 if (min==0x0FFF) min=0;

 GBCELLUmax=max;
 GBCELLUmin=min;
 DAC1_setoutputlevel(min);
 DAC2_setoutputlevel(max);
}


void init_outputstatus()
{
UminOKstatus= 0xFF ;
UmaxOKstatus= 0xFF ;

UhavOKstatus= 0 ;
GBUminEvent=1;
GBUmaxEvent=1;
DISCflag=0;

GBUminBlockLR=1;
GBUminBlock=1;
GBUmaxBlockLR=1;
GBUmaxBlock=1;
GBUhavBlock=1;


Umin4_relay_event= 0xFF ;
Umax4_relay_event= 0xFF ;



}


 unsigned char  EVENTTOTALflag=0;
 unsigned int  EVENTTOTALV;
 unsigned int  totalV;

void OUTPUT_poll()
{
 unsigned char  i,UmaxEvent,UminEvent;
 unsigned char  Umax4Event;
 unsigned char  Umin4Event;



UmaxEvent=0;
UminEvent=0;

Umax4Event=0;
Umin4Event=0;




DISCflag=0;



for (i=0; i<16; i++) {
 CHN_voltageMINEventTemp[i]=0x00;
 CHN_voltageMAXEventTemp[i]=0x00;

}
GBUhavUminident=0;
GBUhavUmaxident=0;




totalV=0;

for (i=0; i<Missed_cell_ID; i++) {


 if (CHN_voltage[i]> 250 ) {

 totalV+= CHN_voltage[i];
 if (CHN_voltage[i]<GB_Uhavmin) {
 DISCflag=1;
 GBUhavUminident=1;
 debug_print_str("\r\nUHAVMINID!:");
 debug_print_hex_u8(i);
 EVENTCELLID=i+1;
 EVENTCELLTYPE= 2 ;
 EVENTCELLV=CHN_voltage[i];
 if (EVENTTOTALflag) {
 EVENTCELLTOTALV=EVENTTOTALV;
 }

 }
 if (CHN_voltage[i]>GB_Uhavmax) {
 DISCflag=1;
 GBUhavUmaxident=1;
 EVENTCELLID=i+1;
 EVENTCELLTYPE= 3 ;
 EVENTCELLV=CHN_voltage[i];
 if (EVENTTOTALflag) {
 EVENTCELLTOTALV=EVENTTOTALV;
 }

 }




 if (GB_Umin!= 0xFFFF ) {
 if (CHN_voltage[i]<GB_Umin) {
 UminEvent=1;
 CHN_voltageMINEventTemp[i]=0x01;
 Umin4Event=1;


 EVENTCELLID=i+1;
 EVENTCELLTYPE= 0 ;
 EVENTCELLV=CHN_voltage[i];
 if (EVENTTOTALflag) {
 EVENTCELLTOTALV=EVENTTOTALV;
 }

 }
 }

 if (GB_Umax!= 0xFFFF ) {


 if (CHN_voltage[i]>GB_Umax) {

 UmaxEvent=1;
 EVENTCELLID=i+1;
 EVENTCELLTYPE= 1 ;
 EVENTCELLV=CHN_voltage[i];

 if (EVENTTOTALflag) {
 EVENTCELLTOTALV=EVENTTOTALV;
 }


 CHN_voltageMAXEventTemp[i]=0x01;
 Umax4Event=1;
 }


 }



 }
 }

 EVENTTOTALV=totalV;
 EVENTTOTALflag=1;

 if (DISCflag==1) {
 if ((GBUhavUminident) || (UhavOKstatus== 1 ))
 {
 debug_print_str("\r\nUHAVFAIL:");
 debug_print_hex_u8( DISCflag);
 debug_print_hex_u8(GBUhavUminident);
 debug_print_hex_u8(UhavOKstatus== 1 );

 UhavOKstatus= 0 ;
 Uhav_ltrelay_event= 0 ;
 Uhav_ltrelay_delay=timeticks+ 300 ;
 }
 }
 if ((DISCflag==0) && (UhavOKstatus== 0 ) )
 {
 UhavOKstatus= 1 ;
 if (GBUhavBlock==1) {
 set_Uhav_OUTPUT( 1 );
 Uhav_ltrelay_event= 1 ;
 debug_print_str("\r\nUHAVBLOCK");
 }

 debug_print_str("\r\nUHAVOK");

 }




 if (GBUminEvent==1) {


 if ( (Umin4Event==1) && ((Umin4_relay_event== 0xFF ) || (Umin4_relay_event== 1 )) ) {
 Umin4_relay_event= 0 ;
 Umin4_relay_delay=timeticks+ 150 ;
 debug_print_str("\r\nUMIN4FAIL");
 }
 if (Umin4Event==0) {
 if ((Umin4_relay_event== 0 ) || (Umin4_relay_event== 0xFF )) {
 Umin4_relay_event= 1 ;
 set_Umin4_OUTPUT( 1 );
 debug_print_str("\r\nUMIN4EVENTOK");
 }

 }

 if ((UminEvent==1) && ( (UminOKstatus== 1 ) || (UminOKstatus== 0xFF )) )
 {
 UminOKstatus= 0 ;


 Umin_relay_event= 0 ;
 Umin_ltrelay_event= 0 ;
 Umin_relay_delay=timeticks+ 150 ;
 Umin_ltrelay_delay=timeticks+ 350 ;
 }
 if ((UminEvent==0) && ( (UminOKstatus== 0 ) || (UminOKstatus== 0xFF )) )
 {
 UminOKstatus= 1 ;
 if (GBUminBlock==1) {
 debug_print_str("\r\nUMINOKSET");
 set_Umin_OUTPUT( 1 );
 Umin_relay_event= 1 ;
 }
 if (GBUminBlockLR==1) {
 set_Umin_LT_OUTPUT( 1 );
 Umin_ltrelay_event= 1 ;
 }

 debug_print_str("\r\n UMINOK");

 }
 }


 if (GBUmaxEvent==1)
 {
 if ( (Umax4Event==1) && ((Umax4_relay_event== 0xFF ) || (Umax4_relay_event== 1 )) ) {
 Umax4_relay_event= 0 ;
 Umax4_relay_delay=timeticks+ 150 ;
 debug_print_str("\r\nUMAX4EVENTFAIL");
 }
 if (Umax4Event==0) {
 if ((Umax4_relay_event== 0 ) || (Umax4_relay_event== 0xFF )) {
 Umax4_relay_event= 1 ;
 set_Umax4_OUTPUT( 1 );
 debug_print_str("\r\nUMAX4EVENTOK");
 }

 }




 if ( (UmaxEvent==1) && ( (UmaxOKstatus== 1 ) || (UmaxOKstatus== 0xFF )) )
 {
 UmaxOKstatus= 0 ;
 Umax_relay_event= 0 ;

 Umax_ltrelay_event= 0 ;
 Umax_relay_delay=timeticks+ 150 ;
 Umax_ltrelay_delay=timeticks+ 350 ;
 debug_print_str("\r\nUMAXFAIL");


 }
 if ((UmaxEvent==0) && ( (UmaxOKstatus== 0 ) || (UmaxOKstatus== 0xFF )) )
 {
 UmaxOKstatus= 1 ;
 debug_print_str("\r\nUMAXOK");
 if (GBUmaxBlock==1) {
 debug_print_str("\r\nUMAXOKSET");
 set_Umax_OUTPUT( 1 );
 Umax_relay_event= 1 ;



 }
 if (GBUmaxBlockLR==1) {
 set_Umax_LT_OUTPUT( 1 );
 Umax_ltrelay_event= 1 ;
 }

 }

 }

}



void DELAY_poll()
{
 unsigned char  i;


 if (Umin4_relay_event== 0 ) {
 if (timeticks>Umin4_relay_delay) {
 debug_print_str("\r\nUMIN4 DELAYEV WHYST");
 Umin4_relay_event= 2 ;
 set_Umin4_OUTPUT( 0 );
 }
 }


 if ((Umin_relay_event== 0 ) && GBUminBlock) {
 if (timeticks>Umin_relay_delay) {
 debug_print_str("\r\nUMINDELAYEV");
 set_Umin_OUTPUT( 0 );
 Umin_relay_event=0xFF;
 GBUminBlock=0;
 memcpy(&CHN_voltageMINEvent,&CHN_voltageMINEventTemp,16);
 save_eeprom_event();


 }

 }
 if ((Umin_ltrelay_event== 0 ) && GBUminBlockLR) {
 if (timeticks>Umin_ltrelay_delay) {
 set_Umin_LT_OUTPUT( 0 );
 Umin_ltrelay_event=0xFF;
 GBUminBlockLR=0;



 }
 }


 if (Umax4_relay_event== 0 ) {
 if (timeticks>Umax4_relay_delay) {
 debug_print_str("\r\nUMAX4 DELAYEV WHYST!");
 Umax4_relay_event= 2 ;;
 set_Umax4_OUTPUT( 0 );
 }
 }



 if ((Umax_relay_event== 0 ) && GBUmaxBlock) {
 if (timeticks>Umax_relay_delay) {
 set_Umax_OUTPUT( 0 );
 Umax_relay_event=0xFF;
 GBUmaxBlock=0;
 memcpy(&CHN_voltageMAXEvent,&CHN_voltageMAXEventTemp,16);
 save_eeprom_event();

 }
 }
 if ((Umax_ltrelay_event== 0 )&& GBUmaxBlockLR) {
 if (timeticks>Umax_ltrelay_delay) {
 set_Umax_LT_OUTPUT( 0 );
 Umax_ltrelay_event=0xFF;
 GBUmaxBlockLR=0;


 }
 }




 if (Uhav_ltrelay_event== 0 ) {

 if (timeticks>Uhav_ltrelay_delay) {
 debug_print_str("\r\nUHAVDELAYEV");
 set_Uhav_OUTPUT( 0 );
 Uhav_ltrelay_event=0xFF;
 if (GBUhavUminident==1) {
 DLDISCflag=1;
 discontime= 50  + timeticks;
 debug_print_str("\r\nVYPINAME UMINHAV!");
 }

 save_eeprom_event();


 }
 else {
 if ((GBUminBlock==0) && (!DLDISCflag)) {
 debug_print_str("\r\nVYPINAMEUMINHAVPOUMIN");
 DLDISCflag=1;
 discontime=10 + timeticks;
 }
 if ((GBUmaxBlock==0) && ((GBUhavBlock==1))) {
 set_Uhav_OUTPUT( 0 );
 GBUhavBlock=0;
 debug_print_str("\r\nSETUJEME UMAXHAV!");
 }

 }
 }


}


void CPMOUTPUTGETREG()
{
 if (CPMREGDATA[ 23 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 1 );
 }
 else if (CPMREGDATA[ 23 ]== 0xA115 ) {

 onswitchoutputspinfromI2C( 1 );

 }
 else if (CPMREGDATA[ 23 ]== 0xA005 ) {

 offswitchoutputspinfromI2C( 1 );

 }


 if (CPMREGDATA[ 24 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 2 );
 }
 else if (CPMREGDATA[ 24 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 2 );
 }
 else if (CPMREGDATA[ 24 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 2 );
 }


 if (CPMREGDATA[ 25 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 3 );
 }
 else if (CPMREGDATA[ 25 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 3 );
 }
 else if (CPMREGDATA[ 25 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 3 );
 }

 if (CPMREGDATA[ 26 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 4 );
 }
 else if (CPMREGDATA[ 26 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 4 );
 }
 else if (CPMREGDATA[ 26 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 4 );
 }

 if (CPMREGDATA[ 27 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 5 );
 }
 else if (CPMREGDATA[ 27 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 5 );
 }
 else if (CPMREGDATA[ 27 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 5 );
 }

 if (CPMREGDATA[ 28 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 6 );
 }
 else if (CPMREGDATA[ 28 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 6 );
 }
 else if (CPMREGDATA[ 28 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 6 );
 }

 if (CPMREGDATA[ 29 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 7 );
 }
 else if (CPMREGDATA[ 29 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 7 );
 }
 else if (CPMREGDATA[ 29 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 7 );
 }

 if (CPMREGDATA[ 30 ]== 0xA5A5 ) {
 reswitchoutputspinfromI2C( 8 );
 }
 if (CPMREGDATA[ 30 ]== 0xA115 ) {
 onswitchoutputspinfromI2C( 8 );
 }
 if (CPMREGDATA[ 30 ]== 0xA005 ) {
 offswitchoutputspinfromI2C( 8 );
 }


 CPMREGDATA[ 23 ]=PIN_UMIN12;
 CPMREGDATA[ 24 ]=PIN_UMIN3;
 CPMREGDATA[ 25 ]=PIN_UMIN4;
 CPMREGDATA[ 26 ]=PIN_UMAX12;
 CPMREGDATA[ 27 ]=PIN_UMAX3;
 CPMREGDATA[ 28 ]=PIN_UMAX4;
 CPMREGDATA[ 29 ]=PIN_EMERG12;
 CPMREGDATA[ 30 ]=PIN_EMERG3;

}


 unsigned long  suma,testtime=0,testbuttontime=0;
 unsigned int  result;

void main() {

 unsigned char  i,j;
 unsigned int  volt=0;




 TRISF4_bit = 0 ;
 LATF.F4 =0;

PORTA=0;
PORTB=0;
PORTC=0;
PORTD=0;
PORTE=0;
PORTF=0;
PORTG=0;
PORTH=0;
init_adc();
multiplex_init();

delay_ms(200);


PIN_UMIN12=0xFF;
PIN_UMIN3=0xFF;
PIN_UMIN4=0xFF;
PIN_UMAX12=0xFF;
PIN_UMAX3=0xFF;
PIN_UMAX4=0xFF;
PIN_EMERG12=0xFF;
PIN_EMERG3=0xFF;

startflag=1;

memset(&CELL_connect,0,16);

DISCONNECTFLAG=0;
MISSEDBUTTONFLAG=0;

UMIN_WR=0;
UMAX_WR=0;
MISSEDINTERCELLFLAG=0;
MAXMINFLAG=0;
Missed_cell_TEST=0;
Missed_cell_ID=0;
Umin_relay_event=0xFF;
Umax_relay_event=0xFF;


Umin4_relay_event=0xFF;
Umax4_relay_event=0xFF;


Umin_ltrelay_event=0xFF;
Umax_ltrelay_event=0xFF;
Uhav_ltrelay_event=0xFF;
GBUminBlockLR=1;
GBUminBlock=1;
GBUmaxBlockLR=1;
GBUmaxBlock=1;
GBUhavBlock=1;


for (i=0; i<16; i++) {
 CHN_voltageMINEvent[i]=0x00;
 CHN_voltageMAXEvent[i]=0x00;
}


init_outputstatus();
 ZCDCON=0;
OSCCON1=0x10;


testtime=timeticks+50L;
testbuttontime=timeticks+20;





init_LED();
start_timer();
DACs_init();


LEDOFFflag=0;
LEDtime=timeticks+ 10 ;

 TRISC2_bit=1 ;
 TRISB5_bit=1 ;

debug_init();




TRISC4_bit=1;
TRISC3_bit=1;
WPUC.WPUC3=1;

debug_print_str("\r\nSTARTTI123456789");
INLVLC.INLVLC4=1;
INLVLC.INLVLC4=1;

I2C1_Initialize();
memset(&CPMREGDATA,0xFF, 37 *2);





eeprom_event_i2c_register_initialize();



memcpy(&TEMPCPMREGDATA,&CPMREGDATA, 37 *2);



debug_print_str("\r\nCTRL1");


 TRISF4_bit = 0 ;
 LATF.F4 =1;

delay_ms(200);


for (i=0; i<5; i++) {
 adc_getval( 0x28 );
 adc_getval( 0x37 );
 adc_getval( 0x29 );
 delay_ms(200);
}


 TRISF4_bit = 0 ;
 LATF.F4 =1;
 i=1;
 Umin_button();
 Umax_button();

 Uhav_ltrelay_delay=timeticks+ 300 ;
 while (1)
 {








 triginiput1();
 triginiput2();

 if (cellconnectflag==1) {
 start_LED();
 EVENT_LED();

 cellconnectflag=2;
 }
 else if (cellconnectflag==2) {
 if (timeticks> 10 ) {
 if (TOFFFLAG==1) {
 for (i=0; i<16; i+=2) {
 if (CELL_connect[i]) LED_stat[i]= 2 ;
 if (CELL_connect[i+1]) LED_stat[i+1]= 1 ;


 }
 LED_poll();


 }
 else {


 if (timeticks>LEDtime) {

 if (LEDOFFflag) {
 if (LEDSTATFLAG==1) {
 LEDSTATFLAG=0;

 memcpy(&LED_stat,&temp_LED_stat,16);


 LED_stat[GBmaxid]= 0 ;
 LED_stat[GBminid]= 0 ;



 for (i=0; i<16; i++) {
 if (GBUminBlock==0) {
 if (GBminid!=i)
 if (CHN_voltageMINEvent[i]==1) LED_stat[i]= 1 ;
 }
 if (GBUmaxBlock==0) {
 if (GBmaxid!=i)
 if (CHN_voltageMAXEvent[i]==1) LED_stat[i]= 2 ;
 }
 }

 }
 LEDtime=timeticks+ 50 ;
 }
 else {
 LEDtime=timeticks+ 10 ;
 memcpy(&LED_stat,&temp_LED_stat,16);
 if (LEDSTATFLAG==1) {
 LEDSTATFLAG=0;
 for (i=0; i<16; i++) {
 if (GBUminBlock==0) {
 if (CHN_voltageMINEvent[i]==1) LED_stat[i]= 0 ;
 }
 if (GBUmaxBlock==0) {
 if (CHN_voltageMAXEvent[i]==1) LED_stat[i]= 0 ;
 }
 }

 LED_stat[GBmaxid]= 2 ;
 LED_stat[GBminid]= 1 ;




 }

 }

 LEDOFFflag=!LEDOFFflag;
 }

 LED_poll();

 }
 }
 }

 push_poll();

 TRISC4_bit=1;
 TRISC3_bit=1;


 WPUC.WPUC3=1;

 if (timeticks>testbuttontime) {

 Umin_button();
 Umax_button();







 if (UMIN_WR) {
 WEBPOTMINtimeout=timeticks+600;
 UMIN_WR=0;
 }
 if (CPMREGDATA[ 21 ]!=0xFFFF) {
 if (timeticks>WEBPOTMINtimeout) {
 CPMREGDATA[ 21 ]=0xFFFF;
 }
 }
 if (UMAX_WR) {
 WEBPOTMAXtimeout=timeticks+600;
 UMAX_WR=0;

 }
 if ( CPMREGDATA[ 22 ]!=0xFFFF) {
 if (timeticks>WEBPOTMAXtimeout) {
 CPMREGDATA[ 22 ]=0xFFFF;
 }
 }


 if( CPMREGDATA[ 21 ]==0xFFFF) TGB_Umin=GB_Umin;
 else {
 TGB_Umin=GB_Umin;
 GB_Umin=CPMREGDATA[ 21 ];
 GB_Uhavmin=GB_Umin- 300 ;
 debug_print_strROM("\r\nREMOTEPOMIN!:");
 debug_print_hex_u16( GB_Umin);
 debug_print_hex_u16( GB_Uhavmin);

 }
 if( CPMREGDATA[ 22 ]==0xFFFF) TGB_Umax=GB_Umax;
 else {
 TGB_Umax=GB_Umax;
 GB_Umax=CPMREGDATA[ 22 ];
 GB_Uhavmax=GB_Umax+ 300 ;

 }


 CPMREGDATA[ 19 ]=TGB_Umin;
 CPMREGDATA[ 20 ]=TGB_Umax;

 if (CPMREGDATA[ 32 ]==0x0001) {
 debug_print_strROM("\r\nVYPINAME I2c!");


 set_Uhav_OUTPUT( 0 );
 set_Umin_LT_OUTPUT( 0 );
 set_Umax_LT_OUTPUT( 0 );
  LATF.F4 =0;
 delay_ms(2000);
  TRISF4_bit = 1 ;
 }
 if (CPMREGDATA[ 31 ]==0x0001) {
 init_outputstatus();
 CPMREGDATA[ 31 ]=0;
 debug_print_strROM("\r\nRESETUJEME I2c!");
 events_reset();
 }

 CPMOUTPUTGETREG();
 if (UhavOKstatus== 0 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]&~0x8000;}
 else if (UhavOKstatus== 1 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]|0x8000;}
 if (UminOKstatus== 0 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]&~0x4000;}
 else if (UminOKstatus== 1 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]|0x4000;}
 if (UmaxOKstatus== 0 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]&~0x2000;}
 else if (UmaxOKstatus== 1 ) {CPMREGDATA[ 18 ]=CPMREGDATA[ 18 ]|0x2000;}

 if (GB_Umin>=GB_Umax) MAXMINFLAG=1;
 else MAXMINFLAG=0;


 testbuttontime=timeticks+5;

 DAC_poll();
 OUTPUT_poll();


 DELAY_poll();





 }
 if (!startupflag) {
 if (timeticks> 100 ) {
 startupflag=1;

 }

 }
 if ((DLDISCflag==1) || (TOFFFLAG==1) || (DISCONNECTFLAG==1) || (MISSEDINTERCELLFLAG==1) || (MAXMINFLAG==1)) {

 if (timeticks>Discontime) {
 debug_print_str("\r\nVHAV:");
 debug_print_hex_u8(MAXMINFLAG);
 debug_print_hex_u8(DLDISCflag);
 debug_print_hex_u8(DISCflag);
 debug_print_hex_u8(TOFFFLAG);
 debug_print_hex_u8(DISCONNECTFLAG);
 debug_print_hex_u8(MISSEDINTERCELLFLAG);

 set_Uhav_OUTPUT( 0 );

 set_Umin_LT_OUTPUT( 0 );
 set_Umax_LT_OUTPUT( 0 );



 debug_print_str("\r\nUHAVFAIL");
 delay_ms(100);


  LATF.F4 =0;
 delay_ms(2000);
  TRISF4_bit = 1 ;

 }
 }


 if (timeticks>testtime) {


 if ((CELL_connect[0]==0) || (CELL_connect[1]==0) ||
 (CELL_connect[2]==0) || (CELL_connect[3]==0)) {
 MISSEDINTERCELLFLAG=1;
 debug_print_str("\r\nMISSEDBUTTONCELLFLAG1!:");
 debug_print_hex_u8(CELL_connect[0]);
 debug_print_hex_u8(CELL_connect[1]);
 debug_print_hex_u8(CELL_connect[2]);
 debug_print_hex_u8(CELL_connect[3]);
 }

 if (MISSEDBUTTONFLAG==1) {
 debug_print_str("\r\nMISSEDBUTTONCELLFLAG2!");
 MISSEDINTERCELLFLAG=1;
 }


 debug_print_str("\r\n\r\nVMIN:");
 debug_print_udec(GB_Umin);
 debug_print_str("   VMAX:");
 debug_print_udec(GB_Umax);
 debug_print_str("   REALMIN:");
 debug_print_udec(testUmin);
 debug_print_str("   REALMAX:");
 debug_print_udec(testUmax);


 debug_print_str(" UMAXID:");
 debug_print_hex_u8(Umax_button());
 debug_print_str(" UMINID:");
 debug_print_hex_u8(Umin_button());

 debug_print_str("   UHAVMIN:");
 debug_print_udec(GB_Uhavmin);

 debug_print_str("   UHAVMAX:");
 debug_print_udec(GB_Uhavmax);

 debug_print_str("  NCEL:");
 debug_print_hex_u8(Missed_cell_ID);
 debug_print_str("  BCA:");

 for (i=0; i<16; i++){
 debug_print_hex_u8(CELL_connect[i]);

}
 for (i=0; i<16; i++){
 debug_print_str("  VCHN:");
 debug_print_hex_u8(i);
 debug_print_str("=");
 debug_print_udec(CHN_voltage[i]);




 }

 debug_print_str("\r\nCUMAXWAIT:");
 debug_print_hex_u8(CONDUMAXWAIT);
 debug_print_str(" CUMAXNOW:");
 debug_print_hex_u8(CONDUMAXNOW);
 debug_print_str(" CUMINWAIT:");
 debug_print_hex_u8(CONDUMINWAIT);
 debug_print_str(" CUNDERMIN:");
 debug_print_hex_u8(CELLUNDERMIN);
 debug_print_str(" CABOVMAX:");
 debug_print_hex_u8(CELLABOVEMAX);





 testtime=timeticks+50L;


 }
 TEST_CELL_poll();


 }

}
