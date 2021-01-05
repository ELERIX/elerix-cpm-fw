
_set_Umin4_OUTPUT:

;GWL_batscan.c,441 :: 		void set_Umin4_OUTPUT(u8_t status)
;GWL_batscan.c,443 :: 		if (status==CELLUMINOK) {
	MOVF       FARG_set_Umin4_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umin4_OUTPUT0
;GWL_batscan.c,444 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,445 :: 		UminP4=1;
	BSF        LATG+0, 0
;GWL_batscan.c,447 :: 		PIN_UMIN4=1;
	MOVLW      1
	MOVWF      _PIN_UMIN4+0
;GWL_batscan.c,449 :: 		}
	GOTO       L_set_Umin4_OUTPUT1
L_set_Umin4_OUTPUT0:
;GWL_batscan.c,451 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,452 :: 		UminP4=0;
	BCF        LATG+0, 0
;GWL_batscan.c,454 :: 		PIN_UMIN4=0;
	CLRF       _PIN_UMIN4+0
;GWL_batscan.c,456 :: 		}
L_set_Umin4_OUTPUT1:
;GWL_batscan.c,457 :: 		}
L_end_set_Umin4_OUTPUT:
	RETURN
; end of _set_Umin4_OUTPUT

_set_Umax4_OUTPUT:

;GWL_batscan.c,458 :: 		void set_Umax4_OUTPUT(u8_t status)
;GWL_batscan.c,460 :: 		if (status==CELLUMINOK) {
	MOVF       FARG_set_Umax4_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umax4_OUTPUT2
;GWL_batscan.c,461 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,462 :: 		UmaxP4=1;
	BSF        LATG+0, 4
;GWL_batscan.c,464 :: 		PIN_UMAX4=1;
	MOVLW      1
	MOVWF      _PIN_UMAX4+0
;GWL_batscan.c,466 :: 		}
	GOTO       L_set_Umax4_OUTPUT3
L_set_Umax4_OUTPUT2:
;GWL_batscan.c,468 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,469 :: 		UmaxP4=0;
	BCF        LATG+0, 4
;GWL_batscan.c,472 :: 		PIN_UMAX4=0;
	CLRF       _PIN_UMAX4+0
;GWL_batscan.c,473 :: 		}
L_set_Umax4_OUTPUT3:
;GWL_batscan.c,474 :: 		}
L_end_set_Umax4_OUTPUT:
	RETURN
; end of _set_Umax4_OUTPUT

_set_Umin_OUTPUT:

;GWL_batscan.c,477 :: 		void set_Umin_OUTPUT(u8_t status)
;GWL_batscan.c,479 :: 		if (status==CELLUMINOK) {
	MOVF       FARG_set_Umin_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umin_OUTPUT4
;GWL_batscan.c,480 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,481 :: 		UminP3=1;
	BSF        LATG+0, 1
;GWL_batscan.c,482 :: 		PIN_UMIN3=1;
	MOVLW      1
	MOVWF      _PIN_UMIN3+0
;GWL_batscan.c,484 :: 		}
	GOTO       L_set_Umin_OUTPUT5
L_set_Umin_OUTPUT4:
;GWL_batscan.c,487 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,488 :: 		UminP3=0;
	BCF        LATG+0, 1
;GWL_batscan.c,489 :: 		PIN_UMIN3=0;
	CLRF       _PIN_UMIN3+0
;GWL_batscan.c,490 :: 		}
L_set_Umin_OUTPUT5:
;GWL_batscan.c,491 :: 		}
L_end_set_Umin_OUTPUT:
	RETURN
; end of _set_Umin_OUTPUT

_set_Umin_LT_OUTPUT:

;GWL_batscan.c,493 :: 		void set_Umin_LT_OUTPUT(u8_t status)
;GWL_batscan.c,495 :: 		if (status==CELLUMINOK) {
	MOVF       FARG_set_Umin_LT_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umin_LT_OUTPUT6
;GWL_batscan.c,497 :: 		UminP1_OUT();
	BCF        TRISG3_bit+0, BitPos(TRISG3_bit+0)
;GWL_batscan.c,498 :: 		UminP1=1;
	BSF        LATG+0, 3
;GWL_batscan.c,499 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Umin_LT_OUTPUT7:
	DECFSZ     R13, 1
	GOTO       L_set_Umin_LT_OUTPUT7
	DECFSZ     R12, 1
	GOTO       L_set_Umin_LT_OUTPUT7
	DECFSZ     R11, 1
	GOTO       L_set_Umin_LT_OUTPUT7
	NOP
;GWL_batscan.c,500 :: 		UminP1=0;
	BCF        LATG+0, 3
;GWL_batscan.c,501 :: 		UminP1_IN();
	BSF        TRISG3_bit+0, BitPos(TRISG3_bit+0)
;GWL_batscan.c,502 :: 		PIN_UMIN12=1;
	MOVLW      1
	MOVWF      _PIN_UMIN12+0
;GWL_batscan.c,504 :: 		}
	GOTO       L_set_Umin_LT_OUTPUT8
L_set_Umin_LT_OUTPUT6:
;GWL_batscan.c,506 :: 		UminP2_OUT();
	BCF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,507 :: 		UminP2=1;
	BSF        LATG+0, 2
;GWL_batscan.c,508 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Umin_LT_OUTPUT9:
	DECFSZ     R13, 1
	GOTO       L_set_Umin_LT_OUTPUT9
	DECFSZ     R12, 1
	GOTO       L_set_Umin_LT_OUTPUT9
	DECFSZ     R11, 1
	GOTO       L_set_Umin_LT_OUTPUT9
	NOP
;GWL_batscan.c,509 :: 		UminP2=0;
	BCF        LATG+0, 2
;GWL_batscan.c,510 :: 		UminP2_IN();
	BSF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,511 :: 		PIN_UMIN12=0;
	CLRF       _PIN_UMIN12+0
;GWL_batscan.c,512 :: 		}
L_set_Umin_LT_OUTPUT8:
;GWL_batscan.c,513 :: 		}
L_end_set_Umin_LT_OUTPUT:
	RETURN
; end of _set_Umin_LT_OUTPUT

_reswitchoutputspinfromI2C:

;GWL_batscan.c,524 :: 		void reswitchoutputspinfromI2C(u8_t iopin)
;GWL_batscan.c,527 :: 		if (iopin==PINUMIN12) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C10
;GWL_batscan.c,528 :: 		if (PIN_UMIN12) {
	MOVF       _PIN_UMIN12+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C11
;GWL_batscan.c,529 :: 		UminP2_OUT();
	BCF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,530 :: 		UminP2=1;
	BSF        LATG+0, 2
;GWL_batscan.c,531 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C12:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C12
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C12
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C12
	NOP
;GWL_batscan.c,532 :: 		UminP2=0;
	BCF        LATG+0, 2
;GWL_batscan.c,533 :: 		UminP2_IN();
	BSF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,534 :: 		}
	GOTO       L_reswitchoutputspinfromI2C13
L_reswitchoutputspinfromI2C11:
;GWL_batscan.c,536 :: 		UminP1_OUT();
	BCF        TRISG3_bit+0, BitPos(TRISG3_bit+0)
;GWL_batscan.c,537 :: 		UminP1=1;
	BSF        LATG+0, 3
;GWL_batscan.c,538 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C14:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C14
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C14
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C14
	NOP
;GWL_batscan.c,539 :: 		UminP1=0;
	BCF        LATG+0, 3
;GWL_batscan.c,540 :: 		UminP1_IN();
	BSF        TRISG3_bit+0, BitPos(TRISG3_bit+0)
;GWL_batscan.c,541 :: 		}
L_reswitchoutputspinfromI2C13:
;GWL_batscan.c,542 :: 		PIN_UMIN12=!PIN_UMIN12;
	MOVF       _PIN_UMIN12+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMIN12+0
;GWL_batscan.c,543 :: 		}
L_reswitchoutputspinfromI2C10:
;GWL_batscan.c,545 :: 		if (iopin==PINUMIN3) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C15
;GWL_batscan.c,546 :: 		if (PIN_UMIN3) {
	MOVF       _PIN_UMIN3+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C16
;GWL_batscan.c,547 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,548 :: 		UminP3=0;
	BCF        LATG+0, 1
;GWL_batscan.c,549 :: 		} else {
	GOTO       L_reswitchoutputspinfromI2C17
L_reswitchoutputspinfromI2C16:
;GWL_batscan.c,550 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,551 :: 		UminP3=1;
	BSF        LATG+0, 1
;GWL_batscan.c,552 :: 		}
L_reswitchoutputspinfromI2C17:
;GWL_batscan.c,553 :: 		PIN_UMIN3=!PIN_UMIN3;
	MOVF       _PIN_UMIN3+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMIN3+0
;GWL_batscan.c,554 :: 		}
L_reswitchoutputspinfromI2C15:
;GWL_batscan.c,558 :: 		if (iopin==PINUMIN4) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C18
;GWL_batscan.c,559 :: 		if (PIN_UMIN4) {
	MOVF       _PIN_UMIN4+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C19
;GWL_batscan.c,560 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,561 :: 		UminP4=0;
	BCF        LATG+0, 0
;GWL_batscan.c,562 :: 		} else {
	GOTO       L_reswitchoutputspinfromI2C20
L_reswitchoutputspinfromI2C19:
;GWL_batscan.c,563 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,564 :: 		UminP4=1;
	BSF        LATG+0, 0
;GWL_batscan.c,565 :: 		}
L_reswitchoutputspinfromI2C20:
;GWL_batscan.c,566 :: 		PIN_UMIN4=!PIN_UMIN4;
	MOVF       _PIN_UMIN4+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMIN4+0
;GWL_batscan.c,567 :: 		}
L_reswitchoutputspinfromI2C18:
;GWL_batscan.c,570 :: 		if (iopin==PINUMAX12) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C21
;GWL_batscan.c,571 :: 		if (PIN_UMAX12) {
	MOVF       _PIN_UMAX12+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C22
;GWL_batscan.c,572 :: 		UmaxP2_OUT();
	BCF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,573 :: 		UmaxP2=1;
	BSF        LATF+0, 6
;GWL_batscan.c,574 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C23:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C23
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C23
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C23
	NOP
;GWL_batscan.c,575 :: 		UmaxP2=0;
	BCF        LATF+0, 6
;GWL_batscan.c,576 :: 		UmaxP2_IN();
	BSF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,577 :: 		}
	GOTO       L_reswitchoutputspinfromI2C24
L_reswitchoutputspinfromI2C22:
;GWL_batscan.c,579 :: 		UmaxP1_OUT();
	BCF        TRISF5_bit+0, BitPos(TRISF5_bit+0)
;GWL_batscan.c,580 :: 		UmaxP1=1;
	BSF        LATF+0, 5
;GWL_batscan.c,581 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C25:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C25
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C25
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C25
	NOP
;GWL_batscan.c,582 :: 		UmaxP1=0;
	BCF        LATF+0, 5
;GWL_batscan.c,583 :: 		UmaxP1_IN();
	BSF        TRISF5_bit+0, BitPos(TRISF5_bit+0)
;GWL_batscan.c,584 :: 		}
L_reswitchoutputspinfromI2C24:
;GWL_batscan.c,585 :: 		PIN_UMAX12=!PIN_UMAX12;
	MOVF       _PIN_UMAX12+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMAX12+0
;GWL_batscan.c,586 :: 		}
L_reswitchoutputspinfromI2C21:
;GWL_batscan.c,587 :: 		if (iopin==PINUMAX3) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C26
;GWL_batscan.c,588 :: 		if (PIN_UMAX3) {
	MOVF       _PIN_UMAX3+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C27
;GWL_batscan.c,589 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,590 :: 		UmaxP3=0;
	BCF        LATF+0, 7
;GWL_batscan.c,591 :: 		} else {
	GOTO       L_reswitchoutputspinfromI2C28
L_reswitchoutputspinfromI2C27:
;GWL_batscan.c,592 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,593 :: 		UmaxP3=1;
	BSF        LATF+0, 7
;GWL_batscan.c,594 :: 		}
L_reswitchoutputspinfromI2C28:
;GWL_batscan.c,595 :: 		PIN_UMAX3=!PIN_UMAX3;
	MOVF       _PIN_UMAX3+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMAX3+0
;GWL_batscan.c,596 :: 		}
L_reswitchoutputspinfromI2C26:
;GWL_batscan.c,598 :: 		if (iopin==PINUMAX4) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C29
;GWL_batscan.c,599 :: 		if (PIN_UMAX4) {
	MOVF       _PIN_UMAX4+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C30
;GWL_batscan.c,600 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,601 :: 		UmaxP4=0;
	BCF        LATG+0, 4
;GWL_batscan.c,602 :: 		} else {
	GOTO       L_reswitchoutputspinfromI2C31
L_reswitchoutputspinfromI2C30:
;GWL_batscan.c,603 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,604 :: 		UmaxP4=1;
	BSF        LATG+0, 4
;GWL_batscan.c,605 :: 		}
L_reswitchoutputspinfromI2C31:
;GWL_batscan.c,606 :: 		PIN_UMAX4=!PIN_UMAX4;
	MOVF       _PIN_UMAX4+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_UMAX4+0
;GWL_batscan.c,607 :: 		}
L_reswitchoutputspinfromI2C29:
;GWL_batscan.c,609 :: 		if (iopin==PINEMER12) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C32
;GWL_batscan.c,610 :: 		if (PIN_EMERG12) {
	MOVF       _PIN_EMERG12+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C33
;GWL_batscan.c,611 :: 		UhavP2_OUT();
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,612 :: 		UhavP2=1;
	BSF        LATB+0, 3
;GWL_batscan.c,613 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C34:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C34
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C34
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C34
	NOP
;GWL_batscan.c,614 :: 		UhavP2=0;
	BCF        LATB+0, 3
;GWL_batscan.c,615 :: 		UhavP2_IN();
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,616 :: 		}
	GOTO       L_reswitchoutputspinfromI2C35
L_reswitchoutputspinfromI2C33:
;GWL_batscan.c,618 :: 		UhavP1_OUT();
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;GWL_batscan.c,619 :: 		UhavP1=1;
	BSF        LATB+0, 4
;GWL_batscan.c,620 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_reswitchoutputspinfromI2C36:
	DECFSZ     R13, 1
	GOTO       L_reswitchoutputspinfromI2C36
	DECFSZ     R12, 1
	GOTO       L_reswitchoutputspinfromI2C36
	DECFSZ     R11, 1
	GOTO       L_reswitchoutputspinfromI2C36
	NOP
;GWL_batscan.c,621 :: 		UhavP1=0;
	BCF        LATB+0, 4
;GWL_batscan.c,622 :: 		UhavP1_IN();
	BSF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;GWL_batscan.c,623 :: 		}
L_reswitchoutputspinfromI2C35:
;GWL_batscan.c,624 :: 		PIN_EMERG12=!PIN_EMERG12;
	MOVF       _PIN_EMERG12+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_EMERG12+0
;GWL_batscan.c,625 :: 		}
L_reswitchoutputspinfromI2C32:
;GWL_batscan.c,626 :: 		if (iopin==PINEMER3) {
	MOVF       FARG_reswitchoutputspinfromI2C_iopin+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C37
;GWL_batscan.c,627 :: 		if (PIN_EMERG3) {
	MOVF       _PIN_EMERG3+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_reswitchoutputspinfromI2C38
;GWL_batscan.c,628 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,629 :: 		UhavP3=0;
	BCF        LATB+0, 2
;GWL_batscan.c,630 :: 		} else {
	GOTO       L_reswitchoutputspinfromI2C39
L_reswitchoutputspinfromI2C38:
;GWL_batscan.c,631 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,632 :: 		UhavP3=1;
	BSF        LATB+0, 2
;GWL_batscan.c,633 :: 		}
L_reswitchoutputspinfromI2C39:
;GWL_batscan.c,634 :: 		PIN_EMERG3=!PIN_EMERG3;
	MOVF       _PIN_EMERG3+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _PIN_EMERG3+0
;GWL_batscan.c,635 :: 		}
L_reswitchoutputspinfromI2C37:
;GWL_batscan.c,638 :: 		}
L_end_reswitchoutputspinfromI2C:
	RETURN
; end of _reswitchoutputspinfromI2C

_offswitchoutputspinfromI2C:

;GWL_batscan.c,641 :: 		void offswitchoutputspinfromI2C(u8_t iopin)
;GWL_batscan.c,643 :: 		if (iopin==PINUMIN12) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C40
;GWL_batscan.c,644 :: 		UminP2_OUT();
	BCF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,645 :: 		UminP2=1;
	BSF        LATG+0, 2
;GWL_batscan.c,646 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_offswitchoutputspinfromI2C41:
	DECFSZ     R13, 1
	GOTO       L_offswitchoutputspinfromI2C41
	DECFSZ     R12, 1
	GOTO       L_offswitchoutputspinfromI2C41
	DECFSZ     R11, 1
	GOTO       L_offswitchoutputspinfromI2C41
	NOP
;GWL_batscan.c,647 :: 		UminP2=0;
	BCF        LATG+0, 2
;GWL_batscan.c,648 :: 		UminP2_IN();
	BSF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,650 :: 		PIN_UMIN12=0;
	CLRF       _PIN_UMIN12+0
;GWL_batscan.c,651 :: 		}
L_offswitchoutputspinfromI2C40:
;GWL_batscan.c,652 :: 		if (iopin==PINUMIN3) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C42
;GWL_batscan.c,653 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,654 :: 		UminP3=0;
	BCF        LATG+0, 1
;GWL_batscan.c,656 :: 		PIN_UMIN3=0;
	CLRF       _PIN_UMIN3+0
;GWL_batscan.c,657 :: 		}
L_offswitchoutputspinfromI2C42:
;GWL_batscan.c,660 :: 		if (iopin==PINUMIN4) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C43
;GWL_batscan.c,661 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,662 :: 		UminP4=0;
	BCF        LATG+0, 0
;GWL_batscan.c,664 :: 		PIN_UMIN4=0;
	CLRF       _PIN_UMIN4+0
;GWL_batscan.c,665 :: 		}
L_offswitchoutputspinfromI2C43:
;GWL_batscan.c,667 :: 		if (iopin==PINUMAX12) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C44
;GWL_batscan.c,668 :: 		UmaxP2_OUT();
	BCF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,669 :: 		UmaxP2=1;
	BSF        LATF+0, 6
;GWL_batscan.c,670 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_offswitchoutputspinfromI2C45:
	DECFSZ     R13, 1
	GOTO       L_offswitchoutputspinfromI2C45
	DECFSZ     R12, 1
	GOTO       L_offswitchoutputspinfromI2C45
	DECFSZ     R11, 1
	GOTO       L_offswitchoutputspinfromI2C45
	NOP
;GWL_batscan.c,671 :: 		UmaxP2=0;
	BCF        LATF+0, 6
;GWL_batscan.c,672 :: 		UmaxP2_IN();
	BSF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,674 :: 		PIN_UMAX12=0;
	CLRF       _PIN_UMAX12+0
;GWL_batscan.c,675 :: 		}
L_offswitchoutputspinfromI2C44:
;GWL_batscan.c,676 :: 		if (iopin==PINUMAX3) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C46
;GWL_batscan.c,677 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,678 :: 		UmaxP3=0;
	BCF        LATF+0, 7
;GWL_batscan.c,680 :: 		PIN_UMAX3=0;
	CLRF       _PIN_UMAX3+0
;GWL_batscan.c,681 :: 		}
L_offswitchoutputspinfromI2C46:
;GWL_batscan.c,683 :: 		if (iopin==PINUMAX4) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C47
;GWL_batscan.c,684 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,685 :: 		UmaxP4=0;
	BCF        LATG+0, 4
;GWL_batscan.c,687 :: 		PIN_UMAX4=0;
	CLRF       _PIN_UMAX4+0
;GWL_batscan.c,688 :: 		}
L_offswitchoutputspinfromI2C47:
;GWL_batscan.c,690 :: 		if (iopin==PINEMER12) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C48
;GWL_batscan.c,691 :: 		UhavP2_OUT();
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,692 :: 		UhavP2=1;
	BSF        LATB+0, 3
;GWL_batscan.c,693 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_offswitchoutputspinfromI2C49:
	DECFSZ     R13, 1
	GOTO       L_offswitchoutputspinfromI2C49
	DECFSZ     R12, 1
	GOTO       L_offswitchoutputspinfromI2C49
	DECFSZ     R11, 1
	GOTO       L_offswitchoutputspinfromI2C49
	NOP
;GWL_batscan.c,694 :: 		UhavP2=0;
	BCF        LATB+0, 3
;GWL_batscan.c,695 :: 		UhavP2_IN();
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,697 :: 		PIN_EMERG12=0;
	CLRF       _PIN_EMERG12+0
;GWL_batscan.c,698 :: 		}
L_offswitchoutputspinfromI2C48:
;GWL_batscan.c,699 :: 		if (iopin==PINEMER3) {
	MOVF       FARG_offswitchoutputspinfromI2C_iopin+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_offswitchoutputspinfromI2C50
;GWL_batscan.c,700 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,701 :: 		UhavP3=0;
	BCF        LATB+0, 2
;GWL_batscan.c,703 :: 		PIN_EMERG3=0;
	CLRF       _PIN_EMERG3+0
;GWL_batscan.c,704 :: 		}
L_offswitchoutputspinfromI2C50:
;GWL_batscan.c,707 :: 		}
L_end_offswitchoutputspinfromI2C:
	RETURN
; end of _offswitchoutputspinfromI2C

_onswitchoutputspinfromI2C:

;GWL_batscan.c,708 :: 		void onswitchoutputspinfromI2C(u8_t iopin)
;GWL_batscan.c,711 :: 		if (iopin==PINUMIN12) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C51
;GWL_batscan.c,712 :: 		UminP2_OUT();
	BCF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,713 :: 		UminP2=0;
	BCF        LATG+0, 2
;GWL_batscan.c,714 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_onswitchoutputspinfromI2C52:
	DECFSZ     R13, 1
	GOTO       L_onswitchoutputspinfromI2C52
	DECFSZ     R12, 1
	GOTO       L_onswitchoutputspinfromI2C52
	DECFSZ     R11, 1
	GOTO       L_onswitchoutputspinfromI2C52
	NOP
;GWL_batscan.c,715 :: 		UminP2=1;
	BSF        LATG+0, 2
;GWL_batscan.c,716 :: 		UminP2_IN();
	BSF        TRISG2_bit+0, BitPos(TRISG2_bit+0)
;GWL_batscan.c,718 :: 		PIN_UMIN12=1;
	MOVLW      1
	MOVWF      _PIN_UMIN12+0
;GWL_batscan.c,719 :: 		}
L_onswitchoutputspinfromI2C51:
;GWL_batscan.c,720 :: 		if (iopin==PINUMIN3) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C53
;GWL_batscan.c,721 :: 		UminP3_OUT();
	BCF        TRISG1_bit+0, BitPos(TRISG1_bit+0)
;GWL_batscan.c,722 :: 		UminP3=1;
	BSF        LATG+0, 1
;GWL_batscan.c,724 :: 		PIN_UMIN3=1;
	MOVLW      1
	MOVWF      _PIN_UMIN3+0
;GWL_batscan.c,725 :: 		}
L_onswitchoutputspinfromI2C53:
;GWL_batscan.c,728 :: 		if (iopin==PINUMIN4) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C54
;GWL_batscan.c,729 :: 		UminP4_OUT();
	BCF        TRISG0_bit+0, BitPos(TRISG0_bit+0)
;GWL_batscan.c,730 :: 		UminP4=1;
	BSF        LATG+0, 0
;GWL_batscan.c,732 :: 		PIN_UMIN4=1;
	MOVLW      1
	MOVWF      _PIN_UMIN4+0
;GWL_batscan.c,733 :: 		}
L_onswitchoutputspinfromI2C54:
;GWL_batscan.c,735 :: 		if (iopin==PINUMAX12) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C55
;GWL_batscan.c,736 :: 		UmaxP2_OUT();
	BCF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,737 :: 		UmaxP2=0;
	BCF        LATF+0, 6
;GWL_batscan.c,738 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_onswitchoutputspinfromI2C56:
	DECFSZ     R13, 1
	GOTO       L_onswitchoutputspinfromI2C56
	DECFSZ     R12, 1
	GOTO       L_onswitchoutputspinfromI2C56
	DECFSZ     R11, 1
	GOTO       L_onswitchoutputspinfromI2C56
	NOP
;GWL_batscan.c,739 :: 		UmaxP2=1;
	BSF        LATF+0, 6
;GWL_batscan.c,740 :: 		UmaxP2_IN();
	BSF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,742 :: 		PIN_UMAX12=1;
	MOVLW      1
	MOVWF      _PIN_UMAX12+0
;GWL_batscan.c,743 :: 		}
L_onswitchoutputspinfromI2C55:
;GWL_batscan.c,744 :: 		if (iopin==PINUMAX3) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C57
;GWL_batscan.c,745 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,746 :: 		UmaxP3=1;
	BSF        LATF+0, 7
;GWL_batscan.c,748 :: 		PIN_UMAX3=1;
	MOVLW      1
	MOVWF      _PIN_UMAX3+0
;GWL_batscan.c,749 :: 		}
L_onswitchoutputspinfromI2C57:
;GWL_batscan.c,751 :: 		if (iopin==PINUMAX4) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C58
;GWL_batscan.c,752 :: 		UmaxP4_OUT();
	BCF        TRISG4_bit+0, BitPos(TRISG4_bit+0)
;GWL_batscan.c,753 :: 		UmaxP4=1;
	BSF        LATG+0, 4
;GWL_batscan.c,755 :: 		PIN_UMAX4=1;
	MOVLW      1
	MOVWF      _PIN_UMAX4+0
;GWL_batscan.c,756 :: 		}
L_onswitchoutputspinfromI2C58:
;GWL_batscan.c,758 :: 		if (iopin==PINEMER12) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C59
;GWL_batscan.c,759 :: 		UhavP2_OUT();
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,760 :: 		UhavP2=0;
	BCF        LATB+0, 3
;GWL_batscan.c,761 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_onswitchoutputspinfromI2C60:
	DECFSZ     R13, 1
	GOTO       L_onswitchoutputspinfromI2C60
	DECFSZ     R12, 1
	GOTO       L_onswitchoutputspinfromI2C60
	DECFSZ     R11, 1
	GOTO       L_onswitchoutputspinfromI2C60
	NOP
;GWL_batscan.c,762 :: 		UhavP2=1;
	BSF        LATB+0, 3
;GWL_batscan.c,763 :: 		UhavP2_IN();
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,765 :: 		PIN_EMERG12=1;
	MOVLW      1
	MOVWF      _PIN_EMERG12+0
;GWL_batscan.c,766 :: 		}
L_onswitchoutputspinfromI2C59:
;GWL_batscan.c,767 :: 		if (iopin==PINEMER3) {
	MOVF       FARG_onswitchoutputspinfromI2C_iopin+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_onswitchoutputspinfromI2C61
;GWL_batscan.c,768 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,769 :: 		UhavP3=1;
	BSF        LATB+0, 2
;GWL_batscan.c,771 :: 		PIN_EMERG3=1;
	MOVLW      1
	MOVWF      _PIN_EMERG3+0
;GWL_batscan.c,772 :: 		}
L_onswitchoutputspinfromI2C61:
;GWL_batscan.c,775 :: 		}
L_end_onswitchoutputspinfromI2C:
	RETURN
; end of _onswitchoutputspinfromI2C

_set_Umax_OUTPUT:

;GWL_batscan.c,777 :: 		void set_Umax_OUTPUT(u8_t status)
;GWL_batscan.c,779 :: 		if (status==CELLUMAXOK) {
	MOVF       FARG_set_Umax_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umax_OUTPUT62
;GWL_batscan.c,780 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,781 :: 		UmaxP3=1;
	BSF        LATF+0, 7
;GWL_batscan.c,782 :: 		PIN_UMAX3=1;
	MOVLW      1
	MOVWF      _PIN_UMAX3+0
;GWL_batscan.c,784 :: 		}
	GOTO       L_set_Umax_OUTPUT63
L_set_Umax_OUTPUT62:
;GWL_batscan.c,786 :: 		UmaxP3_OUT();
	BCF        TRISF7_bit+0, BitPos(TRISF7_bit+0)
;GWL_batscan.c,787 :: 		UmaxP3=0;
	BCF        LATF+0, 7
;GWL_batscan.c,788 :: 		PIN_UMAX3=0;
	CLRF       _PIN_UMAX3+0
;GWL_batscan.c,790 :: 		}
L_set_Umax_OUTPUT63:
;GWL_batscan.c,791 :: 		}
L_end_set_Umax_OUTPUT:
	RETURN
; end of _set_Umax_OUTPUT

_set_Umax_LT_OUTPUT:

;GWL_batscan.c,792 :: 		void set_Umax_LT_OUTPUT(u8_t status)
;GWL_batscan.c,794 :: 		if (status==CELLUMAXOK) {
	MOVF       FARG_set_Umax_LT_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Umax_LT_OUTPUT64
;GWL_batscan.c,795 :: 		UmaxP1_OUT();
	BCF        TRISF5_bit+0, BitPos(TRISF5_bit+0)
;GWL_batscan.c,796 :: 		UmaxP1=1;
	BSF        LATF+0, 5
;GWL_batscan.c,797 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Umax_LT_OUTPUT65:
	DECFSZ     R13, 1
	GOTO       L_set_Umax_LT_OUTPUT65
	DECFSZ     R12, 1
	GOTO       L_set_Umax_LT_OUTPUT65
	DECFSZ     R11, 1
	GOTO       L_set_Umax_LT_OUTPUT65
	NOP
;GWL_batscan.c,798 :: 		UmaxP1=0;
	BCF        LATF+0, 5
;GWL_batscan.c,799 :: 		UmaxP1_IN();
	BSF        TRISF5_bit+0, BitPos(TRISF5_bit+0)
;GWL_batscan.c,801 :: 		PIN_UMAX12=1;
	MOVLW      1
	MOVWF      _PIN_UMAX12+0
;GWL_batscan.c,803 :: 		}
	GOTO       L_set_Umax_LT_OUTPUT66
L_set_Umax_LT_OUTPUT64:
;GWL_batscan.c,805 :: 		UmaxP2_OUT();
	BCF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,806 :: 		UmaxP2=1;
	BSF        LATF+0, 6
;GWL_batscan.c,807 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Umax_LT_OUTPUT67:
	DECFSZ     R13, 1
	GOTO       L_set_Umax_LT_OUTPUT67
	DECFSZ     R12, 1
	GOTO       L_set_Umax_LT_OUTPUT67
	DECFSZ     R11, 1
	GOTO       L_set_Umax_LT_OUTPUT67
	NOP
;GWL_batscan.c,808 :: 		UmaxP2=0;
	BCF        LATF+0, 6
;GWL_batscan.c,809 :: 		UmaxP2_IN();
	BSF        TRISF6_bit+0, BitPos(TRISF6_bit+0)
;GWL_batscan.c,810 :: 		PIN_UMAX12=0;
	CLRF       _PIN_UMAX12+0
;GWL_batscan.c,812 :: 		}
L_set_Umax_LT_OUTPUT66:
;GWL_batscan.c,813 :: 		}
L_end_set_Umax_LT_OUTPUT:
	RETURN
; end of _set_Umax_LT_OUTPUT

_set_Uhav_OUTPUT:

;GWL_batscan.c,816 :: 		void set_Uhav_OUTPUT(u8_t status)
;GWL_batscan.c,818 :: 		if (status==CELLUHAVOK) {
	MOVF       FARG_set_Uhav_OUTPUT_status+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_Uhav_OUTPUT68
;GWL_batscan.c,819 :: 		UhavP1_OUT();
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;GWL_batscan.c,820 :: 		UhavP1=1;
	BSF        LATB+0, 4
;GWL_batscan.c,821 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Uhav_OUTPUT69:
	DECFSZ     R13, 1
	GOTO       L_set_Uhav_OUTPUT69
	DECFSZ     R12, 1
	GOTO       L_set_Uhav_OUTPUT69
	DECFSZ     R11, 1
	GOTO       L_set_Uhav_OUTPUT69
	NOP
;GWL_batscan.c,822 :: 		UhavP1=0;
	BCF        LATB+0, 4
;GWL_batscan.c,823 :: 		UhavP1_IN();
	BSF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;GWL_batscan.c,824 :: 		PIN_EMERG12=1;
	MOVLW      1
	MOVWF      _PIN_EMERG12+0
;GWL_batscan.c,825 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,826 :: 		UhavP3=1;
	BSF        LATB+0, 2
;GWL_batscan.c,827 :: 		PIN_EMERG3=1;
	MOVLW      1
	MOVWF      _PIN_EMERG3+0
;GWL_batscan.c,829 :: 		}
	GOTO       L_set_Uhav_OUTPUT70
L_set_Uhav_OUTPUT68:
;GWL_batscan.c,831 :: 		UhavP2_OUT();
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,832 :: 		UhavP2=1;
	BSF        LATB+0, 3
;GWL_batscan.c,833 :: 		delay_ms(130);
	MOVLW      6
	MOVWF      R11
	MOVLW      71
	MOVWF      R12
	MOVLW      160
	MOVWF      R13
L_set_Uhav_OUTPUT71:
	DECFSZ     R13, 1
	GOTO       L_set_Uhav_OUTPUT71
	DECFSZ     R12, 1
	GOTO       L_set_Uhav_OUTPUT71
	DECFSZ     R11, 1
	GOTO       L_set_Uhav_OUTPUT71
	NOP
;GWL_batscan.c,834 :: 		UhavP2=0;
	BCF        LATB+0, 3
;GWL_batscan.c,835 :: 		UhavP2_IN();
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;GWL_batscan.c,836 :: 		PIN_EMERG12=0;
	CLRF       _PIN_EMERG12+0
;GWL_batscan.c,838 :: 		UhavP3_OUT();
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;GWL_batscan.c,839 :: 		UhavP3=0;
	BCF        LATB+0, 2
;GWL_batscan.c,840 :: 		PIN_EMERG3=0;
	CLRF       _PIN_EMERG3+0
;GWL_batscan.c,842 :: 		}
L_set_Uhav_OUTPUT70:
;GWL_batscan.c,843 :: 		}
L_end_set_Uhav_OUTPUT:
	RETURN
; end of _set_Uhav_OUTPUT

_debug_init:

;GWL_batscan.c,851 :: 		void debug_init(){
;GWL_batscan.c,852 :: 		DEBUG_DATA_OUT();
	BCF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;GWL_batscan.c,853 :: 		DEBUG_CLOCK_OUT();
	BCF        TRISB6_bit+0, BitPos(TRISB6_bit+0)
;GWL_batscan.c,855 :: 		}
L_end_debug_init:
	RETURN
; end of _debug_init

_debug_send_byte:

;GWL_batscan.c,857 :: 		void debug_send_byte(u8_t byte)
;GWL_batscan.c,860 :: 		parita=0;
	CLRF       R2+0
;GWL_batscan.c,861 :: 		if (byte&0x01) st=1; else st=0;
	BTFSS      FARG_debug_send_byte_byte+0, 0
	GOTO       L_debug_send_byte72
	GOTO       L_debug_send_byte73
L_debug_send_byte72:
L_debug_send_byte73:
;GWL_batscan.c,862 :: 		for (i=0; i<8; i++) {
	CLRF       R1+0
L_debug_send_byte74:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_send_byte75
;GWL_batscan.c,863 :: 		DEBUG_CLOCK=0;
	BCF        LATB+0, 7
;GWL_batscan.c,864 :: 		if (byte&0x01) {DEBUG_DATA=1;DEBUG_CLOCK=1; parita++;}
	BTFSS      FARG_debug_send_byte_byte+0, 0
	GOTO       L_debug_send_byte77
	BSF        LATB+0, 6
	BSF        LATB+0, 7
	INCF       R2+0, 1
	GOTO       L_debug_send_byte78
L_debug_send_byte77:
;GWL_batscan.c,865 :: 		else {DEBUG_DATA=0;DEBUG_CLOCK=1;}
	BCF        LATB+0, 6
	BSF        LATB+0, 7
L_debug_send_byte78:
;GWL_batscan.c,866 :: 		byte=byte>>1;
	LSRF       FARG_debug_send_byte_byte+0, 1
;GWL_batscan.c,862 :: 		for (i=0; i<8; i++) {
	INCF       R1+0, 1
;GWL_batscan.c,867 :: 		}
	GOTO       L_debug_send_byte74
L_debug_send_byte75:
;GWL_batscan.c,869 :: 		DEBUG_CLOCK=0;
	BCF        LATB+0, 7
;GWL_batscan.c,870 :: 		for (j=0; j<1; j++) {;}
	CLRF       R3+0
L_debug_send_byte79:
	MOVLW      1
	SUBWF      R3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_send_byte80
	INCF       R3+0, 1
	GOTO       L_debug_send_byte79
L_debug_send_byte80:
;GWL_batscan.c,871 :: 		if (parita&0x01)  {DEBUG_DATA=1;DEBUG_CLOCK=1;} else {DEBUG_DATA=0;DEBUG_CLOCK=1;}
	BTFSS      R2+0, 0
	GOTO       L_debug_send_byte82
	BSF        LATB+0, 6
	BSF        LATB+0, 7
	GOTO       L_debug_send_byte83
L_debug_send_byte82:
	BCF        LATB+0, 6
	BSF        LATB+0, 7
L_debug_send_byte83:
;GWL_batscan.c,872 :: 		DEBUG_CLOCK=0;
	BCF        LATB+0, 7
;GWL_batscan.c,873 :: 		DEBUG_DATA=0;
	BCF        LATB+0, 6
;GWL_batscan.c,875 :: 		}
L_end_debug_send_byte:
	RETURN
; end of _debug_send_byte

_debug_print_hex_u8:

;GWL_batscan.c,877 :: 		void debug_print_hex_u8(u8_t byt)
;GWL_batscan.c,880 :: 		a=c&0x0f;
	MOVLW      15
	ANDWF      FARG_debug_print_hex_u8_byt+0, 0
	MOVWF      debug_print_hex_u8_a_L0+0
;GWL_batscan.c,881 :: 		b=(c&0xF0);
	MOVLW      240
	ANDWF      FARG_debug_print_hex_u8_byt+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      debug_print_hex_u8_b_L0+0
;GWL_batscan.c,882 :: 		b=b>>4;
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	MOVWF      debug_print_hex_u8_b_L0+0
;GWL_batscan.c,883 :: 		b=b&0xf;
	MOVLW      15
	ANDWF      R0, 0
	MOVWF      R1
	MOVF       R1, 0
	MOVWF      debug_print_hex_u8_b_L0+0
;GWL_batscan.c,884 :: 		if (b>9) debug_send_byte(b+55);
	MOVF       R1, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_hex_u884
	MOVLW      55
	ADDWF      debug_print_hex_u8_b_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
	GOTO       L_debug_print_hex_u885
L_debug_print_hex_u884:
;GWL_batscan.c,885 :: 		else debug_send_byte(b+48);
	MOVLW      48
	ADDWF      debug_print_hex_u8_b_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
L_debug_print_hex_u885:
;GWL_batscan.c,887 :: 		if (a>9) debug_send_byte(a+55);
	MOVF       debug_print_hex_u8_a_L0+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_hex_u886
	MOVLW      55
	ADDWF      debug_print_hex_u8_a_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
	GOTO       L_debug_print_hex_u887
L_debug_print_hex_u886:
;GWL_batscan.c,888 :: 		else debug_send_byte(a+48);
	MOVLW      48
	ADDWF      debug_print_hex_u8_a_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
L_debug_print_hex_u887:
;GWL_batscan.c,889 :: 		}
L_end_debug_print_hex_u8:
	RETURN
; end of _debug_print_hex_u8

_debug_print_hex_u16:

;GWL_batscan.c,892 :: 		void debug_print_hex_u16(u16_t byte)
;GWL_batscan.c,894 :: 		debug_print_hex_u8(byte>>8);
	MOVF       FARG_debug_print_hex_u16_byte+1, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,895 :: 		debug_print_hex_u8(byte);
	MOVF       FARG_debug_print_hex_u16_byte+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,896 :: 		}
L_end_debug_print_hex_u16:
	RETURN
; end of _debug_print_hex_u16

_debug_print_hex_u32:

;GWL_batscan.c,898 :: 		void debug_print_hex_u32(u32_t byte)
;GWL_batscan.c,900 :: 		debug_print_hex_u16(byte>>16);
	MOVF       FARG_debug_print_hex_u32_byte+2, 0
	MOVWF      R0
	MOVF       FARG_debug_print_hex_u32_byte+3, 0
	MOVWF      R1
	CLRF       R2
	CLRF       R3
	MOVF       R0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       R1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,901 :: 		debug_print_hex_u16(byte);
	MOVF       FARG_debug_print_hex_u32_byte+0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       FARG_debug_print_hex_u32_byte+1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,902 :: 		}
L_end_debug_print_hex_u32:
	RETURN
; end of _debug_print_hex_u32

_debug_print_str:

;GWL_batscan.c,905 :: 		void debug_print_str(u8_t *s)
;GWL_batscan.c,907 :: 		len=strlen(s);
	MOVF       FARG_debug_print_str_s+0, 0
	MOVWF      FARG_strlen_s+0
	MOVF       FARG_debug_print_str_s+1, 0
	MOVWF      FARG_strlen_s+1
	CALL       _strlen+0
	MOVF       R0, 0
	MOVWF      debug_print_str_len_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_str_len_L0+1
;GWL_batscan.c,908 :: 		for (i=0; i<len; i++) debug_send_byte(*s++);
	CLRF       debug_print_str_i_L0+0
	CLRF       debug_print_str_i_L0+1
L_debug_print_str88:
	MOVF       debug_print_str_len_L0+1, 0
	SUBWF      debug_print_str_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_str805
	MOVF       debug_print_str_len_L0+0, 0
	SUBWF      debug_print_str_i_L0+0, 0
L__debug_print_str805:
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_str89
	MOVF       FARG_debug_print_str_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_debug_print_str_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
	INCF       FARG_debug_print_str_s+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_debug_print_str_s+1, 1
	INCF       debug_print_str_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       debug_print_str_i_L0+1, 1
	GOTO       L_debug_print_str88
L_debug_print_str89:
;GWL_batscan.c,909 :: 		}
L_end_debug_print_str:
	RETURN
; end of _debug_print_str

_debug_print_strROM:

;GWL_batscan.c,910 :: 		void debug_print_strROM(const u8_t *s)
;GWL_batscan.c,912 :: 		len=10000;
	MOVLW      16
	MOVWF      debug_print_strROM_len_L0+0
	MOVLW      39
	MOVWF      debug_print_strROM_len_L0+1
;GWL_batscan.c,913 :: 		while (len--) {
L_debug_print_strROM91:
	MOVF       debug_print_strROM_len_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_strROM_len_L0+1, 0
	MOVWF      R1
	MOVLW      1
	SUBWF      debug_print_strROM_len_L0+0, 1
	MOVLW      0
	SUBWFB     debug_print_strROM_len_L0+1, 1
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug_print_strROM92
;GWL_batscan.c,914 :: 		if (*s==0) break;
	MOVF       FARG_debug_print_strROM_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_debug_print_strROM_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R1, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_strROM93
	GOTO       L_debug_print_strROM92
L_debug_print_strROM93:
;GWL_batscan.c,915 :: 		debug_send_byte(*s++);
	MOVF       FARG_debug_print_strROM_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_debug_print_strROM_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
	INCF       FARG_debug_print_strROM_s+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_debug_print_strROM_s+1, 1
;GWL_batscan.c,916 :: 		}
	GOTO       L_debug_print_strROM91
L_debug_print_strROM92:
;GWL_batscan.c,917 :: 		}
L_end_debug_print_strROM:
	RETURN
; end of _debug_print_strROM

_debug_print_sdec:

;GWL_batscan.c,920 :: 		void debug_print_sdec(signed int  prd)
;GWL_batscan.c,927 :: 		if (prd&0x1000) {
	BTFSS      FARG_debug_print_sdec_prd+1, 4
	GOTO       L_debug_print_sdec94
;GWL_batscan.c,928 :: 		debug_send_byte('-');
	MOVLW      45
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,929 :: 		t=prd&0x7fff;
	MOVLW      255
	ANDWF      FARG_debug_print_sdec_prd+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_sdec_prd+1, 0
	ANDLW      127
	MOVWF      R1
;GWL_batscan.c,930 :: 		prd=0x8000-t;
	MOVF       R0, 0
	SUBLW      0
	MOVWF      FARG_debug_print_sdec_prd+0
	MOVF       R1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      128
	MOVWF      FARG_debug_print_sdec_prd+1
;GWL_batscan.c,932 :: 		}
L_debug_print_sdec94:
;GWL_batscan.c,934 :: 		wrd=(u16_t)prd;
	MOVF       FARG_debug_print_sdec_prd+0, 0
	MOVWF      debug_print_sdec_wrd_L0+0
	MOVF       FARG_debug_print_sdec_prd+1, 0
	MOVWF      debug_print_sdec_wrd_L0+1
;GWL_batscan.c,936 :: 		f=0;
	CLRF       debug_print_sdec_f_L0+0
;GWL_batscan.c,937 :: 		if (wrd>=10000) {
	MOVLW      39
	SUBWF      FARG_debug_print_sdec_prd+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec808
	MOVLW      16
	SUBWF      FARG_debug_print_sdec_prd+0, 0
L__debug_print_sdec808:
	BTFSS      STATUS+0, 0
	GOTO       L_debug_print_sdec95
;GWL_batscan.c,938 :: 		i=wrd/10000;
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,939 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,940 :: 		wrd=wrd%10000;
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_sdec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_sdec_wrd_L0+1
;GWL_batscan.c,941 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_sdec_f_L0+0
;GWL_batscan.c,942 :: 		}
L_debug_print_sdec95:
;GWL_batscan.c,944 :: 		if ((wrd>=1000) || f){
	MOVLW      3
	SUBWF      debug_print_sdec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec809
	MOVLW      232
	SUBWF      debug_print_sdec_wrd_L0+0, 0
L__debug_print_sdec809:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_sdec737
	MOVF       debug_print_sdec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec737
	GOTO       L_debug_print_sdec98
L__debug_print_sdec737:
;GWL_batscan.c,945 :: 		i=wrd/1000;
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,946 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,947 :: 		wrd=wrd%1000;
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_sdec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_sdec_wrd_L0+1
;GWL_batscan.c,948 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_sdec_f_L0+0
;GWL_batscan.c,949 :: 		}
L_debug_print_sdec98:
;GWL_batscan.c,951 :: 		if ((wrd>=100) || f){
	MOVLW      0
	SUBWF      debug_print_sdec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec810
	MOVLW      100
	SUBWF      debug_print_sdec_wrd_L0+0, 0
L__debug_print_sdec810:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_sdec736
	MOVF       debug_print_sdec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec736
	GOTO       L_debug_print_sdec101
L__debug_print_sdec736:
;GWL_batscan.c,952 :: 		i=wrd/100;
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,953 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,954 :: 		wrd=wrd%100;
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_sdec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_sdec_wrd_L0+1
;GWL_batscan.c,955 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_sdec_f_L0+0
;GWL_batscan.c,956 :: 		}
L_debug_print_sdec101:
;GWL_batscan.c,958 :: 		if ((wrd>=10) || f){
	MOVLW      0
	SUBWF      debug_print_sdec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec811
	MOVLW      10
	SUBWF      debug_print_sdec_wrd_L0+0, 0
L__debug_print_sdec811:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_sdec735
	MOVF       debug_print_sdec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_sdec735
	GOTO       L_debug_print_sdec104
L__debug_print_sdec735:
;GWL_batscan.c,959 :: 		i=wrd/10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,960 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,961 :: 		wrd=wrd%10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_sdec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_sdec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_sdec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_sdec_wrd_L0+1
;GWL_batscan.c,963 :: 		}
L_debug_print_sdec104:
;GWL_batscan.c,965 :: 		debug_send_byte(wrd+48);
	MOVLW      48
	ADDWF      debug_print_sdec_wrd_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,968 :: 		}
L_end_debug_print_sdec:
	RETURN
; end of _debug_print_sdec

_debug_print_udec:

;GWL_batscan.c,969 :: 		void debug_print_udec(unsigned int  prd)
;GWL_batscan.c,974 :: 		wrd=prd;
	MOVF       FARG_debug_print_udec_prd+0, 0
	MOVWF      debug_print_udec_wrd_L0+0
	MOVF       FARG_debug_print_udec_prd+1, 0
	MOVWF      debug_print_udec_wrd_L0+1
;GWL_batscan.c,976 :: 		f=0;
	CLRF       debug_print_udec_f_L0+0
;GWL_batscan.c,977 :: 		if (wrd>=10000) {
	MOVLW      39
	SUBWF      FARG_debug_print_udec_prd+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec813
	MOVLW      16
	SUBWF      FARG_debug_print_udec_prd+0, 0
L__debug_print_udec813:
	BTFSS      STATUS+0, 0
	GOTO       L_debug_print_udec105
;GWL_batscan.c,978 :: 		i=wrd/10000;
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,979 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,980 :: 		wrd=wrd%10000;
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_udec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_udec_wrd_L0+1
;GWL_batscan.c,981 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_udec_f_L0+0
;GWL_batscan.c,982 :: 		}
L_debug_print_udec105:
;GWL_batscan.c,984 :: 		if ((wrd>=1000) || f){
	MOVLW      3
	SUBWF      debug_print_udec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec814
	MOVLW      232
	SUBWF      debug_print_udec_wrd_L0+0, 0
L__debug_print_udec814:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_udec740
	MOVF       debug_print_udec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec740
	GOTO       L_debug_print_udec108
L__debug_print_udec740:
;GWL_batscan.c,985 :: 		i=wrd/1000;
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,986 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,987 :: 		wrd=wrd%1000;
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_udec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_udec_wrd_L0+1
;GWL_batscan.c,988 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_udec_f_L0+0
;GWL_batscan.c,989 :: 		}
L_debug_print_udec108:
;GWL_batscan.c,991 :: 		if ((wrd>=100) || f){
	MOVLW      0
	SUBWF      debug_print_udec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec815
	MOVLW      100
	SUBWF      debug_print_udec_wrd_L0+0, 0
L__debug_print_udec815:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_udec739
	MOVF       debug_print_udec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec739
	GOTO       L_debug_print_udec111
L__debug_print_udec739:
;GWL_batscan.c,992 :: 		i=wrd/100;
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,993 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,994 :: 		wrd=wrd%100;
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_udec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_udec_wrd_L0+1
;GWL_batscan.c,995 :: 		f=1;
	MOVLW      1
	MOVWF      debug_print_udec_f_L0+0
;GWL_batscan.c,996 :: 		}
L_debug_print_udec111:
;GWL_batscan.c,998 :: 		if ((wrd>=10) || f){
	MOVLW      0
	SUBWF      debug_print_udec_wrd_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec816
	MOVLW      10
	SUBWF      debug_print_udec_wrd_L0+0, 0
L__debug_print_udec816:
	BTFSC      STATUS+0, 0
	GOTO       L__debug_print_udec738
	MOVF       debug_print_udec_f_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug_print_udec738
	GOTO       L_debug_print_udec114
L__debug_print_udec738:
;GWL_batscan.c,999 :: 		i=wrd/10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
;GWL_batscan.c,1000 :: 		debug_send_byte(i+48);
	MOVLW      48
	ADDWF      R0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,1001 :: 		wrd=wrd%10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_print_udec_wrd_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_udec_wrd_L0+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      debug_print_udec_wrd_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_udec_wrd_L0+1
;GWL_batscan.c,1003 :: 		}
L_debug_print_udec114:
;GWL_batscan.c,1005 :: 		debug_send_byte(wrd+48);
	MOVLW      48
	ADDWF      debug_print_udec_wrd_L0+0, 0
	MOVWF      FARG_debug_send_byte_byte+0
	CALL       _debug_send_byte+0
;GWL_batscan.c,1008 :: 		}
L_end_debug_print_udec:
	RETURN
; end of _debug_print_udec

_debug_print_float:

;GWL_batscan.c,1014 :: 		void debug_print_float(double b, u8_t des)
;GWL_batscan.c,1022 :: 		memset(&OString,0x00,30);
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      30
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,1024 :: 		id=0;
	CLRF       debug_print_float_id_L0+0
;GWL_batscan.c,1025 :: 		zero=0;
	CLRF       debug_print_float_zero_L0+0
;GWL_batscan.c,1026 :: 		for(i=0;i<sizeof(OString);i++) OString[i]=0x00;
	CLRF       debug_print_float_i_L0+0
L_debug_print_float115:
	MOVLW      30
	SUBWF      debug_print_float_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_float116
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	INCF       debug_print_float_i_L0+0, 1
	GOTO       L_debug_print_float115
L_debug_print_float116:
;GWL_batscan.c,1027 :: 		sgn=0;
	CLRF       debug_print_float_sgn_L0+0
;GWL_batscan.c,1028 :: 		if (((float)b)<0) {OString[id++]='-'; b=b* -1; sgn=1;}
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_debug_print_float_b+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_float_b+1, 0
	MOVWF      R1
	MOVF       FARG_debug_print_float_b+2, 0
	MOVWF      R2
	MOVF       FARG_debug_print_float_b+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug_print_float118
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      45
	MOVWF      INDF1+0
	INCF       debug_print_float_id_L0+0, 1
	MOVF       FARG_debug_print_float_b+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_float_b+1, 0
	MOVWF      R1
	MOVF       FARG_debug_print_float_b+2, 0
	MOVWF      R2
	MOVF       FARG_debug_print_float_b+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_debug_print_float_b+0
	MOVF       R1, 0
	MOVWF      FARG_debug_print_float_b+1
	MOVF       R2, 0
	MOVWF      FARG_debug_print_float_b+2
	MOVF       R3, 0
	MOVWF      FARG_debug_print_float_b+3
	MOVLW      1
	MOVWF      debug_print_float_sgn_L0+0
L_debug_print_float118:
;GWL_batscan.c,1031 :: 		exp=1000000000;
	MOVLW      0
	MOVWF      debug_print_float_exp_L0+0
	MOVLW      202
	MOVWF      debug_print_float_exp_L0+1
	MOVLW      154
	MOVWF      debug_print_float_exp_L0+2
	MOVLW      59
	MOVWF      debug_print_float_exp_L0+3
;GWL_batscan.c,1032 :: 		ccast=(long int)b;
	MOVF       FARG_debug_print_float_b+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_float_b+1, 0
	MOVWF      R1
	MOVF       FARG_debug_print_float_b+2, 0
	MOVWF      R2
	MOVF       FARG_debug_print_float_b+3, 0
	MOVWF      R3
	CALL       _double2longint+0
	MOVF       R0, 0
	MOVWF      debug_print_float_ccast_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_ccast_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_ccast_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_ccast_L0+3
;GWL_batscan.c,1033 :: 		tccast=ccast;
	MOVF       R0, 0
	MOVWF      debug_print_float_tccast_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_tccast_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_tccast_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_tccast_L0+3
;GWL_batscan.c,1034 :: 		dccast=ccast;
	MOVF       R0, 0
	MOVWF      debug_print_float_dccast_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_dccast_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_dccast_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_dccast_L0+3
;GWL_batscan.c,1036 :: 		for (i=0; i<10; i++) {
	CLRF       debug_print_float_i_L0+0
L_debug_print_float119:
	MOVLW      10
	SUBWF      debug_print_float_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_float120
;GWL_batscan.c,1037 :: 		j=ccast/exp;
	MOVF       debug_print_float_exp_L0+0, 0
	MOVWF      R4
	MOVF       debug_print_float_exp_L0+1, 0
	MOVWF      R5
	MOVF       debug_print_float_exp_L0+2, 0
	MOVWF      R6
	MOVF       debug_print_float_exp_L0+3, 0
	MOVWF      R7
	MOVF       debug_print_float_ccast_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_float_ccast_L0+1, 0
	MOVWF      R1
	MOVF       debug_print_float_ccast_L0+2, 0
	MOVWF      R2
	MOVF       debug_print_float_ccast_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      debug_print_float_j_L0+0
;GWL_batscan.c,1038 :: 		if (! ((!j) && (!zero)))  {OString[id++]=j+48; zero=1;
	MOVF       R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float123
	MOVF       debug_print_float_zero_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float123
	MOVLW      1
	MOVWF      R0
	GOTO       L_debug_print_float122
L_debug_print_float123:
	CLRF       R0
L_debug_print_float122:
	MOVF       R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float124
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      48
	ADDWF      debug_print_float_j_L0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      INDF1+0
	INCF       debug_print_float_id_L0+0, 1
	MOVLW      1
	MOVWF      debug_print_float_zero_L0+0
;GWL_batscan.c,1039 :: 		}
L_debug_print_float124:
;GWL_batscan.c,1040 :: 		if (zero) ccast=ccast%exp;
	MOVF       debug_print_float_zero_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug_print_float125
	MOVF       debug_print_float_exp_L0+0, 0
	MOVWF      R4
	MOVF       debug_print_float_exp_L0+1, 0
	MOVWF      R5
	MOVF       debug_print_float_exp_L0+2, 0
	MOVWF      R6
	MOVF       debug_print_float_exp_L0+3, 0
	MOVWF      R7
	MOVF       debug_print_float_ccast_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_float_ccast_L0+1, 0
	MOVWF      R1
	MOVF       debug_print_float_ccast_L0+2, 0
	MOVWF      R2
	MOVF       debug_print_float_ccast_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R10, 0
	MOVWF      R2
	MOVF       R11, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      debug_print_float_ccast_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_ccast_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_ccast_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_ccast_L0+3
L_debug_print_float125:
;GWL_batscan.c,1041 :: 		exp=exp/10;
	MOVLW      10
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       debug_print_float_exp_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_float_exp_L0+1, 0
	MOVWF      R1
	MOVF       debug_print_float_exp_L0+2, 0
	MOVWF      R2
	MOVF       debug_print_float_exp_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      debug_print_float_exp_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_exp_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_exp_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_exp_L0+3
;GWL_batscan.c,1036 :: 		for (i=0; i<10; i++) {
	INCF       debug_print_float_i_L0+0, 1
;GWL_batscan.c,1043 :: 		}
	GOTO       L_debug_print_float119
L_debug_print_float120:
;GWL_batscan.c,1045 :: 		if (!tccast) OString[id++]='0';
	MOVF       debug_print_float_tccast_L0+0, 0
	IORWF       debug_print_float_tccast_L0+1, 0
	IORWF       debug_print_float_tccast_L0+2, 0
	IORWF       debug_print_float_tccast_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float126
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      48
	MOVWF      INDF1+0
	INCF       debug_print_float_id_L0+0, 1
L_debug_print_float126:
;GWL_batscan.c,1046 :: 		if (des) OString[id++]='.';
	MOVF       FARG_debug_print_float_des+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug_print_float127
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      46
	MOVWF      INDF1+0
	INCF       debug_print_float_id_L0+0, 1
L_debug_print_float127:
;GWL_batscan.c,1049 :: 		nuly=0;
	CLRF       debug_print_float_nuly_L0+0
;GWL_batscan.c,1050 :: 		for (i=0; i<des; i++) {
	CLRF       debug_print_float_i_L0+0
L_debug_print_float128:
	MOVF       FARG_debug_print_float_des+0, 0
	SUBWF      debug_print_float_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_float129
;GWL_batscan.c,1051 :: 		b=b-tccast;
	MOVF       debug_print_float_tccast_L0+0, 0
	MOVWF      R0
	MOVF       debug_print_float_tccast_L0+1, 0
	MOVWF      R1
	MOVF       debug_print_float_tccast_L0+2, 0
	MOVWF      R2
	MOVF       debug_print_float_tccast_L0+3, 0
	MOVWF      R3
	CALL       _longword2double+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FARG_debug_print_float_b+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_float_b+1, 0
	MOVWF      R1
	MOVF       FARG_debug_print_float_b+2, 0
	MOVWF      R2
	MOVF       FARG_debug_print_float_b+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_debug_print_float_b+0
	MOVF       R1, 0
	MOVWF      FARG_debug_print_float_b+1
	MOVF       R2, 0
	MOVWF      FARG_debug_print_float_b+2
	MOVF       R3, 0
	MOVWF      FARG_debug_print_float_b+3
;GWL_batscan.c,1052 :: 		b=b*10;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_debug_print_float_b+0
	MOVF       R1, 0
	MOVWF      FARG_debug_print_float_b+1
	MOVF       R2, 0
	MOVWF      FARG_debug_print_float_b+2
	MOVF       R3, 0
	MOVWF      FARG_debug_print_float_b+3
;GWL_batscan.c,1053 :: 		OString[id]=(u8_t)b+48;
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FLOC__debug_print_float+0
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FLOC__debug_print_float+1
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FLOC__debug_print_float+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__debug_print_float+1, 1
	CALL       _double2byte+0
	MOVLW      48
	ADDWF      R0, 1
	MOVF       FLOC__debug_print_float+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__debug_print_float+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
;GWL_batscan.c,1054 :: 		if(OString[id]==48) nuly++;
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR0H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float131
	INCF       debug_print_float_nuly_L0+0, 1
L_debug_print_float131:
;GWL_batscan.c,1055 :: 		id++;
	INCF       debug_print_float_id_L0+0, 1
;GWL_batscan.c,1056 :: 		tccast=b;
	MOVF       FARG_debug_print_float_b+0, 0
	MOVWF      R0
	MOVF       FARG_debug_print_float_b+1, 0
	MOVWF      R1
	MOVF       FARG_debug_print_float_b+2, 0
	MOVWF      R2
	MOVF       FARG_debug_print_float_b+3, 0
	MOVWF      R3
	CALL       _double2longword+0
	MOVF       R0, 0
	MOVWF      debug_print_float_tccast_L0+0
	MOVF       R1, 0
	MOVWF      debug_print_float_tccast_L0+1
	MOVF       R2, 0
	MOVWF      debug_print_float_tccast_L0+2
	MOVF       R3, 0
	MOVWF      debug_print_float_tccast_L0+3
;GWL_batscan.c,1050 :: 		for (i=0; i<des; i++) {
	INCF       debug_print_float_i_L0+0, 1
;GWL_batscan.c,1057 :: 		}
	GOTO       L_debug_print_float128
L_debug_print_float129:
;GWL_batscan.c,1059 :: 		OString[id++]=0;
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_id_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	INCF       debug_print_float_id_L0+0, 1
;GWL_batscan.c,1061 :: 		if (!dccast)  {
	MOVF       debug_print_float_dccast_L0+0, 0
	IORWF       debug_print_float_dccast_L0+1, 0
	IORWF       debug_print_float_dccast_L0+2, 0
	IORWF       debug_print_float_dccast_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float132
;GWL_batscan.c,1062 :: 		if ((nuly==des) && (sgn)) {
	MOVF       debug_print_float_nuly_L0+0, 0
	XORWF      FARG_debug_print_float_des+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_debug_print_float135
	MOVF       debug_print_float_sgn_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug_print_float135
L__debug_print_float741:
;GWL_batscan.c,1063 :: 		for (i=0; i<id; i++) {OString[i]=OString[i+1];}
	CLRF       debug_print_float_i_L0+0
L_debug_print_float136:
	MOVF       debug_print_float_id_L0+0, 0
	SUBWF      debug_print_float_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_debug_print_float137
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FSR1H
	MOVF       debug_print_float_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       debug_print_float_i_L0+0, 0
	ADDLW      1
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      debug_print_float_OString_L0+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      INDF1+0
	INCF       debug_print_float_i_L0+0, 1
	GOTO       L_debug_print_float136
L_debug_print_float137:
;GWL_batscan.c,1064 :: 		}
L_debug_print_float135:
;GWL_batscan.c,1065 :: 		}
L_debug_print_float132:
;GWL_batscan.c,1066 :: 		debug_print_str(&OString);
	MOVLW      debug_print_float_OString_L0+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(debug_print_float_OString_L0+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,1067 :: 		}
L_end_debug_print_float:
	RETURN
; end of _debug_print_float

_I2C1_Initialize:

;GWL_batscan.c,1075 :: 		void I2C1_Initialize(void) {
;GWL_batscan.c,1076 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;GWL_batscan.c,1077 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;GWL_batscan.c,1079 :: 		IOCCF.IOCCF4=0;
	BCF        IOCCF+0, 4
;GWL_batscan.c,1080 :: 		IOCCN.IOCCN4=1;
	BSF        IOCCN+0, 4
;GWL_batscan.c,1082 :: 		IOCCF.IOCCF3=0;
	BCF        IOCCF+0, 3
;GWL_batscan.c,1083 :: 		PIR0.IOCIF=0;
	BCF        PIR0+0, 4
;GWL_batscan.c,1084 :: 		PIE0.IOCIE=1;
	BSF        PIE0+0, 4
;GWL_batscan.c,1087 :: 		}
L_end_I2C1_Initialize:
	RETURN
; end of _I2C1_Initialize

_wait_for_SCL:

;GWL_batscan.c,1199 :: 		void wait_for_SCL()
;GWL_batscan.c,1201 :: 		timeout=0x00FF;
	MOVLW      255
	MOVWF      _timeout+0
	CLRF       _timeout+1
;GWL_batscan.c,1202 :: 		while (SCL) {
L_wait_for_SCL139:
	BTFSS      PORTC+0, 3
	GOTO       L_wait_for_SCL140
;GWL_batscan.c,1203 :: 		if (!timeout) {
	MOVF       _timeout+0, 0
	IORWF       _timeout+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_wait_for_SCL141
;GWL_batscan.c,1204 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1205 :: 		IOCCN.IOCCN4=1;
	BSF        IOCCN+0, 4
;GWL_batscan.c,1206 :: 		return;
	GOTO       L_end_wait_for_SCL
;GWL_batscan.c,1207 :: 		}
L_wait_for_SCL141:
;GWL_batscan.c,1208 :: 		else timeout--;
	MOVLW      1
	SUBWF      _timeout+0, 1
	MOVLW      0
	SUBWFB     _timeout+1, 1
;GWL_batscan.c,1209 :: 		}
	GOTO       L_wait_for_SCL139
L_wait_for_SCL140:
;GWL_batscan.c,1210 :: 		}
L_end_wait_for_SCL:
	RETURN
; end of _wait_for_SCL

_send_ACK:

;GWL_batscan.c,1212 :: 		void send_ACK()
;GWL_batscan.c,1214 :: 		TRISC4_bit=0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1215 :: 		LATC.F4=0;
	BCF        LATC+0, 4
;GWL_batscan.c,1216 :: 		wait_for_SCL();
	CALL       _wait_for_SCL+0
;GWL_batscan.c,1217 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1219 :: 		}
L_end_send_ACK:
	RETURN
; end of _send_ACK

_interrupt:

;GWL_batscan.c,1222 :: 		void interrupt() {
;GWL_batscan.c,1225 :: 		if (PIR0.IOCIF) {
	BTFSS      PIR0+0, 4
	GOTO       L_interrupt143
;GWL_batscan.c,1226 :: 		PIR0.IOCIF=0;
	BCF        PIR0+0, 4
;GWL_batscan.c,1228 :: 		if (IOCCF.IOCCF4) {
	BTFSS      IOCCF+0, 4
	GOTO       L_interrupt144
;GWL_batscan.c,1229 :: 		IOCCF.IOCCF4=0;
	BCF        IOCCF+0, 4
;GWL_batscan.c,1230 :: 		if (SCL) {
	BTFSS      PORTC+0, 3
	GOTO       L_interrupt145
;GWL_batscan.c,1231 :: 		IOCCN.IOCCN4=0;
	BCF        IOCCN+0, 4
;GWL_batscan.c,1232 :: 		timeout=0x00FF;
	MOVLW      255
	MOVWF      _timeout+0
	CLRF       _timeout+1
;GWL_batscan.c,1233 :: 		while (SCL) {
L_interrupt146:
	BTFSS      PORTC+0, 3
	GOTO       L_interrupt147
;GWL_batscan.c,1234 :: 		if (timeout) timeout--;
	MOVF       _timeout+0, 0
	IORWF       _timeout+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt148
	MOVLW      1
	SUBWF      _timeout+0, 1
	MOVLW      0
	SUBWFB     _timeout+1, 1
	GOTO       L_interrupt149
L_interrupt148:
;GWL_batscan.c,1236 :: 		i2cstatus=I2C_WAITING;
	CLRF       _i2cstatus+0
;GWL_batscan.c,1237 :: 		IOCCP.IOCCP3=0;
	BCF        IOCCP+0, 3
;GWL_batscan.c,1238 :: 		IOCCN.IOCCN4=1;
	BSF        IOCCN+0, 4
;GWL_batscan.c,1239 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1240 :: 		}
L_interrupt149:
;GWL_batscan.c,1241 :: 		}
	GOTO       L_interrupt146
L_interrupt147:
;GWL_batscan.c,1243 :: 		i2cstatus=I2C_START_DETECTED;
	MOVLW      1
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1244 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1245 :: 		retval=0;
	CLRF       _retval+0
;GWL_batscan.c,1246 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1247 :: 		i2cdatasekvence=0;
	CLRF       _i2cdatasekvence+0
;GWL_batscan.c,1248 :: 		I2CWRITEFLAG=0;
	CLRF       _I2CWRITEFLAG+0
;GWL_batscan.c,1249 :: 		}
L_interrupt145:
;GWL_batscan.c,1250 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1251 :: 		}
L_interrupt144:
;GWL_batscan.c,1252 :: 		if (IOCCF.IOCCF3) {
	BTFSS      IOCCF+0, 3
	GOTO       L_interrupt150
;GWL_batscan.c,1253 :: 		IOCCP.IOCCP3=0;
	BCF        IOCCP+0, 3
;GWL_batscan.c,1254 :: 		IOCCF.IOCCF3=0;
	BCF        IOCCF+0, 3
;GWL_batscan.c,1255 :: 		tempSDA=SDA;
	MOVLW      0
	BTFSC      PORTC+0, 4
	MOVLW      1
	MOVWF      _tempSDA+0
;GWL_batscan.c,1257 :: 		if (i2cstatus==I2C_START_DETECTED)
	MOVF       _i2cstatus+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt151
;GWL_batscan.c,1259 :: 		if (!i2cdatasekvence) {
	MOVF       _i2cdatasekvence+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt152
;GWL_batscan.c,1260 :: 		if (bitcnt<8) {
	MOVLW      8
	SUBWF      _bitcnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt153
;GWL_batscan.c,1261 :: 		retval = (retval << 1) | SDA;
	LSLF       _retval+0, 1
	CLRF       R0
	BTFSC      PORTC+0, 4
	INCF       R0, 1
	MOVF       R0, 0
	IORWF       _retval+0, 1
;GWL_batscan.c,1262 :: 		bitcnt++;
	INCF       _bitcnt+0, 1
;GWL_batscan.c,1263 :: 		}
	GOTO       L_interrupt154
L_interrupt153:
;GWL_batscan.c,1264 :: 		else if (bitcnt==8) {
	MOVF       _bitcnt+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt155
;GWL_batscan.c,1265 :: 		en_sda=1;
	MOVLW      1
	MOVWF      _en_sda+0
;GWL_batscan.c,1266 :: 		if (retval==WR_I2C_DEVADDR) {
	MOVF       _retval+0, 0
	XORWF      _WR_I2C_DEVADDR+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt156
;GWL_batscan.c,1267 :: 		send_ACK();
	CALL       _send_ACK+0
;GWL_batscan.c,1268 :: 		if (IOCCN.IOCCN4==0) {
	BTFSC      IOCCN+0, 4
	GOTO       L_interrupt157
;GWL_batscan.c,1269 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1270 :: 		}
L_interrupt157:
;GWL_batscan.c,1271 :: 		i2cdatasekvence=1;
	MOVLW      1
	MOVWF      _i2cdatasekvence+0
;GWL_batscan.c,1272 :: 		i2cstatus=I2C_WRITE;
	MOVLW      4
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1273 :: 		en_sda=0;
	CLRF       _en_sda+0
;GWL_batscan.c,1274 :: 		}
	GOTO       L_interrupt158
L_interrupt156:
;GWL_batscan.c,1275 :: 		else if (retval==RD_I2C_DEVADDR) {
	MOVF       _retval+0, 0
	XORWF      _RD_I2C_DEVADDR+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt159
;GWL_batscan.c,1276 :: 		send_ACK();
	CALL       _send_ACK+0
;GWL_batscan.c,1277 :: 		if (IOCCN.IOCCN4==0) {
	BTFSC      IOCCN+0, 4
	GOTO       L_interrupt160
;GWL_batscan.c,1278 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1279 :: 		}
L_interrupt160:
;GWL_batscan.c,1280 :: 		i2cdatasekvence=1;
	MOVLW      1
	MOVWF      _i2cdatasekvence+0
;GWL_batscan.c,1281 :: 		i2cstatus=I2C_READ;
	MOVLW      3
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1282 :: 		en_sda=0;
	CLRF       _en_sda+0
;GWL_batscan.c,1283 :: 		}
L_interrupt159:
L_interrupt158:
;GWL_batscan.c,1284 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1285 :: 		if (retval==RD_I2C_DEVADDR) {
	MOVF       _retval+0, 0
	XORWF      _RD_I2C_DEVADDR+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt161
;GWL_batscan.c,1286 :: 		for (ti=0; ti<maxreg; ti++) {
	CLRF       _ti+0
L_interrupt162:
	MOVLW      37
	SUBWF      _ti+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt163
;GWL_batscan.c,1287 :: 		TEMPCPMREGDATA[ti]=CPMREGDATA[ti];
	MOVF       _ti+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TEMPCPMREGDATA+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_TEMPCPMREGDATA+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVLW      _CPMREGDATA+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CPMREGDATA+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;GWL_batscan.c,1286 :: 		for (ti=0; ti<maxreg; ti++) {
	INCF       _ti+0, 1
;GWL_batscan.c,1288 :: 		}
	GOTO       L_interrupt162
L_interrupt163:
;GWL_batscan.c,1289 :: 		VALBYTE=(char*)&TEMPCPMREGDATA[I2CREGID];
	MOVF       _I2CREGID+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TEMPCPMREGDATA+0
	ADDWF      R0, 1
	MOVLW      hi_addr(_TEMPCPMREGDATA+0)
	ADDWFC     R1, 1
	MOVF       R0, 0
	MOVWF      _VALBYTE+0
	MOVF       R1, 0
	MOVWF      _VALBYTE+1
;GWL_batscan.c,1290 :: 		I2CVAL=*VALBYTE;
	MOVF       R0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _I2CVAL+0
;GWL_batscan.c,1291 :: 		REGPOINTER=0;
	CLRF       _REGPOINTER+0
;GWL_batscan.c,1292 :: 		REGCHK=I2CVAL;
	MOVF       R0, 0
	MOVWF      _REGCHK+0
;GWL_batscan.c,1293 :: 		}
L_interrupt161:
;GWL_batscan.c,1294 :: 		retval=0;
	CLRF       _retval+0
;GWL_batscan.c,1295 :: 		if (en_sda) IOCCN.IOCCN4=1;
	MOVF       _en_sda+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt165
	BSF        IOCCN+0, 4
L_interrupt165:
;GWL_batscan.c,1296 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1297 :: 		}
L_interrupt155:
L_interrupt154:
;GWL_batscan.c,1298 :: 		}
L_interrupt152:
;GWL_batscan.c,1299 :: 		}
	GOTO       L_interrupt166
L_interrupt151:
;GWL_batscan.c,1300 :: 		else if (i2cstatus==I2C_READ) {
	MOVF       _i2cstatus+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt167
;GWL_batscan.c,1302 :: 		if (bitcnt<8) {
	MOVLW      8
	SUBWF      _bitcnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt168
;GWL_batscan.c,1303 :: 		bitcnt++;
	INCF       _bitcnt+0, 1
;GWL_batscan.c,1304 :: 		if (I2CVAL &0x80) {
	BTFSS      _I2CVAL+0, 7
	GOTO       L_interrupt169
;GWL_batscan.c,1305 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1306 :: 		}
	GOTO       L_interrupt170
L_interrupt169:
;GWL_batscan.c,1308 :: 		TRISC4_bit=0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1309 :: 		LATC.F4=0;
	BCF        LATC+0, 4
;GWL_batscan.c,1310 :: 		}
L_interrupt170:
;GWL_batscan.c,1311 :: 		wait_for_SCL();
	CALL       _wait_for_SCL+0
;GWL_batscan.c,1312 :: 		I2CVAL=I2CVAL<<1;
	LSLF       _I2CVAL+0, 1
;GWL_batscan.c,1314 :: 		if (IOCCN.IOCCN4==0) {
	BTFSC      IOCCN+0, 4
	GOTO       L_interrupt171
;GWL_batscan.c,1315 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1316 :: 		} else TRISC4_bit=1;
	GOTO       L_interrupt172
L_interrupt171:
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
L_interrupt172:
;GWL_batscan.c,1319 :: 		}
	GOTO       L_interrupt173
L_interrupt168:
;GWL_batscan.c,1320 :: 		else if (bitcnt==8) {
	MOVF       _bitcnt+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt174
;GWL_batscan.c,1321 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,1322 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1323 :: 		if (SDA) {
	BTFSS      PORTC+0, 4
	GOTO       L_interrupt175
;GWL_batscan.c,1324 :: 		IOCCP.IOCCP4=1;
	BSF        IOCCP+0, 4
;GWL_batscan.c,1325 :: 		}
	GOTO       L_interrupt176
L_interrupt175:
;GWL_batscan.c,1327 :: 		REGPOINTER++;
	INCF       _REGPOINTER+0, 1
;GWL_batscan.c,1328 :: 		if (REGPOINTER==2) {
	MOVF       _REGPOINTER+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt177
;GWL_batscan.c,1329 :: 		REGPOINTER=0;
	CLRF       _REGPOINTER+0
;GWL_batscan.c,1330 :: 		I2CVAL=REGCHK;
	MOVF       _REGCHK+0, 0
	MOVWF      _I2CVAL+0
;GWL_batscan.c,1331 :: 		REGCHK=0;
	CLRF       _REGCHK+0
;GWL_batscan.c,1332 :: 		}
	GOTO       L_interrupt178
L_interrupt177:
;GWL_batscan.c,1334 :: 		*VALBYTE++;
	INCF       _VALBYTE+0, 1
	BTFSC      STATUS+0, 2
	INCF       _VALBYTE+1, 1
;GWL_batscan.c,1335 :: 		I2CVAL=*VALBYTE;
	MOVF       _VALBYTE+0, 0
	MOVWF      FSR0L
	MOVF       _VALBYTE+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _I2CVAL+0
;GWL_batscan.c,1336 :: 		REGCHK=REGCHK^I2CVAL;
	MOVF       R0, 0
	XORWF      _REGCHK+0, 1
;GWL_batscan.c,1337 :: 		}
L_interrupt178:
;GWL_batscan.c,1339 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1340 :: 		}
L_interrupt176:
;GWL_batscan.c,1341 :: 		}
L_interrupt174:
L_interrupt173:
;GWL_batscan.c,1342 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1343 :: 		}
L_interrupt167:
;GWL_batscan.c,1344 :: 		else if (i2cstatus==I2C_WRITE) {
	MOVF       _i2cstatus+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt180
;GWL_batscan.c,1345 :: 		if (bitcnt<8) {
	MOVLW      8
	SUBWF      _bitcnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt181
;GWL_batscan.c,1346 :: 		retval = (retval << 1) | SDA;
	LSLF       _retval+0, 1
	CLRF       R0
	BTFSC      PORTC+0, 4
	INCF       R0, 1
	MOVF       R0, 0
	IORWF       _retval+0, 1
;GWL_batscan.c,1347 :: 		bitcnt++;
	INCF       _bitcnt+0, 1
;GWL_batscan.c,1348 :: 		}
	GOTO       L_interrupt182
L_interrupt181:
;GWL_batscan.c,1349 :: 		else if (bitcnt==8) {
	MOVF       _bitcnt+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt183
;GWL_batscan.c,1350 :: 		send_ACK();
	CALL       _send_ACK+0
;GWL_batscan.c,1351 :: 		if (IOCCN.IOCCN4==0) {
	BTFSC      IOCCN+0, 4
	GOTO       L_interrupt184
;GWL_batscan.c,1352 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1353 :: 		}
L_interrupt184:
;GWL_batscan.c,1354 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1355 :: 		if (i2cdatasekvence==1) I2CREGID=retval;
	MOVF       _i2cdatasekvence+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt185
	MOVF       _retval+0, 0
	MOVWF      _I2CREGID+0
	GOTO       L_interrupt186
L_interrupt185:
;GWL_batscan.c,1356 :: 		else if (i2cdatasekvence==2) {Lob(I2CREGVAL)=retval; CHK1=retval;}
	MOVF       _i2cdatasekvence+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt187
	MOVF       _retval+0, 0
	MOVWF      _I2CREGVAL+0
	MOVF       _retval+0, 0
	MOVWF      _CHK1+0
	GOTO       L_interrupt188
L_interrupt187:
;GWL_batscan.c,1357 :: 		else if (i2cdatasekvence==3) {Hib(I2CREGVAL)=retval; CHK2=retval;}
	MOVF       _i2cdatasekvence+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt189
	MOVF       _retval+0, 0
	MOVWF      _I2CREGVAL+1
	MOVF       _retval+0, 0
	MOVWF      _CHK2+0
	GOTO       L_interrupt190
L_interrupt189:
;GWL_batscan.c,1358 :: 		else if (i2cdatasekvence==4) {CHK1=CHK1^CHK2; if (retval==CHK1) I2CWRITEFLAG=1;}
	MOVF       _i2cdatasekvence+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt191
	MOVF       _CHK2+0, 0
	XORWF      _CHK1+0, 0
	MOVWF      R1
	MOVF       R1, 0
	MOVWF      _CHK1+0
	MOVF       _retval+0, 0
	XORWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt192
	MOVLW      1
	MOVWF      _I2CWRITEFLAG+0
L_interrupt192:
L_interrupt191:
L_interrupt190:
L_interrupt188:
L_interrupt186:
;GWL_batscan.c,1360 :: 		i2cdatasekvence++;
	INCF       _i2cdatasekvence+0, 1
;GWL_batscan.c,1361 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1362 :: 		}
L_interrupt183:
L_interrupt182:
;GWL_batscan.c,1364 :: 		}
L_interrupt180:
L_interrupt166:
;GWL_batscan.c,1365 :: 		timeout=0x00FF;
	MOVLW      255
	MOVWF      _timeout+0
	CLRF       _timeout+1
;GWL_batscan.c,1366 :: 		while (SCL) {
L_interrupt193:
	BTFSS      PORTC+0, 3
	GOTO       L_interrupt194
;GWL_batscan.c,1367 :: 		if ((tempSDA!=SDA)) {
	CLRF       R1
	BTFSC      PORTC+0, 4
	INCF       R1, 1
	MOVF       _tempSDA+0, 0
	XORWF      R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt195
;GWL_batscan.c,1368 :: 		retval=0;
	CLRF       _retval+0
;GWL_batscan.c,1369 :: 		if (SDA) {
	BTFSS      PORTC+0, 4
	GOTO       L_interrupt196
;GWL_batscan.c,1370 :: 		if (I2CWRITEFLAG) {
	MOVF       _I2CWRITEFLAG+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt197
;GWL_batscan.c,1371 :: 		if ((I2CREGID>=wrregfrom) && (I2CREGID<=maxreg)) CPMREGDATA[I2CREGID]=I2CREGVAL;
	MOVLW      21
	SUBWF      _I2CREGID+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt200
	MOVF       _I2CREGID+0, 0
	SUBLW      37
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt200
L__interrupt742:
	MOVF       _I2CREGID+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CPMREGDATA+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CPMREGDATA+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       _I2CREGVAL+0, 0
	MOVWF      INDF1+0
	MOVF       _I2CREGVAL+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
L_interrupt200:
;GWL_batscan.c,1372 :: 		if (I2CREGID==I2C_RUMINPOT) {UMIN_WR=1; }
	MOVF       _I2CREGID+0, 0
	XORLW      21
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt201
	MOVLW      1
	MOVWF      _UMIN_WR+0
	GOTO       L_interrupt202
L_interrupt201:
;GWL_batscan.c,1373 :: 		else if (I2CREGID==I2C_RUMAXPOT) {UMAX_WR=1; }
	MOVF       _I2CREGID+0, 0
	XORLW      22
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt203
	MOVLW      1
	MOVWF      _UMAX_WR+0
L_interrupt203:
L_interrupt202:
;GWL_batscan.c,1376 :: 		I2CWRITEFLAG=0;
	CLRF       _I2CWRITEFLAG+0
;GWL_batscan.c,1377 :: 		}
L_interrupt197:
;GWL_batscan.c,1378 :: 		i2cstatus=I2C_STOP_DETECTED;
	MOVLW      2
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1379 :: 		IOCCN.IOCCN4=1;
	BSF        IOCCN+0, 4
;GWL_batscan.c,1381 :: 		}
	GOTO       L_interrupt204
L_interrupt196:
;GWL_batscan.c,1382 :: 		else {i2cstatus=I2C_START_DETECTED;
	MOVLW      1
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1383 :: 		i2cdatasekvence=0;
	CLRF       _i2cdatasekvence+0
;GWL_batscan.c,1384 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1385 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1386 :: 		I2CWRITEFLAG=0;
	CLRF       _I2CWRITEFLAG+0
;GWL_batscan.c,1388 :: 		}
L_interrupt204:
;GWL_batscan.c,1389 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1390 :: 		}
L_interrupt195:
;GWL_batscan.c,1391 :: 		else if (!timeout) {
	MOVF       _timeout+0, 0
	IORWF       _timeout+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt206
;GWL_batscan.c,1392 :: 		i2cstatus=I2C_TIMEOUT;
	MOVLW      5
	MOVWF      _i2cstatus+0
;GWL_batscan.c,1393 :: 		retval=0;
	CLRF       _retval+0
;GWL_batscan.c,1394 :: 		bitcnt=0;
	CLRF       _bitcnt+0
;GWL_batscan.c,1395 :: 		IOCCN.IOCCN4=1;
	BSF        IOCCN+0, 4
;GWL_batscan.c,1396 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1397 :: 		}
L_interrupt206:
;GWL_batscan.c,1398 :: 		else timeout--;
	MOVLW      1
	SUBWF      _timeout+0, 1
	MOVLW      0
	SUBWFB     _timeout+1, 1
;GWL_batscan.c,1401 :: 		}
	GOTO       L_interrupt193
L_interrupt194:
;GWL_batscan.c,1402 :: 		IOCCP.IOCCP3=1;
	BSF        IOCCP+0, 3
;GWL_batscan.c,1403 :: 		}
L_interrupt150:
;GWL_batscan.c,1407 :: 		}
L_interrupt143:
;GWL_batscan.c,1410 :: 		if (PIR4.TMR1IF){
	BTFSS      PIR4+0, 0
	GOTO       L_interrupt208
;GWL_batscan.c,1411 :: 		PIR4.TMR1IF = 0;
	BCF        PIR4+0, 0
;GWL_batscan.c,1412 :: 		TMR1H         = 0xE0;
	MOVLW      224
	MOVWF      TMR1H+0
;GWL_batscan.c,1413 :: 		TMR1L         = 0xC0;
	MOVLW      192
	MOVWF      TMR1L+0
;GWL_batscan.c,1414 :: 		tempmil++;
	INCF       _tempmil+0, 1
;GWL_batscan.c,1415 :: 		if (tempmil==100)  {timeticks++; tempmil=0; }
	MOVF       _tempmil+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt209
	MOVLW      1
	ADDWF      _timeticks+0, 1
	MOVLW      0
	ADDWFC     _timeticks+1, 1
	ADDWFC     _timeticks+2, 1
	ADDWFC     _timeticks+3, 1
	CLRF       _tempmil+0
L_interrupt209:
;GWL_batscan.c,1416 :: 		miliseconds++;
	MOVLW      1
	ADDWF      _miliseconds+0, 1
	MOVLW      0
	ADDWFC     _miliseconds+1, 1
	ADDWFC     _miliseconds+2, 1
	ADDWFC     _miliseconds+3, 1
;GWL_batscan.c,1417 :: 		return;
	GOTO       L__interrupt822
;GWL_batscan.c,1419 :: 		}
L_interrupt208:
;GWL_batscan.c,1420 :: 		}
L_end_interrupt:
L__interrupt822:
	RETFIE     %s
; end of _interrupt

_triginiput1:

;GWL_batscan.c,1432 :: 		void triginiput1()
;GWL_batscan.c,1435 :: 		if (DIGIN1) {
	BTFSS      PORTC+0, 2
	GOTO       L_triginiput1210
;GWL_batscan.c,1436 :: 		if (diginf1==0)   {
	MOVF       _diginf1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_triginiput1211
;GWL_batscan.c,1437 :: 		diginf1=1;
	MOVLW      1
	MOVWF      _diginf1+0
;GWL_batscan.c,1438 :: 		digintime1=timeticks;
	MOVF       _timeticks+0, 0
	MOVWF      _digintime1+0
	MOVF       _timeticks+1, 0
	MOVWF      _digintime1+1
	MOVF       _timeticks+2, 0
	MOVWF      _digintime1+2
	MOVF       _timeticks+3, 0
	MOVWF      _digintime1+3
;GWL_batscan.c,1439 :: 		}
L_triginiput1211:
;GWL_batscan.c,1440 :: 		}
L_triginiput1210:
;GWL_batscan.c,1443 :: 		if (diginf1==1) {
	MOVF       _diginf1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_triginiput1212
;GWL_batscan.c,1444 :: 		if (!DIGIN1) {
	BTFSC      PORTC+0, 2
	GOTO       L_triginiput1213
;GWL_batscan.c,1445 :: 		if (timeticks<(digintime1+30)) diginf1=0; //300 msec
	MOVLW      30
	ADDWF      _digintime1+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     _digintime1+1, 0
	MOVWF      R2
	MOVLW      0
	ADDWFC     _digintime1+2, 0
	MOVWF      R3
	MOVLW      0
	ADDWFC     _digintime1+3, 0
	MOVWF      R4
	MOVF       R4, 0
	SUBWF      _timeticks+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput1824
	MOVF       R3, 0
	SUBWF      _timeticks+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput1824
	MOVF       R2, 0
	SUBWF      _timeticks+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput1824
	MOVF       R1, 0
	SUBWF      _timeticks+0, 0
L__triginiput1824:
	BTFSC      STATUS+0, 0
	GOTO       L_triginiput1214
	CLRF       _diginf1+0
	GOTO       L_triginiput1215
L_triginiput1214:
;GWL_batscan.c,1447 :: 		debug_print_str("\r\nDIGIN1ACT!");
	MOVLW      ?lstr1_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr1_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,1448 :: 		diginf1=0;
	CLRF       _diginf1+0
;GWL_batscan.c,1449 :: 		init_outputstatus();
	CALL       _init_outputstatus+0
;GWL_batscan.c,1450 :: 		events_reset();
	CALL       _events_reset+0
;GWL_batscan.c,1451 :: 		}
L_triginiput1215:
;GWL_batscan.c,1452 :: 		}
L_triginiput1213:
;GWL_batscan.c,1453 :: 		}
L_triginiput1212:
;GWL_batscan.c,1455 :: 		}
L_end_triginiput1:
	RETURN
; end of _triginiput1

_triginiput2:

;GWL_batscan.c,1456 :: 		void triginiput2()
;GWL_batscan.c,1459 :: 		if (DIGIN2) {
	BTFSS      PORTB+0, 5
	GOTO       L_triginiput2216
;GWL_batscan.c,1461 :: 		if (diginf2==0)   {
	MOVF       _diginf2+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_triginiput2217
;GWL_batscan.c,1462 :: 		diginf2=1;
	MOVLW      1
	MOVWF      _diginf2+0
;GWL_batscan.c,1463 :: 		digintime2=timeticks;
	MOVF       _timeticks+0, 0
	MOVWF      _digintime2+0
	MOVF       _timeticks+1, 0
	MOVWF      _digintime2+1
	MOVF       _timeticks+2, 0
	MOVWF      _digintime2+2
	MOVF       _timeticks+3, 0
	MOVWF      _digintime2+3
;GWL_batscan.c,1464 :: 		}
L_triginiput2217:
;GWL_batscan.c,1465 :: 		}
L_triginiput2216:
;GWL_batscan.c,1468 :: 		if (diginf2==1) {
	MOVF       _diginf2+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_triginiput2218
;GWL_batscan.c,1469 :: 		if (!DIGIN2) {
	BTFSC      PORTB+0, 5
	GOTO       L_triginiput2219
;GWL_batscan.c,1470 :: 		if (timeticks<(digintime2+30)) diginf1=0;
	MOVLW      30
	ADDWF      _digintime2+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     _digintime2+1, 0
	MOVWF      R2
	MOVLW      0
	ADDWFC     _digintime2+2, 0
	MOVWF      R3
	MOVLW      0
	ADDWFC     _digintime2+3, 0
	MOVWF      R4
	MOVF       R4, 0
	SUBWF      _timeticks+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput2826
	MOVF       R3, 0
	SUBWF      _timeticks+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput2826
	MOVF       R2, 0
	SUBWF      _timeticks+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__triginiput2826
	MOVF       R1, 0
	SUBWF      _timeticks+0, 0
L__triginiput2826:
	BTFSC      STATUS+0, 0
	GOTO       L_triginiput2220
	CLRF       _diginf1+0
	GOTO       L_triginiput2221
L_triginiput2220:
;GWL_batscan.c,1472 :: 		debug_print_str("\r\nVYPINAMEOPTOVSTUP!");
	MOVLW      ?lstr2_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr2_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,1473 :: 		diginf2=0;
	CLRF       _diginf2+0
;GWL_batscan.c,1474 :: 		set_Uhav_OUTPUT(CELLUHAVFAIL);
	CLRF       FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,1475 :: 		set_Umin_LT_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin_LT_OUTPUT_status+0
	CALL       _set_Umin_LT_OUTPUT+0
;GWL_batscan.c,1476 :: 		set_Umax_LT_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax_LT_OUTPUT_status+0
	CALL       _set_Umax_LT_OUTPUT+0
;GWL_batscan.c,1482 :: 		PWRUP=0;
	BCF        LATF+0, 4
;GWL_batscan.c,1483 :: 		delay_ms(2000);
	MOVLW      82
	MOVWF      R11
	MOVLW      43
	MOVWF      R12
	MOVLW      0
	MOVWF      R13
L_triginiput2222:
	DECFSZ     R13, 1
	GOTO       L_triginiput2222
	DECFSZ     R12, 1
	GOTO       L_triginiput2222
	DECFSZ     R11, 1
	GOTO       L_triginiput2222
	NOP
;GWL_batscan.c,1484 :: 		PWRUP_IN();
	BSF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,1485 :: 		}
L_triginiput2221:
;GWL_batscan.c,1486 :: 		}
L_triginiput2219:
;GWL_batscan.c,1487 :: 		}
L_triginiput2218:
;GWL_batscan.c,1489 :: 		}
L_end_triginiput2:
	RETURN
; end of _triginiput2

_start_timer:

;GWL_batscan.c,1492 :: 		void start_timer()
;GWL_batscan.c,1494 :: 		PMD1.TMR1MD =0;
	BCF        PMD1+0, 1
;GWL_batscan.c,1495 :: 		PMD5.SMT1MD=0;
	BCF        PMD5+0, 6
;GWL_batscan.c,1496 :: 		T1CLK = 0x01;
	MOVLW      1
	MOVWF      T1CLK+0
;GWL_batscan.c,1497 :: 		T1CON         = 0x01;
	MOVLW      1
	MOVWF      T1CON+0
;GWL_batscan.c,1498 :: 		PIR4.TMR1IF         = 0;
	BCF        PIR4+0, 0
;GWL_batscan.c,1499 :: 		TMR1H         = 0xE0;
	MOVLW      224
	MOVWF      TMR1H+0
;GWL_batscan.c,1500 :: 		TMR1L         = 0xC0;
	MOVLW      192
	MOVWF      TMR1L+0
;GWL_batscan.c,1501 :: 		PIE4.TMR1IE         = 1;
	BSF        PIE4+0, 0
;GWL_batscan.c,1502 :: 		INTCON         = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;GWL_batscan.c,1504 :: 		}
L_end_start_timer:
	RETURN
; end of _start_timer

_init_LED:

;GWL_batscan.c,1509 :: 		void init_LED()
;GWL_batscan.c,1512 :: 		LED1_OUT();
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;GWL_batscan.c,1513 :: 		LED2_OUT();
	BCF        TRISD7_bit+0, BitPos(TRISD7_bit+0)
;GWL_batscan.c,1514 :: 		LED3_OUT();
	BCF        TRISE3_bit+0, BitPos(TRISE3_bit+0)
;GWL_batscan.c,1515 :: 		LED4_OUT();
	BCF        TRISE4_bit+0, BitPos(TRISE4_bit+0)
;GWL_batscan.c,1516 :: 		LED5_OUT();
	BCF        TRISE5_bit+0, BitPos(TRISE5_bit+0)
;GWL_batscan.c,1517 :: 		LED6_OUT();
	BCF        TRISE6_bit+0, BitPos(TRISE6_bit+0)
;GWL_batscan.c,1518 :: 		LED7_OUT();
	BCF        TRISE7_bit+0, BitPos(TRISE7_bit+0)
;GWL_batscan.c,1519 :: 		LED8_OUT();
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;GWL_batscan.c,1520 :: 		LED9_OUT();
	BCF        TRISH2_bit+0, BitPos(TRISH2_bit+0)
;GWL_batscan.c,1521 :: 		LED10_OUT();
	BCF        TRISH3_bit+0, BitPos(TRISH3_bit+0)
;GWL_batscan.c,1522 :: 		LED11_OUT();
	BCF        TRISD1_bit+0, BitPos(TRISD1_bit+0)
;GWL_batscan.c,1523 :: 		LED12_OUT();
	BCF        TRISD2_bit+0, BitPos(TRISD2_bit+0)
;GWL_batscan.c,1524 :: 		LED13_OUT();
	BCF        TRISD3_bit+0, BitPos(TRISD3_bit+0)
;GWL_batscan.c,1525 :: 		LED14_OUT();
	BCF        TRISD4_bit+0, BitPos(TRISD4_bit+0)
;GWL_batscan.c,1526 :: 		LED15_OUT();
	BCF        TRISD5_bit+0, BitPos(TRISD5_bit+0)
;GWL_batscan.c,1527 :: 		LED16_OUT();
	BCF        TRISD6_bit+0, BitPos(TRISD6_bit+0)
;GWL_batscan.c,1528 :: 		BLUELED_OUT();
	BCF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
;GWL_batscan.c,1529 :: 		REDLED_OUT();
	BCF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
;GWL_batscan.c,1531 :: 		memset(&LED_stat,OFF,16);
	MOVLW      _LED_stat+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,1532 :: 		memset(&temp_LED_stat,OFF,16);
	MOVLW      _temp_LED_stat+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_temp_LED_stat+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,1537 :: 		}
L_end_init_LED:
	RETURN
; end of _init_LED

_start_LED:

;GWL_batscan.c,1538 :: 		void start_LED()
;GWL_batscan.c,1540 :: 		if (CELL_connect[0]) LED1=1;
	MOVF       _CELL_connect+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED223
	BSF        LATB+0, 0
L_start_LED223:
;GWL_batscan.c,1541 :: 		if (CELL_connect[1]) LED2=1;
	MOVF       _CELL_connect+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED224
	BSF        LATD+0, 7
L_start_LED224:
;GWL_batscan.c,1542 :: 		if (CELL_connect[2]) LED3=1;
	MOVF       _CELL_connect+2, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED225
	BSF        LATE+0, 3
L_start_LED225:
;GWL_batscan.c,1543 :: 		if (CELL_connect[3]) LED4=1;
	MOVF       _CELL_connect+3, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED226
	BSF        LATE+0, 4
L_start_LED226:
;GWL_batscan.c,1544 :: 		if (CELL_connect[4]) LED5=1;
	MOVF       _CELL_connect+4, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED227
	BSF        LATE+0, 5
L_start_LED227:
;GWL_batscan.c,1545 :: 		if (CELL_connect[5]) LED6=1;
	MOVF       _CELL_connect+5, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED228
	BSF        LATE+0, 6
L_start_LED228:
;GWL_batscan.c,1546 :: 		if (CELL_connect[6]) LED7=1;
	MOVF       _CELL_connect+6, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED229
	BSF        LATE+0, 7
L_start_LED229:
;GWL_batscan.c,1547 :: 		if (CELL_connect[7]) LED8=1;
	MOVF       _CELL_connect+7, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED230
	BSF        LATD+0, 0
L_start_LED230:
;GWL_batscan.c,1548 :: 		if (CELL_connect[8]) LED9=1;
	MOVF       _CELL_connect+8, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED231
	BSF        LATH+0, 2
L_start_LED231:
;GWL_batscan.c,1549 :: 		if (CELL_connect[9]) LED10=1;
	MOVF       _CELL_connect+9, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED232
	BSF        LATH+0, 3
L_start_LED232:
;GWL_batscan.c,1550 :: 		if (CELL_connect[10]) LED11=1;
	MOVF       _CELL_connect+10, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED233
	BSF        LATD+0, 1
L_start_LED233:
;GWL_batscan.c,1551 :: 		if (CELL_connect[11]) LED12=1;
	MOVF       _CELL_connect+11, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED234
	BSF        LATD+0, 2
L_start_LED234:
;GWL_batscan.c,1552 :: 		if (CELL_connect[12]) LED13=1;
	MOVF       _CELL_connect+12, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED235
	BSF        LATD+0, 3
L_start_LED235:
;GWL_batscan.c,1553 :: 		if (CELL_connect[13]) LED14=1;
	MOVF       _CELL_connect+13, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED236
	BSF        LATD+0, 4
L_start_LED236:
;GWL_batscan.c,1554 :: 		if (CELL_connect[14]) LED15=1;
	MOVF       _CELL_connect+14, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED237
	BSF        LATD+0, 5
L_start_LED237:
;GWL_batscan.c,1555 :: 		if (CELL_connect[15]) LED16=1;
	MOVF       _CELL_connect+15, 0
	BTFSC      STATUS+0, 2
	GOTO       L_start_LED238
	BSF        LATD+0, 6
L_start_LED238:
;GWL_batscan.c,1556 :: 		BLUELED=0;
	BCF        LATE+0, 1
;GWL_batscan.c,1557 :: 		REDLED=1;
	BSF        LATE+0, 0
;GWL_batscan.c,1558 :: 		delay_ms(1000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_start_LED239:
	DECFSZ     R13, 1
	GOTO       L_start_LED239
	DECFSZ     R12, 1
	GOTO       L_start_LED239
	DECFSZ     R11, 1
	GOTO       L_start_LED239
;GWL_batscan.c,1559 :: 		BLUELED=1;
	BSF        LATE+0, 1
;GWL_batscan.c,1560 :: 		REDLED=0;
	BCF        LATE+0, 0
;GWL_batscan.c,1561 :: 		delay_ms(1000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_start_LED240:
	DECFSZ     R13, 1
	GOTO       L_start_LED240
	DECFSZ     R12, 1
	GOTO       L_start_LED240
	DECFSZ     R11, 1
	GOTO       L_start_LED240
;GWL_batscan.c,1562 :: 		REDLED=0;
	BCF        LATE+0, 0
;GWL_batscan.c,1563 :: 		BLUELED=0;
	BCF        LATE+0, 1
;GWL_batscan.c,1564 :: 		delay_ms(2000);
	MOVLW      82
	MOVWF      R11
	MOVLW      43
	MOVWF      R12
	MOVLW      0
	MOVWF      R13
L_start_LED241:
	DECFSZ     R13, 1
	GOTO       L_start_LED241
	DECFSZ     R12, 1
	GOTO       L_start_LED241
	DECFSZ     R11, 1
	GOTO       L_start_LED241
	NOP
;GWL_batscan.c,1567 :: 		}
L_end_start_LED:
	RETURN
; end of _start_LED

_EVENT_LED:

;GWL_batscan.c,1570 :: 		void EVENT_LED()
;GWL_batscan.c,1574 :: 		LD=eeprom_read (EEADDR_IDCELL);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      EVENT_LED_LD_L0+0
;GWL_batscan.c,1575 :: 		LED1=0;  LED2=0;  LED3=0;  LED4=0;  LED5=0;  LED6=0;  LED7=0;  LED8=0;  LED9=0;  LED10=0;  LED11=0;  LED12=0;  LED13=0;  LED14=0;  LED15=0;  LED16=0;
	BCF        LATB+0, 0
	BCF        LATD+0, 7
	BCF        LATE+0, 3
	BCF        LATE+0, 4
	BCF        LATE+0, 5
	BCF        LATE+0, 6
	BCF        LATE+0, 7
	BCF        LATD+0, 0
	BCF        LATH+0, 2
	BCF        LATH+0, 3
	BCF        LATD+0, 1
	BCF        LATD+0, 2
	BCF        LATD+0, 3
	BCF        LATD+0, 4
	BCF        LATD+0, 5
	BCF        LATD+0, 6
;GWL_batscan.c,1576 :: 		if ((LD>0) && (LD<17)) {
	MOVF       R0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_EVENT_LED244
	MOVLW      17
	SUBWF      EVENT_LED_LD_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_EVENT_LED244
L__EVENT_LED743:
;GWL_batscan.c,1577 :: 		if (LD==1) LED1=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED245
	BSF        LATB+0, 0
L_EVENT_LED245:
;GWL_batscan.c,1578 :: 		if (LD==2) LED2=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED246
	BSF        LATD+0, 7
L_EVENT_LED246:
;GWL_batscan.c,1579 :: 		if (LD==3) LED3=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED247
	BSF        LATE+0, 3
L_EVENT_LED247:
;GWL_batscan.c,1580 :: 		if (LD==4) LED4=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED248
	BSF        LATE+0, 4
L_EVENT_LED248:
;GWL_batscan.c,1581 :: 		if (LD==5) LED5=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED249
	BSF        LATE+0, 5
L_EVENT_LED249:
;GWL_batscan.c,1582 :: 		if (LD==6) LED6=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED250
	BSF        LATE+0, 6
L_EVENT_LED250:
;GWL_batscan.c,1583 :: 		if (LD==7) LED7=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED251
	BSF        LATE+0, 7
L_EVENT_LED251:
;GWL_batscan.c,1584 :: 		if (LD==8) LED8=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED252
	BSF        LATD+0, 0
L_EVENT_LED252:
;GWL_batscan.c,1585 :: 		if (LD==9) LED9=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED253
	BSF        LATH+0, 2
L_EVENT_LED253:
;GWL_batscan.c,1586 :: 		if (LD==10) LED10=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED254
	BSF        LATH+0, 3
L_EVENT_LED254:
;GWL_batscan.c,1587 :: 		if (LD==11) LED11=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED255
	BSF        LATD+0, 1
L_EVENT_LED255:
;GWL_batscan.c,1588 :: 		if (LD==12) LED12=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED256
	BSF        LATD+0, 2
L_EVENT_LED256:
;GWL_batscan.c,1589 :: 		if (LD==13) LED13=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED257
	BSF        LATD+0, 3
L_EVENT_LED257:
;GWL_batscan.c,1590 :: 		if (LD==14) LED14=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED258
	BSF        LATD+0, 4
L_EVENT_LED258:
;GWL_batscan.c,1591 :: 		if (LD==15) LED15=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED259
	BSF        LATD+0, 5
L_EVENT_LED259:
;GWL_batscan.c,1592 :: 		if (LD==16) LED16=1;
	MOVF       EVENT_LED_LD_L0+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED260
	BSF        LATD+0, 6
L_EVENT_LED260:
;GWL_batscan.c,1594 :: 		if (eeprom_read(EEADDR_IDNAME)==EVENT_UMIN) {
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVLW      0
	XORWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EVENT_LED831
	MOVLW      0
	XORWF      R0, 0
L__EVENT_LED831:
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED261
;GWL_batscan.c,1595 :: 		BLUELED=0;
	BCF        LATE+0, 1
;GWL_batscan.c,1596 :: 		REDLED=1;
	BSF        LATE+0, 0
;GWL_batscan.c,1597 :: 		}
L_EVENT_LED261:
;GWL_batscan.c,1598 :: 		if (eeprom_read(EEADDR_IDNAME)==EVENT_UMAX) {
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVLW      0
	XORWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EVENT_LED832
	MOVLW      1
	XORWF      R0, 0
L__EVENT_LED832:
	BTFSS      STATUS+0, 2
	GOTO       L_EVENT_LED262
;GWL_batscan.c,1599 :: 		BLUELED=1;
	BSF        LATE+0, 1
;GWL_batscan.c,1600 :: 		REDLED=0;
	BCF        LATE+0, 0
;GWL_batscan.c,1601 :: 		}
L_EVENT_LED262:
;GWL_batscan.c,1602 :: 		delay_ms(2000);
	MOVLW      82
	MOVWF      R11
	MOVLW      43
	MOVWF      R12
	MOVLW      0
	MOVWF      R13
L_EVENT_LED263:
	DECFSZ     R13, 1
	GOTO       L_EVENT_LED263
	DECFSZ     R12, 1
	GOTO       L_EVENT_LED263
	DECFSZ     R11, 1
	GOTO       L_EVENT_LED263
	NOP
;GWL_batscan.c,1603 :: 		REDLED=0;
	BCF        LATE+0, 0
;GWL_batscan.c,1604 :: 		BLUELED=0;
	BCF        LATE+0, 1
;GWL_batscan.c,1605 :: 		delay_ms(1000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_EVENT_LED264:
	DECFSZ     R13, 1
	GOTO       L_EVENT_LED264
	DECFSZ     R12, 1
	GOTO       L_EVENT_LED264
	DECFSZ     R11, 1
	GOTO       L_EVENT_LED264
;GWL_batscan.c,1606 :: 		}
L_EVENT_LED244:
;GWL_batscan.c,1609 :: 		}
L_end_EVENT_LED:
	RETURN
; end of _EVENT_LED

_save_eeprom_event:

;GWL_batscan.c,1614 :: 		void  save_eeprom_event()
;GWL_batscan.c,1617 :: 		eeprom_write(EEADDR_IDCELL,EVENTCELLID);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLID+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1618 :: 		eeprom_write(EEADDR_CELLV+1,EVENTCELLV);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLV+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	MOVF       _EVENTCELLV+1, 0
	MOVWF      FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1620 :: 		eeprom_write(EEADDR_CELLV,EVENTCELLV>>8);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLV+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1622 :: 		eeprom_write(EEADDR_IDNAME,EVENTCELLTYPE);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLTYPE+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1623 :: 		eeprom_write(EEADDR_TOTALV+1,EVENTCELLTOTALV);
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLTOTALV+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	MOVF       _EVENTCELLTOTALV+1, 0
	MOVWF      FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1624 :: 		eeprom_write(EEADDR_TOTALV,EVENTCELLTOTALV>>8);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _EVENTCELLTOTALV+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1626 :: 		delay_ms(20);
	MOVLW      208
	MOVWF      R12
	MOVLW      201
	MOVWF      R13
L_save_eeprom_event265:
	DECFSZ     R13, 1
	GOTO       L_save_eeprom_event265
	DECFSZ     R12, 1
	GOTO       L_save_eeprom_event265
	NOP
	NOP
;GWL_batscan.c,1627 :: 		CPMREGDATA[I2C_IDEVCELL]=EVENTCELLID;
	MOVF       _EVENTCELLID+0, 0
	MOVWF      _CPMREGDATA+66
	CLRF       _CPMREGDATA+67
;GWL_batscan.c,1628 :: 		CPMREGDATA[I2C_CELLV]=EVENTCELLV;
	MOVF       _EVENTCELLV+0, 0
	MOVWF      _CPMREGDATA+68
	MOVF       _EVENTCELLV+1, 0
	MOVWF      _CPMREGDATA+69
;GWL_batscan.c,1629 :: 		CPMREGDATA[I2C_IDTYPE]=EVENTCELLTYPE;
	MOVF       _EVENTCELLTYPE+0, 0
	MOVWF      _CPMREGDATA+70
	CLRF       _CPMREGDATA+71
;GWL_batscan.c,1630 :: 		CPMREGDATA[I2C_EVTOTALV]=EVENTCELLTOTALV;
	MOVF       _EVENTCELLTOTALV+0, 0
	MOVWF      _CPMREGDATA+72
	MOVF       _EVENTCELLTOTALV+1, 0
	MOVWF      _CPMREGDATA+73
;GWL_batscan.c,1633 :: 		}
L_end_save_eeprom_event:
	RETURN
; end of _save_eeprom_event

_events_reset:

;GWL_batscan.c,1635 :: 		void events_reset()
;GWL_batscan.c,1637 :: 		CPMREGDATA[I2C_IDEVCELL]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+66
	MOVLW      255
	MOVWF      _CPMREGDATA+67
;GWL_batscan.c,1638 :: 		CPMREGDATA[I2C_CELLV]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+68
	MOVLW      255
	MOVWF      _CPMREGDATA+69
;GWL_batscan.c,1639 :: 		CPMREGDATA[I2C_IDTYPE]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+70
	MOVLW      255
	MOVWF      _CPMREGDATA+71
;GWL_batscan.c,1640 :: 		CPMREGDATA[I2C_EVTOTALV]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+72
	MOVLW      255
	MOVWF      _CPMREGDATA+73
;GWL_batscan.c,1641 :: 		eeprom_write(EEADDR_IDCELL,0xFF);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1642 :: 		eeprom_write(EEADDR_CELLV,0xFF);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1643 :: 		eeprom_write(EEADDR_CELLV+1,0xFF);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1644 :: 		eeprom_write(EEADDR_IDNAME,0xFF);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1645 :: 		eeprom_write(EEADDR_TOTALV,0xFF);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1646 :: 		eeprom_write(EEADDR_TOTALV+1,0xFF);
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CLRF       FARG_EEPROM_Write_data_+1
	CALL       _EEPROM_Write+0
;GWL_batscan.c,1647 :: 		delay_ms(20);
	MOVLW      208
	MOVWF      R12
	MOVLW      201
	MOVWF      R13
L_events_reset266:
	DECFSZ     R13, 1
	GOTO       L_events_reset266
	DECFSZ     R12, 1
	GOTO       L_events_reset266
	NOP
	NOP
;GWL_batscan.c,1650 :: 		}
L_end_events_reset:
	RETURN
; end of _events_reset

_eeprom_event_i2c_register_initialize:

;GWL_batscan.c,1653 :: 		void  eeprom_event_i2c_register_initialize()
;GWL_batscan.c,1655 :: 		LD=eeprom_read (EEADDR_IDCELL);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      eeprom_event_i2c_register_initialize_LD_L0+0
	MOVF       R1, 0
	MOVWF      eeprom_event_i2c_register_initialize_LD_L0+1
;GWL_batscan.c,1656 :: 		if ((LD>0) && (LD<17)) {
	MOVF       R1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__eeprom_event_i2c_register_initialize836
	MOVF       R0, 0
	SUBLW      0
L__eeprom_event_i2c_register_initialize836:
	BTFSC      STATUS+0, 0
	GOTO       L_eeprom_event_i2c_register_initialize269
	MOVLW      0
	SUBWF      eeprom_event_i2c_register_initialize_LD_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__eeprom_event_i2c_register_initialize837
	MOVLW      17
	SUBWF      eeprom_event_i2c_register_initialize_LD_L0+0, 0
L__eeprom_event_i2c_register_initialize837:
	BTFSC      STATUS+0, 0
	GOTO       L_eeprom_event_i2c_register_initialize269
L__eeprom_event_i2c_register_initialize744:
;GWL_batscan.c,1657 :: 		CPMREGDATA[I2C_IDEVCELL]=(u16_t)(LD);
	MOVF       eeprom_event_i2c_register_initialize_LD_L0+0, 0
	MOVWF      _CPMREGDATA+66
	MOVF       eeprom_event_i2c_register_initialize_LD_L0+1, 0
	MOVWF      _CPMREGDATA+67
;GWL_batscan.c,1658 :: 		CPMREGDATA[I2C_CELLV]=(eeprom_read(EEADDR_CELLV)<<8);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _CPMREGDATA+69
	CLRF       _CPMREGDATA+68
;GWL_batscan.c,1659 :: 		CPMREGDATA[I2C_CELLV]|=eeprom_read(EEADDR_CELLV+1);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	IORWF       _CPMREGDATA+68, 1
	MOVF       R1, 0
	IORWF       _CPMREGDATA+69, 1
;GWL_batscan.c,1660 :: 		CPMREGDATA[I2C_IDTYPE]=eeprom_read(EEADDR_IDNAME);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _CPMREGDATA+70
	MOVF       R1, 0
	MOVWF      _CPMREGDATA+71
;GWL_batscan.c,1661 :: 		CPMREGDATA[I2C_EVTOTALV]=(eeprom_read(EEADDR_TOTALV)<<8);
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _CPMREGDATA+73
	CLRF       _CPMREGDATA+72
;GWL_batscan.c,1662 :: 		CPMREGDATA[I2C_EVTOTALV]|=eeprom_read(EEADDR_TOTALV+1);
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	IORWF       _CPMREGDATA+72, 1
	MOVF       R1, 0
	IORWF       _CPMREGDATA+73, 1
;GWL_batscan.c,1663 :: 		}
L_eeprom_event_i2c_register_initialize269:
;GWL_batscan.c,1665 :: 		}
L_end_eeprom_event_i2c_register_initialize:
	RETURN
; end of _eeprom_event_i2c_register_initialize

_LED_poll:

;GWL_batscan.c,1672 :: 		void LED_poll()
;GWL_batscan.c,1675 :: 		LED1=0;LED2=0;LED3=0;LED4=0;LED5=0;LED6=0;LED7=0;LED8=0;
	BCF        LATB+0, 0
	BCF        LATD+0, 7
	BCF        LATE+0, 3
	BCF        LATE+0, 4
	BCF        LATE+0, 5
	BCF        LATE+0, 6
	BCF        LATE+0, 7
	BCF        LATD+0, 0
;GWL_batscan.c,1676 :: 		LED9=0;LED10=0;LED11=0;LED12=0;LED13=0;LED14=0;LED15=0;LED16=0;
	BCF        LATH+0, 2
	BCF        LATH+0, 3
	BCF        LATD+0, 1
	BCF        LATD+0, 2
	BCF        LATD+0, 3
	BCF        LATD+0, 4
	BCF        LATD+0, 5
	BCF        LATD+0, 6
;GWL_batscan.c,1677 :: 		if (LED_stat[0]==BLUE) {LED1=1;LED1_OUT();fl=1;}
	MOVF       _LED_stat+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll270
	BSF        LATB+0, 0
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
	MOVLW      1
	MOVWF      _fl+0
L_LED_poll270:
;GWL_batscan.c,1678 :: 		if (LED_stat[1]==BLUE) {LED2=1;  }
	MOVF       _LED_stat+1, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll271
	BSF        LATD+0, 7
L_LED_poll271:
;GWL_batscan.c,1679 :: 		if (LED_stat[2]==BLUE) {LED3=1; }
	MOVF       _LED_stat+2, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll272
	BSF        LATE+0, 3
L_LED_poll272:
;GWL_batscan.c,1680 :: 		if (LED_stat[3]==BLUE) LED4=1;
	MOVF       _LED_stat+3, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll273
	BSF        LATE+0, 4
L_LED_poll273:
;GWL_batscan.c,1681 :: 		if (LED_stat[4]==BLUE) LED5=1;
	MOVF       _LED_stat+4, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll274
	BSF        LATE+0, 5
L_LED_poll274:
;GWL_batscan.c,1682 :: 		if (LED_stat[5]==BLUE) LED6=1;
	MOVF       _LED_stat+5, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll275
	BSF        LATE+0, 6
L_LED_poll275:
;GWL_batscan.c,1683 :: 		if (LED_stat[6]==BLUE) LED7=1;
	MOVF       _LED_stat+6, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll276
	BSF        LATE+0, 7
L_LED_poll276:
;GWL_batscan.c,1684 :: 		if (LED_stat[7]==BLUE) LED8=1;
	MOVF       _LED_stat+7, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll277
	BSF        LATD+0, 0
L_LED_poll277:
;GWL_batscan.c,1685 :: 		if (LED_stat[8]==BLUE) LED9=1;
	MOVF       _LED_stat+8, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll278
	BSF        LATH+0, 2
L_LED_poll278:
;GWL_batscan.c,1686 :: 		if (LED_stat[9]==BLUE) LED10=1;
	MOVF       _LED_stat+9, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll279
	BSF        LATH+0, 3
L_LED_poll279:
;GWL_batscan.c,1687 :: 		if (LED_stat[10]==BLUE) LED11=1;
	MOVF       _LED_stat+10, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll280
	BSF        LATD+0, 1
L_LED_poll280:
;GWL_batscan.c,1688 :: 		if (LED_stat[11]==BLUE) LED12=1;
	MOVF       _LED_stat+11, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll281
	BSF        LATD+0, 2
L_LED_poll281:
;GWL_batscan.c,1689 :: 		if (LED_stat[12]==BLUE) LED13=1;
	MOVF       _LED_stat+12, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll282
	BSF        LATD+0, 3
L_LED_poll282:
;GWL_batscan.c,1690 :: 		if (LED_stat[13]==BLUE) LED14=1;
	MOVF       _LED_stat+13, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll283
	BSF        LATD+0, 4
L_LED_poll283:
;GWL_batscan.c,1691 :: 		if (LED_stat[14]==BLUE) LED15=1;
	MOVF       _LED_stat+14, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll284
	BSF        LATD+0, 5
L_LED_poll284:
;GWL_batscan.c,1692 :: 		if (LED_stat[15]==BLUE) LED16=1;
	MOVF       _LED_stat+15, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll285
	BSF        LATD+0, 6
L_LED_poll285:
;GWL_batscan.c,1697 :: 		BLUELED=1;BLUELED_OUT(); REDLED=0; REDLED_IN();
	BSF        LATE+0, 1
	BCF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
	BCF        LATE+0, 0
	BSF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
;GWL_batscan.c,1698 :: 		delay_ms(4);
	MOVLW      42
	MOVWF      R12
	MOVLW      141
	MOVWF      R13
L_LED_poll286:
	DECFSZ     R13, 1
	GOTO       L_LED_poll286
	DECFSZ     R12, 1
	GOTO       L_LED_poll286
	NOP
	NOP
;GWL_batscan.c,1699 :: 		BLUELED=0;
	BCF        LATE+0, 1
;GWL_batscan.c,1701 :: 		LED1=0;LED2=0;LED3=0;LED4=0;LED5=0;LED6=0;LED7=0;LED8=0;
	BCF        LATB+0, 0
	BCF        LATD+0, 7
	BCF        LATE+0, 3
	BCF        LATE+0, 4
	BCF        LATE+0, 5
	BCF        LATE+0, 6
	BCF        LATE+0, 7
	BCF        LATD+0, 0
;GWL_batscan.c,1702 :: 		LED9=0;LED10=0;LED11=0;LED12=0;LED13=0;LED14=0;LED15=0;LED16=0;
	BCF        LATH+0, 2
	BCF        LATH+0, 3
	BCF        LATD+0, 1
	BCF        LATD+0, 2
	BCF        LATD+0, 3
	BCF        LATD+0, 4
	BCF        LATD+0, 5
	BCF        LATD+0, 6
;GWL_batscan.c,1703 :: 		delay_us(1000);
	MOVLW      11
	MOVWF      R12
	MOVLW      98
	MOVWF      R13
L_LED_poll287:
	DECFSZ     R13, 1
	GOTO       L_LED_poll287
	DECFSZ     R12, 1
	GOTO       L_LED_poll287
	NOP
;GWL_batscan.c,1704 :: 		if (LED_stat[0]==RED) {LED1=1; }
	MOVF       _LED_stat+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll288
	BSF        LATB+0, 0
L_LED_poll288:
;GWL_batscan.c,1705 :: 		if (LED_stat[1]==RED) {LED2=1; }
	MOVF       _LED_stat+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll289
	BSF        LATD+0, 7
L_LED_poll289:
;GWL_batscan.c,1706 :: 		if (LED_stat[2]==RED) {LED3=1;  }
	MOVF       _LED_stat+2, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll290
	BSF        LATE+0, 3
L_LED_poll290:
;GWL_batscan.c,1707 :: 		if (LED_stat[3]==RED) LED4=1;
	MOVF       _LED_stat+3, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll291
	BSF        LATE+0, 4
L_LED_poll291:
;GWL_batscan.c,1708 :: 		if (LED_stat[4]==RED) LED5=1;
	MOVF       _LED_stat+4, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll292
	BSF        LATE+0, 5
L_LED_poll292:
;GWL_batscan.c,1709 :: 		if (LED_stat[5]==RED) LED6=1;
	MOVF       _LED_stat+5, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll293
	BSF        LATE+0, 6
L_LED_poll293:
;GWL_batscan.c,1710 :: 		if (LED_stat[6]==RED) LED7=1;
	MOVF       _LED_stat+6, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll294
	BSF        LATE+0, 7
L_LED_poll294:
;GWL_batscan.c,1711 :: 		if (LED_stat[7]==RED) LED8=1;
	MOVF       _LED_stat+7, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll295
	BSF        LATD+0, 0
L_LED_poll295:
;GWL_batscan.c,1712 :: 		if (LED_stat[8]==RED) LED9=1;
	MOVF       _LED_stat+8, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll296
	BSF        LATH+0, 2
L_LED_poll296:
;GWL_batscan.c,1713 :: 		if (LED_stat[9]==RED) LED10=1;
	MOVF       _LED_stat+9, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll297
	BSF        LATH+0, 3
L_LED_poll297:
;GWL_batscan.c,1714 :: 		if (LED_stat[10]==RED) LED11=1;
	MOVF       _LED_stat+10, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll298
	BSF        LATD+0, 1
L_LED_poll298:
;GWL_batscan.c,1715 :: 		if (LED_stat[11]==RED) LED12=1;
	MOVF       _LED_stat+11, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll299
	BSF        LATD+0, 2
L_LED_poll299:
;GWL_batscan.c,1716 :: 		if (LED_stat[12]==RED) LED13=1;
	MOVF       _LED_stat+12, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll300
	BSF        LATD+0, 3
L_LED_poll300:
;GWL_batscan.c,1717 :: 		if (LED_stat[13]==RED) LED14=1;
	MOVF       _LED_stat+13, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll301
	BSF        LATD+0, 4
L_LED_poll301:
;GWL_batscan.c,1718 :: 		if (LED_stat[14]==RED) LED15=1;
	MOVF       _LED_stat+14, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll302
	BSF        LATD+0, 5
L_LED_poll302:
;GWL_batscan.c,1719 :: 		if (LED_stat[15]==RED) LED16=1;
	MOVF       _LED_stat+15, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LED_poll303
	BSF        LATD+0, 6
L_LED_poll303:
;GWL_batscan.c,1721 :: 		REDLED=1;REDLED_OUT(); BLUELED=0;  BLUELED_IN();
	BSF        LATE+0, 0
	BCF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
	BCF        LATE+0, 1
	BSF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
;GWL_batscan.c,1722 :: 		delay_ms(4);
	MOVLW      42
	MOVWF      R12
	MOVLW      141
	MOVWF      R13
L_LED_poll304:
	DECFSZ     R13, 1
	GOTO       L_LED_poll304
	DECFSZ     R12, 1
	GOTO       L_LED_poll304
	NOP
	NOP
;GWL_batscan.c,1723 :: 		REDLED=0;
	BCF        LATE+0, 0
;GWL_batscan.c,1724 :: 		REDLED_IN();
	BSF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
;GWL_batscan.c,1727 :: 		}
L_end_LED_poll:
	RETURN
; end of _LED_poll

_multiplex_init:

;GWL_batscan.c,1729 :: 		void multiplex_init()
;GWL_batscan.c,1731 :: 		DISA=1;
	BSF        LATB+0, 1
;GWL_batscan.c,1732 :: 		DISA_OUT();
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;GWL_batscan.c,1733 :: 		DISB=1;
	BSF        LATA+0, 2
;GWL_batscan.c,1734 :: 		DISB_OUT();
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;GWL_batscan.c,1735 :: 		SELB0=1;
	BSF        LATH+0, 0
;GWL_batscan.c,1736 :: 		SELB1=1;
	BSF        LATH+0, 1
;GWL_batscan.c,1737 :: 		SELB2=1;
	BSF        LATA+0, 0
;GWL_batscan.c,1738 :: 		SELB3=1;
	BSF        LATA+0, 1
;GWL_batscan.c,1739 :: 		SELB0_OUT();
	BCF        TRISH0_bit+0, BitPos(TRISH0_bit+0)
;GWL_batscan.c,1740 :: 		SELB1_OUT();
	BCF        TRISH1_bit+0, BitPos(TRISH1_bit+0)
;GWL_batscan.c,1741 :: 		SELB2_OUT();
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;GWL_batscan.c,1742 :: 		SELB3_OUT();
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;GWL_batscan.c,1744 :: 		SELA0=1;
	BSF        LATC+0, 6
;GWL_batscan.c,1745 :: 		SELA1=1;
	BSF        LATC+0, 0
;GWL_batscan.c,1746 :: 		SELA2=1;
	BSF        LATC+0, 1
;GWL_batscan.c,1747 :: 		SELA3=1;
	BSF        LATA+0, 4
;GWL_batscan.c,1749 :: 		SELA0_OUT();
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;GWL_batscan.c,1750 :: 		SELA1_OUT();
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;GWL_batscan.c,1751 :: 		SELA2_OUT();
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;GWL_batscan.c,1752 :: 		SELA3_OUT();
	BCF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;GWL_batscan.c,1754 :: 		memset(&CHN_voltage,0x00,32);
	MOVLW      _CHN_voltage+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_CHN_voltage+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      32
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,1757 :: 		}
L_end_multiplex_init:
	RETURN
; end of _multiplex_init

_set_CELL_channel:

;GWL_batscan.c,1763 :: 		void set_CELL_channel(u8_t chn)
;GWL_batscan.c,1767 :: 		if (chn==1) {SELA3=0;SELA2=0;SELA1=0;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel305
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BCF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1768 :: 		SELB3=0;SELB2=0;SELB1=0;SELB0=0;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BCF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1769 :: 		}
	GOTO       L_set_CELL_channel306
L_set_CELL_channel305:
;GWL_batscan.c,1771 :: 		if (chn==2) {SELA3=0;SELA2=0;SELA1=0;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel307
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BCF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1772 :: 		SELB3=0;SELB2=0;SELB1=0;SELB0=0;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BCF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1773 :: 		}
	GOTO       L_set_CELL_channel308
L_set_CELL_channel307:
;GWL_batscan.c,1775 :: 		if (chn==3) {SELA3=0;SELA2=0;SELA1=0;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel309
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BCF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1776 :: 		SELB3=0;SELB2=0;SELB1=0;SELB0=1;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BCF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1777 :: 		}
	GOTO       L_set_CELL_channel310
L_set_CELL_channel309:
;GWL_batscan.c,1779 :: 		if (chn==4) {SELA3=0;SELA2=0;SELA1=1;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel311
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BSF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1780 :: 		SELB3=0;SELB2=0;SELB1=0;SELB0=1;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BCF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1781 :: 		}
	GOTO       L_set_CELL_channel312
L_set_CELL_channel311:
;GWL_batscan.c,1783 :: 		if (chn==5) {SELA3=0;SELA2=0;SELA1=1;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel313
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BSF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1784 :: 		SELB3=0;SELB2=0;SELB1=1;SELB0=0;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BSF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1785 :: 		}
	GOTO       L_set_CELL_channel314
L_set_CELL_channel313:
;GWL_batscan.c,1787 :: 		if (chn==6) {SELA3=0;SELA2=0;SELA1=1;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel315
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BSF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1788 :: 		SELB3=0;SELB2=0;SELB1=1;SELB0=0;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BSF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1789 :: 		}
	GOTO       L_set_CELL_channel316
L_set_CELL_channel315:
;GWL_batscan.c,1791 :: 		if (chn==7) {SELA3=0;SELA2=0;SELA1=1;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel317
	BCF        LATA+0, 4
	BCF        LATC+0, 1
	BSF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1792 :: 		SELB3=0;SELB2=0;SELB1=1;SELB0=1;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BSF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1793 :: 		}
	GOTO       L_set_CELL_channel318
L_set_CELL_channel317:
;GWL_batscan.c,1795 :: 		if (chn==8) {SELA3=0;SELA2=1;SELA1=0;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel319
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BCF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1796 :: 		SELB3=0;SELB2=0;SELB1=1;SELB0=1;
	BCF        LATA+0, 1
	BCF        LATA+0, 0
	BSF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1797 :: 		}
	GOTO       L_set_CELL_channel320
L_set_CELL_channel319:
;GWL_batscan.c,1799 :: 		if (chn==9) {SELA3=0;SELA2=1;SELA1=0;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel321
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BCF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1800 :: 		SELB3=0;SELB2=1;SELB1=0;SELB0=0;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BCF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1801 :: 		}
	GOTO       L_set_CELL_channel322
L_set_CELL_channel321:
;GWL_batscan.c,1803 :: 		if (chn==10){SELA3=0;SELA2=1;SELA1=0;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel323
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BCF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1804 :: 		SELB3=0;SELB2=1;SELB1=0;SELB0=0;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BCF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1805 :: 		}
	GOTO       L_set_CELL_channel324
L_set_CELL_channel323:
;GWL_batscan.c,1807 :: 		if (chn==11){SELA3=0;SELA2=1;SELA1=0;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel325
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BCF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1808 :: 		SELB3=0;SELB2=1;SELB1=0;SELB0=1;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BCF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1809 :: 		}
	GOTO       L_set_CELL_channel326
L_set_CELL_channel325:
;GWL_batscan.c,1811 :: 		if (chn==12){SELA3=0;SELA2=1;SELA1=1;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel327
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BSF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1812 :: 		SELB3=0;SELB2=1;SELB1=0;SELB0=1;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BCF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1813 :: 		}
	GOTO       L_set_CELL_channel328
L_set_CELL_channel327:
;GWL_batscan.c,1815 :: 		if (chn==13){SELA3=0;SELA2=1;SELA1=1;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel329
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BSF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1816 :: 		SELB3=0;SELB2=1;SELB1=1;SELB0=0;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BSF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1817 :: 		}
	GOTO       L_set_CELL_channel330
L_set_CELL_channel329:
;GWL_batscan.c,1819 :: 		if (chn==14){SELA3=0;SELA2=1;SELA1=1;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel331
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BSF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1820 :: 		SELB3=0;SELB2=1;SELB1=1;SELB0=0;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BSF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1821 :: 		}
	GOTO       L_set_CELL_channel332
L_set_CELL_channel331:
;GWL_batscan.c,1823 :: 		if (chn==15){SELA3=0;SELA2=1;SELA1=1;SELA0=1;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel333
	BCF        LATA+0, 4
	BSF        LATC+0, 1
	BSF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1824 :: 		SELB3=0;SELB2=1;SELB1=1;SELB0=1;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BSF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1825 :: 		}
	GOTO       L_set_CELL_channel334
L_set_CELL_channel333:
;GWL_batscan.c,1827 :: 		if (chn==16){SELA3=1;SELA2=0;SELA1=0;SELA0=0;
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel335
	BSF        LATA+0, 4
	BCF        LATC+0, 1
	BCF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1828 :: 		SELB3=0;SELB2=1;SELB1=1;SELB0=1;
	BCF        LATA+0, 1
	BSF        LATA+0, 0
	BSF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1829 :: 		}
	GOTO       L_set_CELL_channel336
L_set_CELL_channel335:
;GWL_batscan.c,1833 :: 		if (chn==AGND_CHN){
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      17
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel337
;GWL_batscan.c,1834 :: 		SELA3=1;SELA2=0;SELA1=0;SELA0=1;
	BSF        LATA+0, 4
	BCF        LATC+0, 1
	BCF        LATC+0, 0
	BSF        LATC+0, 6
;GWL_batscan.c,1835 :: 		SELB3=1;SELB2=0;SELB1=0;SELB0=1;
	BSF        LATA+0, 1
	BCF        LATA+0, 0
	BCF        LATH+0, 1
	BSF        LATH+0, 0
;GWL_batscan.c,1836 :: 		}
	GOTO       L_set_CELL_channel338
L_set_CELL_channel337:
;GWL_batscan.c,1839 :: 		if (chn==VREF_CHN){
	MOVF       FARG_set_CELL_channel_chn+0, 0
	XORLW      18
	BTFSS      STATUS+0, 2
	GOTO       L_set_CELL_channel339
;GWL_batscan.c,1840 :: 		SELA3=1;SELA2=0;SELA1=1;SELA0=0;
	BSF        LATA+0, 4
	BCF        LATC+0, 1
	BSF        LATC+0, 0
	BCF        LATC+0, 6
;GWL_batscan.c,1841 :: 		SELB3=1;SELB2=0;SELB1=1;SELB0=0;
	BSF        LATA+0, 1
	BCF        LATA+0, 0
	BSF        LATH+0, 1
	BCF        LATH+0, 0
;GWL_batscan.c,1842 :: 		}
L_set_CELL_channel339:
L_set_CELL_channel338:
L_set_CELL_channel336:
L_set_CELL_channel334:
L_set_CELL_channel332:
L_set_CELL_channel330:
L_set_CELL_channel328:
L_set_CELL_channel326:
L_set_CELL_channel324:
L_set_CELL_channel322:
L_set_CELL_channel320:
L_set_CELL_channel318:
L_set_CELL_channel316:
L_set_CELL_channel314:
L_set_CELL_channel312:
L_set_CELL_channel310:
L_set_CELL_channel308:
L_set_CELL_channel306:
;GWL_batscan.c,1845 :: 		SELB0_OUT();
	BCF        TRISH0_bit+0, BitPos(TRISH0_bit+0)
;GWL_batscan.c,1846 :: 		SELB1_OUT();
	BCF        TRISH1_bit+0, BitPos(TRISH1_bit+0)
;GWL_batscan.c,1847 :: 		SELB2_OUT();
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;GWL_batscan.c,1848 :: 		SELB3_OUT();
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;GWL_batscan.c,1851 :: 		SELA0_OUT();
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;GWL_batscan.c,1852 :: 		SELA1_OUT();
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;GWL_batscan.c,1853 :: 		SELA2_OUT();
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;GWL_batscan.c,1854 :: 		SELA3_OUT();
	BCF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;GWL_batscan.c,1856 :: 		}
L_end_set_CELL_channel:
	RETURN
; end of _set_CELL_channel

_adc_getval:

;GWL_batscan.c,1859 :: 		u16_t adc_getval(u8_t channel)
;GWL_batscan.c,1861 :: 		ADPCH=channel;
	MOVF       FARG_adc_getval_channel+0, 0
	MOVWF      ADPCH+0
;GWL_batscan.c,1862 :: 		ADCON0.ADON = 1;
	BSF        ADCON0+0, 7
;GWL_batscan.c,1863 :: 		ADCON2.ADACLR = 1;
	BSF        ADCON2+0, 3
;GWL_batscan.c,1864 :: 		while(ADCON2.ADACLR);
L_adc_getval340:
	BTFSS      ADCON2+0, 3
	GOTO       L_adc_getval341
	GOTO       L_adc_getval340
L_adc_getval341:
;GWL_batscan.c,1865 :: 		ADCON0.GO = 1;
	BSF        ADCON0+0, 0
;GWL_batscan.c,1866 :: 		while (ADCON0.GO);
L_adc_getval342:
	BTFSS      ADCON0+0, 0
	GOTO       L_adc_getval343
	GOTO       L_adc_getval342
L_adc_getval343:
;GWL_batscan.c,1867 :: 		return ((ADRESH << 8) + ADRESL);
	MOVF       ADRESH+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       ADRESL+0, 0
	ADDWF      R0, 1
	MOVLW      0
	ADDWFC     R1, 1
;GWL_batscan.c,1870 :: 		}
L_end_adc_getval:
	RETURN
; end of _adc_getval

_TEST_CELL:

;GWL_batscan.c,1874 :: 		u16_t TEST_CELL(u8_t chn)
;GWL_batscan.c,1879 :: 		suma=0;
	CLRF       TEST_CELL_suma_L0+0
	CLRF       TEST_CELL_suma_L0+1
	CLRF       TEST_CELL_suma_L0+2
	CLRF       TEST_CELL_suma_L0+3
;GWL_batscan.c,1882 :: 		set_CELL_channel (AGND_CHN);
	MOVLW      17
	MOVWF      FARG_set_CELL_channel_chn+0
	CALL       _set_CELL_channel+0
;GWL_batscan.c,1883 :: 		DISA=0; DISB=0;
	BCF        LATB+0, 1
	BCF        LATA+0, 2
;GWL_batscan.c,1884 :: 		DISA_OUT();
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;GWL_batscan.c,1885 :: 		DISB_OUT();
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;GWL_batscan.c,1887 :: 		delay_ms(6);
	MOVLW      63
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_TEST_CELL344:
	DECFSZ     R13, 1
	GOTO       L_TEST_CELL344
	DECFSZ     R12, 1
	GOTO       L_TEST_CELL344
;GWL_batscan.c,1889 :: 		DISA=1; DISB=1;
	BSF        LATB+0, 1
	BSF        LATA+0, 2
;GWL_batscan.c,1890 :: 		DISA_OUT();
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;GWL_batscan.c,1891 :: 		DISB_OUT();
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;GWL_batscan.c,1893 :: 		set_CELL_channel(chn);
	MOVF       FARG_TEST_CELL_chn+0, 0
	MOVWF      FARG_set_CELL_channel_chn+0
	CALL       _set_CELL_channel+0
;GWL_batscan.c,1896 :: 		DISA=0; DISB=0;
	BCF        LATB+0, 1
	BCF        LATA+0, 2
;GWL_batscan.c,1897 :: 		DISA_OUT();
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;GWL_batscan.c,1898 :: 		DISB_OUT();
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;GWL_batscan.c,1899 :: 		delay_ms(6);
	MOVLW      63
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_TEST_CELL345:
	DECFSZ     R13, 1
	GOTO       L_TEST_CELL345
	DECFSZ     R12, 1
	GOTO       L_TEST_CELL345
;GWL_batscan.c,1900 :: 		for (i=0; i<20; i++) {
	CLRF       TEST_CELL_i_L0+0
L_TEST_CELL346:
	MOVLW      20
	SUBWF      TEST_CELL_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL347
;GWL_batscan.c,1901 :: 		suma+=adc_getval(VOLTAGEINPUT);
	MOVLW      40
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
	MOVF       R0, 0
	ADDWF      TEST_CELL_suma_L0+0, 1
	MOVF       R1, 0
	ADDWFC     TEST_CELL_suma_L0+1, 1
	MOVLW      0
	ADDWFC     TEST_CELL_suma_L0+2, 1
	ADDWFC     TEST_CELL_suma_L0+3, 1
;GWL_batscan.c,1900 :: 		for (i=0; i<20; i++) {
	INCF       TEST_CELL_i_L0+0, 1
;GWL_batscan.c,1902 :: 		}
	GOTO       L_TEST_CELL346
L_TEST_CELL347:
;GWL_batscan.c,1903 :: 		result=suma/20;
	MOVLW      20
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       TEST_CELL_suma_L0+0, 0
	MOVWF      R0
	MOVF       TEST_CELL_suma_L0+1, 0
	MOVWF      R1
	MOVF       TEST_CELL_suma_L0+2, 0
	MOVWF      R2
	MOVF       TEST_CELL_suma_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
;GWL_batscan.c,1906 :: 		DISA=1; DISB=1;
	BSF        LATB+0, 1
	BSF        LATA+0, 2
;GWL_batscan.c,1907 :: 		DISA_OUT();
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;GWL_batscan.c,1908 :: 		DISB_OUT();
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;GWL_batscan.c,1909 :: 		return testtemp;
;GWL_batscan.c,1911 :: 		}
L_end_TEST_CELL:
	RETURN
; end of _TEST_CELL

_TEST_CELL_poll:

;GWL_batscan.c,1919 :: 		void TEST_CELL_poll()
;GWL_batscan.c,1920 :: 		{    u8_t odd=0;
;GWL_batscan.c,1929 :: 		Voff=TEST_CELL(VREF_CHN);
	MOVLW      18
	MOVWF      FARG_TEST_CELL_chn+0
	CALL       _TEST_CELL+0
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_Voff_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_Voff_L0+1
;GWL_batscan.c,1930 :: 		Vdif=TEST_CELL(GB_chn);
	MOVF       _GB_chn+0, 0
	MOVWF      FARG_TEST_CELL_chn+0
	CALL       _TEST_CELL+0
;GWL_batscan.c,1936 :: 		Vysledek=0;
	CLRF       TEST_CELL_poll_vysledek_L0+0
	CLRF       TEST_CELL_poll_vysledek_L0+1
	CLRF       TEST_CELL_poll_vysledek_L0+2
	CLRF       TEST_CELL_poll_vysledek_L0+3
;GWL_batscan.c,1937 :: 		Vres=Vdif;
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_Vres_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_Vres_L0+1
;GWL_batscan.c,1938 :: 		Vres=Vres-Voff;
	MOVF       TEST_CELL_poll_Voff_L0+0, 0
	SUBWF      R0, 0
	MOVWF      TEST_CELL_poll_Vres_L0+0
	MOVF       TEST_CELL_poll_Voff_L0+1, 0
	SUBWFB     R1, 0
	MOVWF      TEST_CELL_poll_Vres_L0+1
;GWL_batscan.c,1939 :: 		if (!odd)   {Vres=Vres* -1;}
	BTFSC      _GB_chn+0, 0
	GOTO       L_TEST_CELL_poll349
	MOVF       TEST_CELL_poll_Vres_L0+0, 0
	MOVWF      R0
	MOVF       TEST_CELL_poll_Vres_L0+1, 0
	MOVWF      R1
	MOVLW      255
	MOVWF      R4
	MOVLW      255
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_Vres_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_Vres_L0+1
L_TEST_CELL_poll349:
;GWL_batscan.c,1941 :: 		if (Vres>0) {
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      TEST_CELL_poll_Vres_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll844
	MOVF       TEST_CELL_poll_Vres_L0+0, 0
	SUBLW      0
L__TEST_CELL_poll844:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll350
;GWL_batscan.c,1942 :: 		if ((Vres>LIMITVOLTAGE) && (Vres<1700)) {
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      TEST_CELL_poll_Vres_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll845
	MOVF       TEST_CELL_poll_Vres_L0+0, 0
	SUBLW      250
L__TEST_CELL_poll845:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll353
	MOVLW      128
	XORWF      TEST_CELL_poll_Vres_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      6
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll846
	MOVLW      164
	SUBWF      TEST_CELL_poll_Vres_L0+0, 0
L__TEST_CELL_poll846:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll353
L__TEST_CELL_poll750:
;GWL_batscan.c,1943 :: 		Vysledek=Vres;
	MOVF       TEST_CELL_poll_Vres_L0+0, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+0
	MOVF       TEST_CELL_poll_Vres_L0+1, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+1
	MOVLW      0
	BTFSC      TEST_CELL_poll_vysledek_L0+1, 7
	MOVLW      255
	MOVWF      TEST_CELL_poll_vysledek_L0+2
	MOVWF      TEST_CELL_poll_vysledek_L0+3
;GWL_batscan.c,1944 :: 		Vysledek*=2560;
	MOVF       TEST_CELL_poll_vysledek_L0+0, 0
	MOVWF      R0
	MOVF       TEST_CELL_poll_vysledek_L0+1, 0
	MOVWF      R1
	MOVF       TEST_CELL_poll_vysledek_L0+2, 0
	MOVWF      R2
	MOVF       TEST_CELL_poll_vysledek_L0+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      10
	MOVWF      R5
	CLRF       R6
	CLRF       R7
	CALL       _Mul_32x32_U+0
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+1
	MOVF       R2, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+2
	MOVF       R3, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+3
;GWL_batscan.c,1945 :: 		Vysledek/=1000;
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CLRF       R6
	CLRF       R7
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+1
	MOVF       R2, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+2
	MOVF       R3, 0
	MOVWF      TEST_CELL_poll_vysledek_L0+3
;GWL_batscan.c,1946 :: 		if (GB_chn==1) Vysledek+=CHN1KOREKCE;
	MOVF       _GB_chn+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll354
	MOVLW      20
	ADDWF      TEST_CELL_poll_vysledek_L0+0, 1
	MOVLW      0
	ADDWFC     TEST_CELL_poll_vysledek_L0+1, 1
	ADDWFC     TEST_CELL_poll_vysledek_L0+2, 1
	ADDWFC     TEST_CELL_poll_vysledek_L0+3, 1
L_TEST_CELL_poll354:
;GWL_batscan.c,1948 :: 		}  else {Vres=0; Vysledek=0;}
	GOTO       L_TEST_CELL_poll355
L_TEST_CELL_poll353:
	CLRF       TEST_CELL_poll_Vres_L0+0
	CLRF       TEST_CELL_poll_Vres_L0+1
	CLRF       TEST_CELL_poll_vysledek_L0+0
	CLRF       TEST_CELL_poll_vysledek_L0+1
	CLRF       TEST_CELL_poll_vysledek_L0+2
	CLRF       TEST_CELL_poll_vysledek_L0+3
L_TEST_CELL_poll355:
;GWL_batscan.c,1949 :: 		}
	GOTO       L_TEST_CELL_poll356
L_TEST_CELL_poll350:
;GWL_batscan.c,1950 :: 		else    {Vysledek=0; Vres=0;}
	CLRF       TEST_CELL_poll_vysledek_L0+0
	CLRF       TEST_CELL_poll_vysledek_L0+1
	CLRF       TEST_CELL_poll_vysledek_L0+2
	CLRF       TEST_CELL_poll_vysledek_L0+3
	CLRF       TEST_CELL_poll_Vres_L0+0
	CLRF       TEST_CELL_poll_Vres_L0+1
L_TEST_CELL_poll356:
;GWL_batscan.c,1953 :: 		test=(u16_t)Vysledek;
	MOVF       TEST_CELL_poll_vysledek_L0+0, 0
	MOVWF      TEST_CELL_poll_test_L0+0
	MOVF       TEST_CELL_poll_vysledek_L0+1, 0
	MOVWF      TEST_CELL_poll_test_L0+1
	CLRF       TEST_CELL_poll_test_L0+2
	CLRF       TEST_CELL_poll_test_L0+3
;GWL_batscan.c,1954 :: 		CHN_voltage[Gb_chn-1]=test;
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R3
	CLRF       R4
	MOVLW      0
	SUBWFB     R4, 1
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       TEST_CELL_poll_test_L0+0, 0
	MOVWF      INDF1+0
	MOVF       TEST_CELL_poll_test_L0+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;GWL_batscan.c,1961 :: 		if (test>LIMITVOLTAGE) {
	MOVF       TEST_CELL_poll_test_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll847
	MOVF       TEST_CELL_poll_test_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll847
	MOVF       TEST_CELL_poll_test_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll847
	MOVF       TEST_CELL_poll_test_L0+0, 0
	SUBLW      250
L__TEST_CELL_poll847:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll357
;GWL_batscan.c,1962 :: 		CELL_connect[GB_chn-1]=1;
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _CELL_connect+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CELL_connect+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVLW      1
	MOVWF      INDF1+0
;GWL_batscan.c,1963 :: 		if (!Missed_cell_TEST) Missed_cell_ID=GB_chn;
	MOVF       _Missed_cell_TEST+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll358
	MOVF       _GB_chn+0, 0
	MOVWF      _Missed_cell_ID+0
L_TEST_CELL_poll358:
;GWL_batscan.c,1965 :: 		if ( (test>=GB_Umin) && (test<=GB_Umax) ) temp_LED_stat[GB_chn-1]=OFF;
	MOVLW      0
	SUBWF      TEST_CELL_poll_test_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll848
	MOVLW      0
	SUBWF      TEST_CELL_poll_test_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll848
	MOVF       _GB_Umin+1, 0
	SUBWF      TEST_CELL_poll_test_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll848
	MOVF       _GB_Umin+0, 0
	SUBWF      TEST_CELL_poll_test_L0+0, 0
L__TEST_CELL_poll848:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll361
	MOVF       TEST_CELL_poll_test_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll849
	MOVF       TEST_CELL_poll_test_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll849
	MOVF       TEST_CELL_poll_test_L0+1, 0
	SUBWF      _GB_Umax+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll849
	MOVF       TEST_CELL_poll_test_L0+0, 0
	SUBWF      _GB_Umax+0, 0
L__TEST_CELL_poll849:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll361
L__TEST_CELL_poll749:
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _temp_LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	GOTO       L_TEST_CELL_poll362
L_TEST_CELL_poll361:
;GWL_batscan.c,1967 :: 		temp_LED_stat[GB_chn-1]=OFF;
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _temp_LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
;GWL_batscan.c,1968 :: 		if (test<=GB_Umin) temp_LED_stat[GB_chn-1]=RED;
	MOVF       TEST_CELL_poll_test_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll850
	MOVF       TEST_CELL_poll_test_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll850
	MOVF       TEST_CELL_poll_test_L0+1, 0
	SUBWF      _GB_Umin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll850
	MOVF       TEST_CELL_poll_test_L0+0, 0
	SUBWF      _GB_Umin+0, 0
L__TEST_CELL_poll850:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll363
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _temp_LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVLW      1
	MOVWF      INDF1+0
L_TEST_CELL_poll363:
;GWL_batscan.c,1969 :: 		if (test>=GB_Umax) {temp_LED_stat[GB_chn-1]=BLUE;
	MOVLW      0
	SUBWF      TEST_CELL_poll_test_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll851
	MOVLW      0
	SUBWF      TEST_CELL_poll_test_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll851
	MOVF       _GB_Umax+1, 0
	SUBWF      TEST_CELL_poll_test_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll851
	MOVF       _GB_Umax+0, 0
	SUBWF      TEST_CELL_poll_test_L0+0, 0
L__TEST_CELL_poll851:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll364
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _temp_LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVLW      2
	MOVWF      INDF1+0
;GWL_batscan.c,1971 :: 		}
L_TEST_CELL_poll364:
;GWL_batscan.c,1973 :: 		}
L_TEST_CELL_poll362:
;GWL_batscan.c,1975 :: 		CPMREGDATA[Gb_chn]=test;
	MOVF       _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CPMREGDATA+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CPMREGDATA+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       TEST_CELL_poll_test_L0+0, 0
	MOVWF      INDF1+0
	MOVF       TEST_CELL_poll_test_L0+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;GWL_batscan.c,1977 :: 		}  else
	GOTO       L_TEST_CELL_poll365
L_TEST_CELL_poll357:
;GWL_batscan.c,1978 :: 		{ temp_LED_stat[GB_chn-1]=OFF;
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _temp_LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
;GWL_batscan.c,1979 :: 		if (CELL_connect[GB_chn-1]) {
	MOVLW      1
	SUBWF      _GB_chn+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	SUBWFB     R1, 1
	MOVLW      _CELL_connect+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_TEST_CELL_poll366
;GWL_batscan.c,1980 :: 		DISCONNECTFLAG=1;
	MOVLW      1
	MOVWF      _DISCONNECTFLAG+0
;GWL_batscan.c,1981 :: 		}
L_TEST_CELL_poll366:
;GWL_batscan.c,1983 :: 		}
L_TEST_CELL_poll365:
;GWL_batscan.c,1986 :: 		GB_chn++;
	INCF       _GB_chn+0, 1
;GWL_batscan.c,1987 :: 		if (GB_chn>16) {
	MOVF       _GB_chn+0, 0
	SUBLW      16
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll367
;GWL_batscan.c,1988 :: 		if (!Missed_cell_TEST) Missed_cell_TEST=1;
	MOVF       _Missed_cell_TEST+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll368
	MOVLW      1
	MOVWF      _Missed_cell_TEST+0
L_TEST_CELL_poll368:
;GWL_batscan.c,1989 :: 		GB_chn=1;
	MOVLW      1
	MOVWF      _GB_chn+0
;GWL_batscan.c,1990 :: 		if (!cellconnectflag) cellconnectflag=1;
	MOVF       _cellconnectflag+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll369
	MOVLW      1
	MOVWF      _cellconnectflag+0
L_TEST_CELL_poll369:
;GWL_batscan.c,1991 :: 		LEDSTATFLAG=1;
	MOVLW      1
	MOVWF      _LEDSTATFLAG+0
;GWL_batscan.c,1993 :: 		voltsuma=0;
	CLRF       _voltsuma+0
	CLRF       _voltsuma+1
	CLRF       _voltsuma+2
	CLRF       _voltsuma+3
;GWL_batscan.c,1994 :: 		testUmax=0;
	CLRF       _testUmax+0
	CLRF       _testUmax+1
;GWL_batscan.c,1995 :: 		testUmin=0xFFFF;
	MOVLW      255
	MOVWF      _testUmin+0
	MOVLW      255
	MOVWF      _testUmin+1
;GWL_batscan.c,1996 :: 		CONDUMAXNOW=0;
	CLRF       _CONDUMAXNOW+0
;GWL_batscan.c,1997 :: 		CONDUMAXWAIT=0;
	CLRF       _CONDUMAXWAIT+0
;GWL_batscan.c,1998 :: 		CONDUMINNOW=0;
	CLRF       _CONDUMINNOW+0
;GWL_batscan.c,1999 :: 		CONDUMINWAIT=0;
	CLRF       _CONDUMINWAIT+0
;GWL_batscan.c,2001 :: 		CELLUNDERMIN=0;
	CLRF       _CELLUNDERMIN+0
;GWL_batscan.c,2002 :: 		CELLABOVEMAX=0;
	CLRF       _CELLABOVEMAX+0
;GWL_batscan.c,2004 :: 		for (i=0; i<16; i++) {
	CLRF       TEST_CELL_poll_i_L0+0
L_TEST_CELL_poll370:
	MOVLW      16
	SUBWF      TEST_CELL_poll_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll371
;GWL_batscan.c,2005 :: 		if (CELL_connect[i]) {
	MOVLW      _CELL_connect+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FSR0H
	MOVF       TEST_CELL_poll_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_TEST_CELL_poll373
;GWL_batscan.c,2006 :: 		Ucell=CHN_voltage[i];
	MOVF       TEST_CELL_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      R3
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      FSR0L
	MOVF       R4, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      TEST_CELL_poll_Ucell_L0+0
	MOVF       R1, 0
	MOVWF      TEST_CELL_poll_Ucell_L0+1
;GWL_batscan.c,2008 :: 		voltsuma+= Ucell;
	MOVF       R0, 0
	ADDWF      _voltsuma+0, 1
	MOVF       R1, 0
	ADDWFC     _voltsuma+1, 1
	MOVLW      0
	ADDWFC     _voltsuma+2, 1
	ADDWFC     _voltsuma+3, 1
;GWL_batscan.c,2009 :: 		if (testUmax<CHN_voltage[i]) testUmax=CHN_voltage[i];
	MOVF       R3, 0
	MOVWF      FSR0L
	MOVF       R4, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBWF      _testUmax+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll852
	MOVF       R1, 0
	SUBWF      _testUmax+0, 0
L__TEST_CELL_poll852:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll374
	MOVF       TEST_CELL_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _testUmax+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _testUmax+1
L_TEST_CELL_poll374:
;GWL_batscan.c,2010 :: 		if (testUmin>CHN_voltage[i]) testUmin=CHN_voltage[i];
	MOVF       TEST_CELL_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       _testUmin+1, 0
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll853
	MOVF       _testUmin+0, 0
	SUBWF      R1, 0
L__TEST_CELL_poll853:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll375
	MOVF       TEST_CELL_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _testUmin+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _testUmin+1
L_TEST_CELL_poll375:
;GWL_batscan.c,2012 :: 		if (Ucell<=(GB_Umin+UMIN_hystereze)) CONDUMAXWAIT=1;
	MOVLW      100
	ADDWF      _GB_Umin+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     _GB_Umin+1, 0
	MOVWF      R2
	MOVF       TEST_CELL_poll_Ucell_L0+1, 0
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll854
	MOVF       TEST_CELL_poll_Ucell_L0+0, 0
	SUBWF      R1, 0
L__TEST_CELL_poll854:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll376
	MOVLW      1
	MOVWF      _CONDUMAXWAIT+0
L_TEST_CELL_poll376:
;GWL_batscan.c,2013 :: 		if (Ucell<=GB_Umin) CONDUMAXNOW=1;
	MOVF       TEST_CELL_poll_Ucell_L0+1, 0
	SUBWF      _GB_Umin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll855
	MOVF       TEST_CELL_poll_Ucell_L0+0, 0
	SUBWF      _GB_Umin+0, 0
L__TEST_CELL_poll855:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll377
	MOVLW      1
	MOVWF      _CONDUMAXNOW+0
L_TEST_CELL_poll377:
;GWL_batscan.c,2014 :: 		if (Ucell>=(GB_Umax-UMIN_hystereze)) CONDUMINWAIT=1;
	MOVLW      100
	SUBWF      _GB_Umax+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     _GB_Umax+1, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBWF      TEST_CELL_poll_Ucell_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll856
	MOVF       R1, 0
	SUBWF      TEST_CELL_poll_Ucell_L0+0, 0
L__TEST_CELL_poll856:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll378
	MOVLW      1
	MOVWF      _CONDUMINWAIT+0
L_TEST_CELL_poll378:
;GWL_batscan.c,2015 :: 		if (Ucell<=GB_Umin) CONDUMINNOW=1;
	MOVF       TEST_CELL_poll_Ucell_L0+1, 0
	SUBWF      _GB_Umin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll857
	MOVF       TEST_CELL_poll_Ucell_L0+0, 0
	SUBWF      _GB_Umin+0, 0
L__TEST_CELL_poll857:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll379
	MOVLW      1
	MOVWF      _CONDUMINNOW+0
L_TEST_CELL_poll379:
;GWL_batscan.c,2017 :: 		if (Ucell<=GB_Umin) CELLUNDERMIN=1;
	MOVF       TEST_CELL_poll_Ucell_L0+1, 0
	SUBWF      _GB_Umin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll858
	MOVF       TEST_CELL_poll_Ucell_L0+0, 0
	SUBWF      _GB_Umin+0, 0
L__TEST_CELL_poll858:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll380
	MOVLW      1
	MOVWF      _CELLUNDERMIN+0
L_TEST_CELL_poll380:
;GWL_batscan.c,2018 :: 		if (Ucell>=GB_Umax) CELLABOVEMAX=1;
	MOVF       _GB_Umax+1, 0
	SUBWF      TEST_CELL_poll_Ucell_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll859
	MOVF       _GB_Umax+0, 0
	SUBWF      TEST_CELL_poll_Ucell_L0+0, 0
L__TEST_CELL_poll859:
	BTFSS      STATUS+0, 0
	GOTO       L_TEST_CELL_poll381
	MOVLW      1
	MOVWF      _CELLABOVEMAX+0
L_TEST_CELL_poll381:
;GWL_batscan.c,2020 :: 		}  else break;
	GOTO       L_TEST_CELL_poll382
L_TEST_CELL_poll373:
	GOTO       L_TEST_CELL_poll371
L_TEST_CELL_poll382:
;GWL_batscan.c,2004 :: 		for (i=0; i<16; i++) {
	INCF       TEST_CELL_poll_i_L0+0, 1
;GWL_batscan.c,2021 :: 		}
	GOTO       L_TEST_CELL_poll370
L_TEST_CELL_poll371:
;GWL_batscan.c,2024 :: 		if (voltsuma>0xFFFF) voltsuma=0xFFFF;
	MOVF       _voltsuma+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll860
	MOVF       _voltsuma+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll860
	MOVF       _voltsuma+1, 0
	SUBLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll860
	MOVF       _voltsuma+0, 0
	SUBLW      255
L__TEST_CELL_poll860:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll383
	MOVLW      255
	MOVWF      _voltsuma+0
	MOVLW      255
	MOVWF      _voltsuma+1
	CLRF       _voltsuma+2
	CLRF       _voltsuma+3
L_TEST_CELL_poll383:
;GWL_batscan.c,2025 :: 		CPMREGDATA[I2C_UCELLTOTAL]=(u16_t)voltsuma;
	MOVF       _voltsuma+0, 0
	MOVWF      _CPMREGDATA+34
	MOVF       _voltsuma+1, 0
	MOVWF      _CPMREGDATA+35
;GWL_batscan.c,2027 :: 		if (Umax4_relay_event==CELLUMAXWAITFORHYST) {
	MOVF       _Umax4_relay_event+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll384
;GWL_batscan.c,2028 :: 		if ((CONDUMAXWAIT==1) && (CELLABOVEMAX==0)) {
	MOVF       _CONDUMAXWAIT+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll387
	MOVF       _CELLABOVEMAX+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll387
L__TEST_CELL_poll748:
;GWL_batscan.c,2029 :: 		Umax4_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umax4_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umax4_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umax4_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umax4_relay_delay+3
;GWL_batscan.c,2030 :: 		Umax4_relay_event=CELLUMAXWAITFORHYSTTIME;
	MOVLW      3
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2031 :: 		debug_print_str("\r\nUMAX COND 4WAITTIME!");
	MOVLW      ?lstr3_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr3_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2032 :: 		}
L_TEST_CELL_poll387:
;GWL_batscan.c,2033 :: 		}
	GOTO       L_TEST_CELL_poll388
L_TEST_CELL_poll384:
;GWL_batscan.c,2034 :: 		else if (Umax4_relay_event==CELLUMAXWAITFORHYSTTIME) {
	MOVF       _Umax4_relay_event+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll389
;GWL_batscan.c,2035 :: 		if (CONDUMAXWAIT==0)  {
	MOVF       _CONDUMAXWAIT+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll390
;GWL_batscan.c,2036 :: 		Umax4_relay_event=CELLUMAXWAITFORHYST;
	MOVLW      2
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2037 :: 		debug_print_str("\r\nUMAX4RETURN!");
	MOVLW      ?lstr4_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr4_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2038 :: 		}
L_TEST_CELL_poll390:
;GWL_batscan.c,2039 :: 		if (timeticks>Umax4_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umax4_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll861
	MOVF       _timeticks+2, 0
	SUBWF      _Umax4_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll861
	MOVF       _timeticks+1, 0
	SUBWF      _Umax4_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll861
	MOVF       _timeticks+0, 0
	SUBWF      _Umax4_relay_delay+0, 0
L__TEST_CELL_poll861:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll391
;GWL_batscan.c,2040 :: 		set_Umax4_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umax4_OUTPUT_status+0
	CALL       _set_Umax4_OUTPUT+0
;GWL_batscan.c,2041 :: 		Umax4_relay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2042 :: 		debug_print_str("\r\nUMAX4EVRETHYSTTIME!");
	MOVLW      ?lstr5_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr5_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2043 :: 		}
L_TEST_CELL_poll391:
;GWL_batscan.c,2044 :: 		if ((CONDUMAXNOW==1) && (CELLABOVEMAX==0)) {
	MOVF       _CONDUMAXNOW+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll394
	MOVF       _CELLABOVEMAX+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll394
L__TEST_CELL_poll747:
;GWL_batscan.c,2046 :: 		debug_print_str("\r\nUMAX4EVRET NOW:");
	MOVLW      ?lstr6_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr6_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2047 :: 		debug_print_udec(testUmin);
	MOVF       _testUmin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _testUmin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2048 :: 		debug_print_str(">GBUMIN:");
	MOVLW      ?lstr7_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr7_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2049 :: 		debug_print_udec(GB_Umin);
	MOVF       _GB_Umin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Umin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2050 :: 		debug_print_str("GBUMIN-UMINHYST:");
	MOVLW      ?lstr8_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr8_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2051 :: 		debug_print_udec(GB_Umin+UMIN_hystereze);
	MOVLW      100
	ADDWF      _GB_Umin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVLW      0
	ADDWFC     _GB_Umin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2053 :: 		set_Umax4_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umax4_OUTPUT_status+0
	CALL       _set_Umax4_OUTPUT+0
;GWL_batscan.c,2054 :: 		Umax4_relay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2056 :: 		}
L_TEST_CELL_poll394:
;GWL_batscan.c,2058 :: 		}
L_TEST_CELL_poll389:
L_TEST_CELL_poll388:
;GWL_batscan.c,2062 :: 		if (Umin4_relay_event==CELLUMINWAITFORHYST) {
	MOVF       _Umin4_relay_event+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll395
;GWL_batscan.c,2063 :: 		if ((CONDUMINWAIT==1) && (CELLUNDERMIN==0)) {
	MOVF       _CONDUMINWAIT+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll398
	MOVF       _CELLUNDERMIN+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll398
L__TEST_CELL_poll746:
;GWL_batscan.c,2064 :: 		Umin4_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umin4_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umin4_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umin4_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umin4_relay_delay+3
;GWL_batscan.c,2065 :: 		Umin4_relay_event=CELLUMINWAITFORHYSTTIME;
	MOVLW      3
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2066 :: 		debug_print_str("\r\nUMIN COND 4WAITTIME!");
	MOVLW      ?lstr9_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr9_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2067 :: 		}
L_TEST_CELL_poll398:
;GWL_batscan.c,2068 :: 		}
	GOTO       L_TEST_CELL_poll399
L_TEST_CELL_poll395:
;GWL_batscan.c,2069 :: 		else if (Umin4_relay_event==CELLUMINWAITFORHYSTTIME) {
	MOVF       _Umin4_relay_event+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll400
;GWL_batscan.c,2070 :: 		if (CONDUMINWAIT==0) {
	MOVF       _CONDUMINWAIT+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll401
;GWL_batscan.c,2071 :: 		Umin4_relay_event=CELLUMINWAITFORHYST;
	MOVLW      2
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2072 :: 		debug_print_str("\r\nUMIN4RETURN!");
	MOVLW      ?lstr10_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr10_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2073 :: 		}
L_TEST_CELL_poll401:
;GWL_batscan.c,2074 :: 		if (timeticks>Umin4_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umin4_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll862
	MOVF       _timeticks+2, 0
	SUBWF      _Umin4_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll862
	MOVF       _timeticks+1, 0
	SUBWF      _Umin4_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TEST_CELL_poll862
	MOVF       _timeticks+0, 0
	SUBWF      _Umin4_relay_delay+0, 0
L__TEST_CELL_poll862:
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll402
;GWL_batscan.c,2075 :: 		set_Umin4_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umin4_OUTPUT_status+0
	CALL       _set_Umin4_OUTPUT+0
;GWL_batscan.c,2076 :: 		Umin4_relay_event=CELLNA;
	MOVLW      255
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2077 :: 		debug_print_str("\r\nUMIN4EVRETHYSTTIME!");
	MOVLW      ?lstr11_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr11_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2078 :: 		}
L_TEST_CELL_poll402:
;GWL_batscan.c,2079 :: 		if ((CONDUMINNOW==1) && (CELLUNDERMIN==0)) {
	MOVF       _CONDUMINNOW+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll405
	MOVF       _CELLUNDERMIN+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll405
L__TEST_CELL_poll745:
;GWL_batscan.c,2080 :: 		debug_print_str("\r\nUMIN4EVRET.TESTUMAX:");
	MOVLW      ?lstr12_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr12_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2081 :: 		debug_print_udec(testUmax);
	MOVF       _testUmax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _testUmax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2082 :: 		debug_print_str(">GBUMAX:");
	MOVLW      ?lstr13_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr13_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2083 :: 		debug_print_udec(GB_Umax);
	MOVF       _GB_Umax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Umax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2084 :: 		debug_print_str("GBUMAX-UMAXHYST:");
	MOVLW      ?lstr14_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr14_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2085 :: 		debug_print_udec(GB_Umax-UMAX_hystereze);
	MOVLW      100
	SUBWF      _GB_Umax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVLW      0
	SUBWFB     _GB_Umax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,2087 :: 		set_Umin4_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umin4_OUTPUT_status+0
	CALL       _set_Umin4_OUTPUT+0
;GWL_batscan.c,2088 :: 		Umin4_relay_event=CELLNA;
	MOVLW      255
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2089 :: 		}
L_TEST_CELL_poll405:
;GWL_batscan.c,2093 :: 		}
L_TEST_CELL_poll400:
L_TEST_CELL_poll399:
;GWL_batscan.c,2098 :: 		}
L_TEST_CELL_poll367:
;GWL_batscan.c,2099 :: 		if (Missed_cell_TEST==1) {
	MOVF       _Missed_cell_TEST+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll406
;GWL_batscan.c,2102 :: 		debug_print_str("\r\nMISSED CELL TEST:");
	MOVLW      ?lstr15_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr15_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2103 :: 		debug_print_hex_u8(Missed_cell_ID);
	MOVF       _Missed_cell_ID+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2104 :: 		Missed_cell_TEST=2;
	MOVLW      2
	MOVWF      _Missed_cell_TEST+0
;GWL_batscan.c,2105 :: 		for (i=0; i<Missed_cell_ID; i++) {
	CLRF       TEST_CELL_poll_i_L0+0
L_TEST_CELL_poll407:
	MOVF       _Missed_cell_ID+0, 0
	SUBWF      TEST_CELL_poll_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_TEST_CELL_poll408
;GWL_batscan.c,2106 :: 		if (!CELL_connect[i]) MISSEDINTERCELLFLAG=1;
	MOVLW      _CELL_connect+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FSR0H
	MOVF       TEST_CELL_poll_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_TEST_CELL_poll410
	MOVLW      1
	MOVWF      _MISSEDINTERCELLFLAG+0
L_TEST_CELL_poll410:
;GWL_batscan.c,2107 :: 		debug_print_hex_u8(CELL_connect[i]);
	MOVLW      _CELL_connect+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FSR0H
	MOVF       TEST_CELL_poll_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2105 :: 		for (i=0; i<Missed_cell_ID; i++) {
	INCF       TEST_CELL_poll_i_L0+0, 1
;GWL_batscan.c,2109 :: 		}
	GOTO       L_TEST_CELL_poll407
L_TEST_CELL_poll408:
;GWL_batscan.c,2110 :: 		debug_print_str("\r\nMISSED CELL TESTRES:");
	MOVLW      ?lstr16_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr16_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2111 :: 		debug_print_hex_u8(MISSEDINTERCELLFLAG);
	MOVF       _MISSEDINTERCELLFLAG+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2112 :: 		}
L_TEST_CELL_poll406:
;GWL_batscan.c,2121 :: 		}
L_end_TEST_CELL_poll:
	RETURN
; end of _TEST_CELL_poll

_Umin_button:

;GWL_batscan.c,2124 :: 		u8_t Umin_button()
;GWL_batscan.c,2128 :: 		suma=0;
	CLRF       Umin_button_suma_L0+0
	CLRF       Umin_button_suma_L0+1
	CLRF       Umin_button_suma_L0+2
	CLRF       Umin_button_suma_L0+3
;GWL_batscan.c,2132 :: 		for (i=0; i<50; i++) {
	CLRF       Umin_button_i_L0+0
L_Umin_button411:
	MOVLW      50
	SUBWF      Umin_button_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button412
;GWL_batscan.c,2133 :: 		suma+=adc_getval(UMININPUT);
	MOVLW      55
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
	MOVF       R0, 0
	ADDWF      Umin_button_suma_L0+0, 1
	MOVF       R1, 0
	ADDWFC     Umin_button_suma_L0+1, 1
	MOVLW      0
	ADDWFC     Umin_button_suma_L0+2, 1
	ADDWFC     Umin_button_suma_L0+3, 1
;GWL_batscan.c,2132 :: 		for (i=0; i<50; i++) {
	INCF       Umin_button_i_L0+0, 1
;GWL_batscan.c,2134 :: 		}
	GOTO       L_Umin_button411
L_Umin_button412:
;GWL_batscan.c,2135 :: 		temp=suma/50;
	MOVLW      50
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       Umin_button_suma_L0+0, 0
	MOVWF      R0
	MOVF       Umin_button_suma_L0+1, 0
	MOVWF      R1
	MOVF       Umin_button_suma_L0+2, 0
	MOVWF      R2
	MOVF       Umin_button_suma_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      Umin_button_temp_L0+0
	MOVF       R1, 0
	MOVWF      Umin_button_temp_L0+1
;GWL_batscan.c,2137 :: 		if (temp<0x0020) {GB_Umin=Umin0;GB_Uhavmin=Umin0-Uhavmindiff; MISSEDBUTTONFLAG=0; return 0;}
	MOVLW      0
	SUBWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button864
	MOVLW      32
	SUBWF      R0, 0
L__Umin_button864:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button414
	MOVLW      164
	MOVWF      _GB_Umin+0
	MOVLW      6
	MOVWF      _GB_Umin+1
	MOVLW      120
	MOVWF      _GB_Uhavmin+0
	MOVLW      5
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	CLRF       R0
	GOTO       L_end_Umin_button
L_Umin_button414:
;GWL_batscan.c,2138 :: 		else if ((temp>0x006E) && (temp<0x00AA)) {GB_Umin=Umin1; GB_Uhavmin=Umin1-Uhavmindiff; MISSEDBUTTONFLAG=0; return 1;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button865
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      110
L__Umin_button865:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button418
	MOVLW      0
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button866
	MOVLW      170
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button866:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button418
L__Umin_button757:
	MOVLW      8
	MOVWF      _GB_Umin+0
	MOVLW      7
	MOVWF      _GB_Umin+1
	MOVLW      220
	MOVWF      _GB_Uhavmin+0
	MOVLW      5
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      1
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button418:
;GWL_batscan.c,2139 :: 		else if ((temp>0x00F0) && (temp<0x0168)) {GB_Umin=Umin2; GB_Uhavmin=Umin2-Uhavmindiff; MISSEDBUTTONFLAG=0; return 2;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button867
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      240
L__Umin_button867:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button422
	MOVLW      1
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button868
	MOVLW      104
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button868:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button422
L__Umin_button756:
	MOVLW      108
	MOVWF      _GB_Umin+0
	MOVLW      7
	MOVWF      _GB_Umin+1
	MOVLW      64
	MOVWF      _GB_Uhavmin+0
	MOVLW      6
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      2
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button422:
;GWL_batscan.c,2140 :: 		else if ((temp>0x0180) && (temp<0x01E0)) {GB_Umin=Umin3; GB_Uhavmin=Umin3-Uhavmindiff; MISSEDBUTTONFLAG=0; return 3;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button869
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      128
L__Umin_button869:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button426
	MOVLW      1
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button870
	MOVLW      224
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button870:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button426
L__Umin_button755:
	MOVLW      208
	MOVWF      _GB_Umin+0
	MOVLW      7
	MOVWF      _GB_Umin+1
	MOVLW      164
	MOVWF      _GB_Uhavmin+0
	MOVLW      6
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      3
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button426:
;GWL_batscan.c,2141 :: 		else if ((temp>0x0250) && (temp<0x02A0)) {GB_Umin=Umin4; GB_Uhavmin=Umin4-Uhavmindiff; MISSEDBUTTONFLAG=0; return 4;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button871
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      80
L__Umin_button871:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button430
	MOVLW      2
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button872
	MOVLW      160
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button872:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button430
L__Umin_button754:
	MOVLW      240
	MOVWF      _GB_Umin+0
	MOVLW      10
	MOVWF      _GB_Umin+1
	MOVLW      196
	MOVWF      _GB_Uhavmin+0
	MOVLW      9
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      4
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button430:
;GWL_batscan.c,2142 :: 		else if ((temp>0x02C0) && (temp<0x0314)) {GB_Umin=Umin5; GB_Uhavmin=Umin5-Uhavmindiff; MISSEDBUTTONFLAG=0; return 5;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button873
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      192
L__Umin_button873:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button434
	MOVLW      3
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button874
	MOVLW      20
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button874:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button434
L__Umin_button753:
	MOVLW      84
	MOVWF      _GB_Umin+0
	MOVLW      11
	MOVWF      _GB_Umin+1
	MOVLW      40
	MOVWF      _GB_Uhavmin+0
	MOVLW      10
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      5
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button434:
;GWL_batscan.c,2143 :: 		else if ((temp>0x0340) && (temp<0x0390)) {GB_Umin=Umin6; GB_Uhavmin=Umin6-Uhavmindiff; MISSEDBUTTONFLAG=0; return 6;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button875
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      64
L__Umin_button875:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button438
	MOVLW      3
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button876
	MOVLW      144
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button876:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button438
L__Umin_button752:
	MOVLW      184
	MOVWF      _GB_Umin+0
	MOVLW      11
	MOVWF      _GB_Umin+1
	MOVLW      140
	MOVWF      _GB_Uhavmin+0
	MOVLW      10
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      6
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button438:
;GWL_batscan.c,2144 :: 		else if ((temp>0x03A9) && (temp<0x03F9)) {GB_Umin=Umin7; GB_Uhavmin=Umin7-Uhavmindiff; MISSEDBUTTONFLAG=0; return 7;}
	MOVF       Umin_button_temp_L0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button877
	MOVF       Umin_button_temp_L0+0, 0
	SUBLW      169
L__Umin_button877:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button442
	MOVLW      3
	SUBWF      Umin_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umin_button878
	MOVLW      249
	SUBWF      Umin_button_temp_L0+0, 0
L__Umin_button878:
	BTFSC      STATUS+0, 0
	GOTO       L_Umin_button442
L__Umin_button751:
	MOVLW      28
	MOVWF      _GB_Umin+0
	MOVLW      12
	MOVWF      _GB_Umin+1
	MOVLW      240
	MOVWF      _GB_Uhavmin+0
	MOVLW      10
	MOVWF      _GB_Uhavmin+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      7
	MOVWF      R0
	GOTO       L_end_Umin_button
L_Umin_button442:
;GWL_batscan.c,2146 :: 		MISSEDBUTTONFLAG=1;
	MOVLW      1
	MOVWF      _MISSEDBUTTONFLAG+0
;GWL_batscan.c,2147 :: 		debug_print_str("\r\nUMINBUTERR:");
	MOVLW      ?lstr17_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr17_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2148 :: 		debug_print_hex_u16(temp);
	MOVF       Umin_button_temp_L0+0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       Umin_button_temp_L0+1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,2152 :: 		return 0xFF;
	MOVLW      255
	MOVWF      R0
;GWL_batscan.c,2153 :: 		}
L_end_Umin_button:
	RETURN
; end of _Umin_button

_Umax_button:

;GWL_batscan.c,2155 :: 		u8_t Umax_button()
;GWL_batscan.c,2160 :: 		suma=0;
	CLRF       Umax_button_suma_L0+0
	CLRF       Umax_button_suma_L0+1
	CLRF       Umax_button_suma_L0+2
	CLRF       Umax_button_suma_L0+3
;GWL_batscan.c,2161 :: 		for (i=0; i<50; i++) {
	CLRF       Umax_button_i_L0+0
L_Umax_button444:
	MOVLW      50
	SUBWF      Umax_button_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button445
;GWL_batscan.c,2162 :: 		suma+=adc_getval(UMAXINPUT);
	MOVLW      41
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
	MOVF       R0, 0
	ADDWF      Umax_button_suma_L0+0, 1
	MOVF       R1, 0
	ADDWFC     Umax_button_suma_L0+1, 1
	MOVLW      0
	ADDWFC     Umax_button_suma_L0+2, 1
	ADDWFC     Umax_button_suma_L0+3, 1
;GWL_batscan.c,2161 :: 		for (i=0; i<50; i++) {
	INCF       Umax_button_i_L0+0, 1
;GWL_batscan.c,2163 :: 		}
	GOTO       L_Umax_button444
L_Umax_button445:
;GWL_batscan.c,2164 :: 		temp=suma/50;
	MOVLW      50
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       Umax_button_suma_L0+0, 0
	MOVWF      R0
	MOVF       Umax_button_suma_L0+1, 0
	MOVWF      R1
	MOVF       Umax_button_suma_L0+2, 0
	MOVWF      R2
	MOVF       Umax_button_suma_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      Umax_button_temp_L0+0
	MOVF       R1, 0
	MOVWF      Umax_button_temp_L0+1
;GWL_batscan.c,2166 :: 		if (temp<0x0020) {GB_Umax=Umax0;GB_Uhavmax=Umax0+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 0;}
	MOVLW      0
	SUBWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button880
	MOVLW      32
	SUBWF      R0, 0
L__Umax_button880:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button447
	MOVLW      196
	MOVWF      _GB_Umax+0
	MOVLW      9
	MOVWF      _GB_Umax+1
	MOVLW      240
	MOVWF      _GB_Uhavmax+0
	MOVLW      10
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	CLRF       R0
	GOTO       L_end_Umax_button
L_Umax_button447:
;GWL_batscan.c,2167 :: 		else if ((temp>0x0170) && (temp<0x0180)) {GB_Umax=Umax1; GB_Uhavmax=Umax1+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 1;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button881
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      112
L__Umax_button881:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button451
	MOVLW      1
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button882
	MOVLW      128
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button882:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button451
L__Umax_button764:
	MOVLW      40
	MOVWF      _GB_Umax+0
	MOVLW      10
	MOVWF      _GB_Umax+1
	MOVLW      84
	MOVWF      _GB_Uhavmax+0
	MOVLW      11
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      1
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button451:
;GWL_batscan.c,2168 :: 		else if ((temp>0x02E5) && (temp<0x0320)) {GB_Umax=Umax2; GB_Uhavmax=Umax2+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 2;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button883
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      229
L__Umax_button883:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button455
	MOVLW      3
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button884
	MOVLW      32
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button884:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button455
L__Umax_button763:
	MOVLW      140
	MOVWF      _GB_Umax+0
	MOVLW      10
	MOVWF      _GB_Umax+1
	MOVLW      184
	MOVWF      _GB_Uhavmax+0
	MOVLW      11
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      2
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button455:
;GWL_batscan.c,2169 :: 		else if ((temp>0x03F0) && (temp<0x0420)) {GB_Umax=Umax3; GB_Uhavmax=Umax3+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 3;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button885
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      240
L__Umax_button885:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button459
	MOVLW      4
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button886
	MOVLW      32
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button886:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button459
L__Umax_button762:
	MOVLW      240
	MOVWF      _GB_Umax+0
	MOVLW      10
	MOVWF      _GB_Umax+1
	MOVLW      28
	MOVWF      _GB_Uhavmax+0
	MOVLW      12
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      3
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button459:
;GWL_batscan.c,2170 :: 		else if ((temp>0x0570) && (temp<0x05B0)) {GB_Umax=Umax4; GB_Uhavmax=Umax4+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 4;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button887
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      112
L__Umax_button887:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button463
	MOVLW      5
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button888
	MOVLW      176
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button888:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button463
L__Umax_button761:
	MOVLW      172
	MOVWF      _GB_Umax+0
	MOVLW      13
	MOVWF      _GB_Umax+1
	MOVLW      216
	MOVWF      _GB_Uhavmax+0
	MOVLW      14
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      4
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button463:
;GWL_batscan.c,2171 :: 		else if ((temp>0x0640) && (temp<0x0680)) {GB_Umax=Umax5; GB_Uhavmax=Umax5+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 5;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button889
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      64
L__Umax_button889:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button467
	MOVLW      6
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button890
	MOVLW      128
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button890:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button467
L__Umax_button760:
	MOVLW      16
	MOVWF      _GB_Umax+0
	MOVLW      14
	MOVWF      _GB_Umax+1
	MOVLW      60
	MOVWF      _GB_Uhavmax+0
	MOVLW      15
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      5
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button467:
;GWL_batscan.c,2172 :: 		else if ((temp>0x0710) && (temp<0x0740)) {GB_Umax=Umax6; GB_Uhavmax=Umax6+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 6;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button891
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      16
L__Umax_button891:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button471
	MOVLW      7
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button892
	MOVLW      64
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button892:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button471
L__Umax_button759:
	MOVLW      116
	MOVWF      _GB_Umax+0
	MOVLW      14
	MOVWF      _GB_Umax+1
	MOVLW      160
	MOVWF      _GB_Uhavmax+0
	MOVLW      15
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      6
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button471:
;GWL_batscan.c,2173 :: 		else if ((temp>0x07B0) && (temp<0x07DA)) {GB_Umax=Umax7; GB_Uhavmax=Umax7+Uhavmaxdiff; MISSEDBUTTONFLAG=0; return 7;}
	MOVF       Umax_button_temp_L0+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button893
	MOVF       Umax_button_temp_L0+0, 0
	SUBLW      176
L__Umax_button893:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button475
	MOVLW      7
	SUBWF      Umax_button_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Umax_button894
	MOVLW      218
	SUBWF      Umax_button_temp_L0+0, 0
L__Umax_button894:
	BTFSC      STATUS+0, 0
	GOTO       L_Umax_button475
L__Umax_button758:
	MOVLW      216
	MOVWF      _GB_Umax+0
	MOVLW      14
	MOVWF      _GB_Umax+1
	MOVLW      4
	MOVWF      _GB_Uhavmax+0
	MOVLW      16
	MOVWF      _GB_Uhavmax+1
	CLRF       _MISSEDBUTTONFLAG+0
	MOVLW      7
	MOVWF      R0
	GOTO       L_end_Umax_button
L_Umax_button475:
;GWL_batscan.c,2175 :: 		MISSEDBUTTONFLAG=1;
	MOVLW      1
	MOVWF      _MISSEDBUTTONFLAG+0
;GWL_batscan.c,2176 :: 		debug_print_str("\r\nUMAXBUTERR:");
	MOVLW      ?lstr18_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr18_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2177 :: 		debug_print_hex_u16(temp);
	MOVF       Umax_button_temp_L0+0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       Umax_button_temp_L0+1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,2183 :: 		}
L_end_Umax_button:
	RETURN
; end of _Umax_button

_init_adc:

;GWL_batscan.c,2185 :: 		void init_adc()
;GWL_batscan.c,2187 :: 		PMD2=0xFF;
	MOVLW      255
	MOVWF      PMD2+0
;GWL_batscan.c,2188 :: 		PMD2.ADCMD=0;
	BCF        PMD2+0, 5
;GWL_batscan.c,2189 :: 		PMD3=0xFF;
	MOVLW      255
	MOVWF      PMD3+0
;GWL_batscan.c,2190 :: 		PMD1=0xFF;
	MOVLW      255
	MOVWF      PMD1+0
;GWL_batscan.c,2191 :: 		PMD4=0xFF;
	MOVLW      255
	MOVWF      PMD4+0
;GWL_batscan.c,2192 :: 		PMD5=0xFF;
	MOVLW      255
	MOVWF      PMD5+0
;GWL_batscan.c,2193 :: 		ANSELF=0x03;
	MOVLW      3
	MOVWF      ANSELF+0
;GWL_batscan.c,2194 :: 		ANSELG=0x80;
	MOVLW      128
	MOVWF      ANSELG+0
;GWL_batscan.c,2195 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;GWL_batscan.c,2196 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;GWL_batscan.c,2197 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;GWL_batscan.c,2198 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;GWL_batscan.c,2199 :: 		VOLTAGEPIN_IN();
	BSF        TRISF0_bit+0, BitPos(TRISF0_bit+0)
;GWL_batscan.c,2200 :: 		UMINPIN_IN();
	BSF        TRISG7_bit+0, BitPos(TRISG7_bit+0)
;GWL_batscan.c,2201 :: 		UMAXPIN_IN();
	BSF        TRISF1_bit+0, BitPos(TRISF1_bit+0)
;GWL_batscan.c,2202 :: 		ADRESH = 0x00;
	CLRF       ADRESH+0
;GWL_batscan.c,2203 :: 		ADRESL = 0x00;
	CLRF       ADRESL+0
;GWL_batscan.c,2204 :: 		ADCLK = 0x07;
	MOVLW      7
	MOVWF      ADCLK+0
;GWL_batscan.c,2206 :: 		ADCAP = 0x0F;
	MOVLW      15
	MOVWF      ADCAP+0
;GWL_batscan.c,2207 :: 		ADLTHL = 0x00;
	CLRF       ADLTHL+0
;GWL_batscan.c,2208 :: 		ADLTHH = 0x00;
	CLRF       ADLTHH+0
;GWL_batscan.c,2209 :: 		ADUTHL = 0x00;
	CLRF       ADUTHL+0
;GWL_batscan.c,2210 :: 		ADUTHH = 0x00;
	CLRF       ADUTHH+0
;GWL_batscan.c,2211 :: 		ADSTPTL = 0x00;
	CLRF       ADSTPTL+0
;GWL_batscan.c,2212 :: 		ADSTPTH = 0x00;
	CLRF       ADSTPTH+0
;GWL_batscan.c,2213 :: 		ADCON1 = 0x00;
	CLRF       ADCON1+0
;GWL_batscan.c,2214 :: 		ADCON2 = 0x00;
	CLRF       ADCON2+0
;GWL_batscan.c,2216 :: 		ADCON3 = 0x0F;
	MOVLW      15
	MOVWF      ADCON3+0
;GWL_batscan.c,2217 :: 		ADCON0 = 0xC4;
	MOVLW      196
	MOVWF      ADCON0+0
;GWL_batscan.c,2219 :: 		ADPREH=0x00;
	CLRF       ADPREH+0
;GWL_batscan.c,2220 :: 		ADPREL=0x00;
	CLRF       ADPREL+0
;GWL_batscan.c,2221 :: 		ADACQH=0x00;
	CLRF       ADACQH+0
;GWL_batscan.c,2222 :: 		ADACQL=0x00;
	CLRF       ADACQL+0
;GWL_batscan.c,2223 :: 		ADREF = 0x02;
	MOVLW      2
	MOVWF      ADREF+0
;GWL_batscan.c,2224 :: 		ANSELA.ANSA3=1;
	BSF        ANSELA+0, 3
;GWL_batscan.c,2229 :: 		}
L_end_init_adc:
	RETURN
; end of _init_adc

_push_poll:

;GWL_batscan.c,2240 :: 		void push_poll()
;GWL_batscan.c,2247 :: 		if (!PUSH) {
	BTFSC      PORTC+0, 5
	GOTO       L_push_poll477
;GWL_batscan.c,2248 :: 		if (pushf==0)   {
	MOVF       _pushf+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_push_poll478
;GWL_batscan.c,2249 :: 		pushf=1;
	MOVLW      1
	MOVWF      _pushf+0
;GWL_batscan.c,2250 :: 		pushtime=timeticks;
	MOVF       _timeticks+0, 0
	MOVWF      _pushtime+0
	MOVF       _timeticks+1, 0
	MOVWF      _pushtime+1
	MOVF       _timeticks+2, 0
	MOVWF      _pushtime+2
	MOVF       _timeticks+3, 0
	MOVWF      _pushtime+3
;GWL_batscan.c,2251 :: 		debug_print_strROM("\r\nPUSH1");
	MOVLW      ?lstr_19_GWL_batscan+0
	MOVWF      FARG_debug_print_strROM_s+0
	MOVLW      hi_addr(?lstr_19_GWL_batscan+0)
	MOVWF      FARG_debug_print_strROM_s+1
	CALL       _debug_print_strROM+0
;GWL_batscan.c,2252 :: 		}
L_push_poll478:
;GWL_batscan.c,2253 :: 		}
L_push_poll477:
;GWL_batscan.c,2254 :: 		if (pushf==1) {
	MOVF       _pushf+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_push_poll479
;GWL_batscan.c,2256 :: 		if (timeticks>(pushtime+20)) {
	MOVLW      20
	ADDWF      _pushtime+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     _pushtime+1, 0
	MOVWF      R2
	MOVLW      0
	ADDWFC     _pushtime+2, 0
	MOVWF      R3
	MOVLW      0
	ADDWFC     _pushtime+3, 0
	MOVWF      R4
	MOVF       _timeticks+3, 0
	SUBWF      R4, 0
	BTFSS      STATUS+0, 2
	GOTO       L__push_poll897
	MOVF       _timeticks+2, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__push_poll897
	MOVF       _timeticks+1, 0
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__push_poll897
	MOVF       _timeticks+0, 0
	SUBWF      R1, 0
L__push_poll897:
	BTFSC      STATUS+0, 0
	GOTO       L_push_poll480
;GWL_batscan.c,2257 :: 		debug_print_strROM("\r\nVYPINAME!");
	MOVLW      ?lstr_20_GWL_batscan+0
	MOVWF      FARG_debug_print_strROM_s+0
	MOVLW      hi_addr(?lstr_20_GWL_batscan+0)
	MOVWF      FARG_debug_print_strROM_s+1
	CALL       _debug_print_strROM+0
;GWL_batscan.c,2258 :: 		TOFFFLAG=1;
	MOVLW      1
	MOVWF      _TOFFFLAG+0
;GWL_batscan.c,2259 :: 		Discontime=timeticks+5;
	MOVLW      5
	ADDWF      _timeticks+0, 0
	MOVWF      _discontime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _discontime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _discontime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _discontime+3
;GWL_batscan.c,2260 :: 		init_LED();
	CALL       _init_LED+0
;GWL_batscan.c,2261 :: 		pushf=2;
	MOVLW      2
	MOVWF      _pushf+0
;GWL_batscan.c,2262 :: 		return;
	GOTO       L_end_push_poll
;GWL_batscan.c,2263 :: 		}
L_push_poll480:
;GWL_batscan.c,2264 :: 		}
L_push_poll479:
;GWL_batscan.c,2267 :: 		}
L_end_push_poll:
	RETURN
; end of _push_poll

_delay:

;GWL_batscan.c,2269 :: 		void delay()
;GWL_batscan.c,2271 :: 		for (i=0; i<10; i++)       asm NOP;
	CLRF       R1+0
L_delay481:
	MOVLW      10
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delay482
	NOP
	INCF       R1+0, 1
	GOTO       L_delay481
L_delay482:
;GWL_batscan.c,2273 :: 		}
L_end_delay:
	RETURN
; end of _delay

_dac_i2c1_stop:

;GWL_batscan.c,2275 :: 		void dac_i2c1_stop (void)
;GWL_batscan.c,2278 :: 		DAC1_SDA_TRIS=0;
	BCF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2279 :: 		DAC_SCL_TRIS=0;
	BCF        TRISG6_bit+0, BitPos(TRISG6_bit+0)
;GWL_batscan.c,2281 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2282 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2283 :: 		DAC1_SDA_OUT=0;
	BCF        LATF+0, 3
;GWL_batscan.c,2284 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2285 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2286 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2287 :: 		DAC1_SDA_TRIS=1;
	BSF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2288 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2289 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2290 :: 		}
L_end_dac_i2c1_stop:
	RETURN
; end of _dac_i2c1_stop

_dac_i2c1_start:

;GWL_batscan.c,2293 :: 		void dac_i2c1_start(void)
;GWL_batscan.c,2295 :: 		DAC_SCL_TRIS=0;
	BCF        TRISG6_bit+0, BitPos(TRISG6_bit+0)
;GWL_batscan.c,2296 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2297 :: 		DAC1_SDA_TRIS=0;
	BCF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2298 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2299 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2300 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2301 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2302 :: 		DAC1_SDA_OUT=0;
	BCF        LATF+0, 3
;GWL_batscan.c,2303 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2304 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2305 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2307 :: 		}
L_end_dac_i2c1_start:
	RETURN
; end of _dac_i2c1_start

_dac_i2c1_write:

;GWL_batscan.c,2310 :: 		void dac_i2c1_write(u8_t o_byte)
;GWL_batscan.c,2313 :: 		for(n=0; n<8; n++)
	CLRF       dac_i2c1_write_n_L0+0
L_dac_i2c1_write484:
	MOVLW      8
	SUBWF      dac_i2c1_write_n_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_dac_i2c1_write485
;GWL_batscan.c,2314 :: 		{  DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2315 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2316 :: 		if(o_byte&0x80)
	BTFSS      FARG_dac_i2c1_write_o_byte+0, 7
	GOTO       L_dac_i2c1_write487
;GWL_batscan.c,2318 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2319 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2320 :: 		}
	GOTO       L_dac_i2c1_write488
L_dac_i2c1_write487:
;GWL_batscan.c,2323 :: 		DAC1_SDA_OUT=0;
	BCF        LATF+0, 3
;GWL_batscan.c,2324 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2325 :: 		}
L_dac_i2c1_write488:
;GWL_batscan.c,2326 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2327 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2328 :: 		o_byte = o_byte << 1;
	LSLF       FARG_dac_i2c1_write_o_byte+0, 1
;GWL_batscan.c,2329 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2313 :: 		for(n=0; n<8; n++)
	INCF       dac_i2c1_write_n_L0+0, 1
;GWL_batscan.c,2331 :: 		}
	GOTO       L_dac_i2c1_write484
L_dac_i2c1_write485:
;GWL_batscan.c,2332 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2333 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2334 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2335 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2336 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2337 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2338 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2339 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2341 :: 		}
L_end_dac_i2c1_write:
	RETURN
; end of _dac_i2c1_write

_dac_i2c1_nack:

;GWL_batscan.c,2343 :: 		void dac_i2c1_nack(void)
;GWL_batscan.c,2345 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2346 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2347 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2348 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2349 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2350 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2351 :: 		}
L_end_dac_i2c1_nack:
	RETURN
; end of _dac_i2c1_nack

_dac_i2c1_ack:

;GWL_batscan.c,2353 :: 		void dac_i2c1_ack(void)
;GWL_batscan.c,2354 :: 		{   DAC1_SDA_OUT=0;
	BCF        LATF+0, 3
;GWL_batscan.c,2355 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2356 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2357 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2358 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2359 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2360 :: 		}
L_end_dac_i2c1_ack:
	RETURN
; end of _dac_i2c1_ack

_dac_i2c1_read:

;GWL_batscan.c,2363 :: 		u8_t dac_i2c1_read()
;GWL_batscan.c,2365 :: 		u8_t i_byte=0, n;
	CLRF       dac_i2c1_read_i_byte_L0+0
;GWL_batscan.c,2366 :: 		DAC1_SDA_TRIS=1;
	BSF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2368 :: 		WPUF.WPUF3=1;
	BSF        WPUF+0, 3
;GWL_batscan.c,2369 :: 		for (n=0; n<8; n++)
	CLRF       dac_i2c1_read_n_L0+0
L_dac_i2c1_read489:
	MOVLW      8
	SUBWF      dac_i2c1_read_n_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_dac_i2c1_read490
;GWL_batscan.c,2370 :: 		{  i_byte<<=1;
	LSLF       dac_i2c1_read_i_byte_L0+0, 1
;GWL_batscan.c,2371 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2372 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2373 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2374 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2375 :: 		if (DAC1_SDA_IN) i_byte |=0x01;
	BTFSS      PORTF+0, 3
	GOTO       L_dac_i2c1_read492
	BSF        dac_i2c1_read_i_byte_L0+0, 0
L_dac_i2c1_read492:
;GWL_batscan.c,2376 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2377 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2378 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2369 :: 		for (n=0; n<8; n++)
	INCF       dac_i2c1_read_n_L0+0, 1
;GWL_batscan.c,2379 :: 		}
	GOTO       L_dac_i2c1_read489
L_dac_i2c1_read490:
;GWL_batscan.c,2380 :: 		DAC1_SDA_TRIS=0;
	BCF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2382 :: 		WPUF.WPUF3=0;
	BCF        WPUF+0, 3
;GWL_batscan.c,2383 :: 		return(i_byte);
	MOVF       dac_i2c1_read_i_byte_L0+0, 0
	MOVWF      R0
;GWL_batscan.c,2384 :: 		}
L_end_dac_i2c1_read:
	RETURN
; end of _dac_i2c1_read

_dac_i2c2_stop:

;GWL_batscan.c,2386 :: 		void dac_i2c2_stop (void)
;GWL_batscan.c,2389 :: 		DAC2_SDA_TRIS=0;
	BCF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2390 :: 		DAC_SCL_TRIS=0;
	BCF        TRISG6_bit+0, BitPos(TRISG6_bit+0)
;GWL_batscan.c,2392 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2393 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2394 :: 		DAC2_SDA_OUT=0;
	BCF        LATF+0, 2
;GWL_batscan.c,2395 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2396 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2397 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2398 :: 		DAC2_SDA_TRIS=1;
	BSF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2399 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2400 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2401 :: 		}
L_end_dac_i2c2_stop:
	RETURN
; end of _dac_i2c2_stop

_dac_i2c2_start:

;GWL_batscan.c,2404 :: 		void dac_i2c2_start(void)
;GWL_batscan.c,2406 :: 		DAC_SCL_TRIS=0;
	BCF        TRISG6_bit+0, BitPos(TRISG6_bit+0)
;GWL_batscan.c,2407 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2408 :: 		DAC2_SDA_TRIS=0;
	BCF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2409 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2410 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2411 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2412 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2413 :: 		DAC2_SDA_OUT=0;
	BCF        LATF+0, 2
;GWL_batscan.c,2414 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2415 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2416 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2418 :: 		}
L_end_dac_i2c2_start:
	RETURN
; end of _dac_i2c2_start

_dac_i2c2_write:

;GWL_batscan.c,2421 :: 		void dac_i2c2_write(u8_t o_byte)
;GWL_batscan.c,2424 :: 		for(n=0; n<8; n++)
	CLRF       dac_i2c2_write_n_L0+0
L_dac_i2c2_write493:
	MOVLW      8
	SUBWF      dac_i2c2_write_n_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_dac_i2c2_write494
;GWL_batscan.c,2425 :: 		{  DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2426 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2427 :: 		if(o_byte&0x80)
	BTFSS      FARG_dac_i2c2_write_o_byte+0, 7
	GOTO       L_dac_i2c2_write496
;GWL_batscan.c,2429 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2430 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2431 :: 		}
	GOTO       L_dac_i2c2_write497
L_dac_i2c2_write496:
;GWL_batscan.c,2434 :: 		DAC2_SDA_OUT=0;
	BCF        LATF+0, 2
;GWL_batscan.c,2435 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2436 :: 		}
L_dac_i2c2_write497:
;GWL_batscan.c,2437 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2438 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2439 :: 		o_byte = o_byte << 1;
	LSLF       FARG_dac_i2c2_write_o_byte+0, 1
;GWL_batscan.c,2440 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2424 :: 		for(n=0; n<8; n++)
	INCF       dac_i2c2_write_n_L0+0, 1
;GWL_batscan.c,2442 :: 		}
	GOTO       L_dac_i2c2_write493
L_dac_i2c2_write494:
;GWL_batscan.c,2444 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2445 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2446 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2447 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2448 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2449 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2450 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2451 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2453 :: 		}
L_end_dac_i2c2_write:
	RETURN
; end of _dac_i2c2_write

_dac_i2c2_nack:

;GWL_batscan.c,2455 :: 		void dac_i2c2_nack(void)
;GWL_batscan.c,2457 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2458 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2459 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2460 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2461 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2462 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2463 :: 		}
L_end_dac_i2c2_nack:
	RETURN
; end of _dac_i2c2_nack

_dac_i2c2_ack:

;GWL_batscan.c,2465 :: 		void dac_i2c2_ack(void)
;GWL_batscan.c,2466 :: 		{   DAC2_SDA_OUT=0;
	BCF        LATF+0, 2
;GWL_batscan.c,2467 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2468 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2469 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2470 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2471 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2472 :: 		}
L_end_dac_i2c2_ack:
	RETURN
; end of _dac_i2c2_ack

_dac_i2c2_read:

;GWL_batscan.c,2475 :: 		u8_t dac_i2c2_read()
;GWL_batscan.c,2477 :: 		u8_t i_byte=0, n;
	CLRF       dac_i2c2_read_i_byte_L0+0
;GWL_batscan.c,2478 :: 		DAC2_SDA_TRIS=1;
	BSF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2480 :: 		WPUF.WPUF2=1;
	BSF        WPUF+0, 2
;GWL_batscan.c,2481 :: 		for (n=0; n<8; n++)
	CLRF       dac_i2c2_read_n_L0+0
L_dac_i2c2_read498:
	MOVLW      8
	SUBWF      dac_i2c2_read_n_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_dac_i2c2_read499
;GWL_batscan.c,2482 :: 		{  i_byte<<=1;
	LSLF       dac_i2c2_read_i_byte_L0+0, 1
;GWL_batscan.c,2483 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2484 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2486 :: 		DAC_SCL=1;
	BSF        LATG+0, 6
;GWL_batscan.c,2487 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2488 :: 		if (DAC2_SDA_IN) i_byte |=0x01;
	BTFSS      PORTF+0, 2
	GOTO       L_dac_i2c2_read501
	BSF        dac_i2c2_read_i_byte_L0+0, 0
L_dac_i2c2_read501:
;GWL_batscan.c,2489 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2490 :: 		DAC_SCL=0;
	BCF        LATG+0, 6
;GWL_batscan.c,2491 :: 		delay();
	CALL       _delay+0
;GWL_batscan.c,2481 :: 		for (n=0; n<8; n++)
	INCF       dac_i2c2_read_n_L0+0, 1
;GWL_batscan.c,2492 :: 		}
	GOTO       L_dac_i2c2_read498
L_dac_i2c2_read499:
;GWL_batscan.c,2493 :: 		DAC2_SDA_TRIS=0;
	BCF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2495 :: 		WPUF.WPUF2=0;
	BCF        WPUF+0, 2
;GWL_batscan.c,2496 :: 		return(i_byte);
	MOVF       dac_i2c2_read_i_byte_L0+0, 0
	MOVWF      R0
;GWL_batscan.c,2497 :: 		}
L_end_dac_i2c2_read:
	RETURN
; end of _dac_i2c2_read

_write_DAC1_configreg:

;GWL_batscan.c,2502 :: 		void write_DAC1_configreg(u8_t cmnd)
;GWL_batscan.c,2504 :: 		dac_i2c1_start();
	CALL       _dac_i2c1_start+0
;GWL_batscan.c,2505 :: 		dac_i2c1_write(MCP47X6_DEFAULT_ADDRESS);
	MOVLW      192
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2506 :: 		dac_i2c1_write(cmnd  | MCP47X6_CMD_VOLALL );
	MOVLW      64
	IORWF       FARG_write_DAC1_configreg_cmnd+0, 0
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2507 :: 		dac_i2c1_stop();
	CALL       _dac_i2c1_stop+0
;GWL_batscan.c,2508 :: 		}
L_end_write_DAC1_configreg:
	RETURN
; end of _write_DAC1_configreg

_write_DAC2_configreg:

;GWL_batscan.c,2510 :: 		void write_DAC2_configreg(u8_t cmnd)
;GWL_batscan.c,2512 :: 		dac_i2c2_start();
	CALL       _dac_i2c2_start+0
;GWL_batscan.c,2513 :: 		dac_i2c2_write(MCP47X6_DEFAULT_ADDRESS);
	MOVLW      192
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2514 :: 		dac_i2c2_write(cmnd  | MCP47X6_CMD_VOLALL );
	MOVLW      64
	IORWF       FARG_write_DAC2_configreg_cmnd+0, 0
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2515 :: 		dac_i2c2_stop();
	CALL       _dac_i2c2_stop+0
;GWL_batscan.c,2516 :: 		}
L_end_write_DAC2_configreg:
	RETURN
; end of _write_DAC2_configreg

_DAC1_powerdown:

;GWL_batscan.c,2518 :: 		void DAC1_powerdown(u8_t  pdOutR)
;GWL_batscan.c,2520 :: 		write_DAC1_configreg((pdOutR & MCP47X6_PWRDN_MASK) | (pdOutR & !MCP47X6_PWRDN_MASK));
	MOVLW      249
	ANDWF      FARG_DAC1_powerdown_pdOutR+0, 0
	MOVWF      FARG_write_DAC1_configreg_cmnd+0
	MOVLW      0
	ANDWF      FARG_DAC1_powerdown_pdOutR+0, 0
	MOVWF      R0
	MOVF       R0, 0
	IORWF       FARG_write_DAC1_configreg_cmnd+0, 1
	CALL       _write_DAC1_configreg+0
;GWL_batscan.c,2521 :: 		}
L_end_DAC1_powerdown:
	RETURN
; end of _DAC1_powerdown

_DAC1_setoutputlevel:

;GWL_batscan.c,2523 :: 		void DAC1_setoutputlevel(u16_t  level)
;GWL_batscan.c,2525 :: 		if (level>0x1000) level=0x0FFF;
	MOVF       FARG_DAC1_setoutputlevel_level+1, 0
	SUBLW      16
	BTFSS      STATUS+0, 2
	GOTO       L__DAC1_setoutputlevel915
	MOVF       FARG_DAC1_setoutputlevel_level+0, 0
	SUBLW      0
L__DAC1_setoutputlevel915:
	BTFSC      STATUS+0, 0
	GOTO       L_DAC1_setoutputlevel502
	MOVLW      255
	MOVWF      FARG_DAC1_setoutputlevel_level+0
	MOVLW      15
	MOVWF      FARG_DAC1_setoutputlevel_level+1
L_DAC1_setoutputlevel502:
;GWL_batscan.c,2526 :: 		dac_i2c1_start();
	CALL       _dac_i2c1_start+0
;GWL_batscan.c,2527 :: 		dac_i2c1_write(MCP47X6_DEFAULT_ADDRESS);
	MOVLW      192
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2528 :: 		dac_i2c1_write(DAC1config);
	MOVF       _DAC1config+0, 0
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2529 :: 		dac_i2c1_write((u8_t) ((level>>4) & 0xFF));
	MOVF       FARG_DAC1_setoutputlevel_level+0, 0
	MOVWF      R0
	MOVF       FARG_DAC1_setoutputlevel_level+1, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2530 :: 		dac_i2c1_write((u8_t) ((level<<4) & 0xF0));
	MOVLW      4
	MOVWF      R0
	MOVF       FARG_DAC1_setoutputlevel_level+0, 0
	MOVWF      FARG_dac_i2c1_write_o_byte+0
	MOVF       R0, 0
L__DAC1_setoutputlevel916:
	BTFSC      STATUS+0, 2
	GOTO       L__DAC1_setoutputlevel917
	LSLF       FARG_dac_i2c1_write_o_byte+0, 1
	ADDLW      255
	GOTO       L__DAC1_setoutputlevel916
L__DAC1_setoutputlevel917:
	MOVLW      240
	ANDWF      FARG_dac_i2c1_write_o_byte+0, 1
	CALL       _dac_i2c1_write+0
;GWL_batscan.c,2531 :: 		dac_i2c1_stop();
	CALL       _dac_i2c1_stop+0
;GWL_batscan.c,2532 :: 		DAC1_SDA_OUT=1;
	BSF        LATF+0, 3
;GWL_batscan.c,2533 :: 		WPUF.WPUF3=1;
	BSF        WPUF+0, 3
;GWL_batscan.c,2534 :: 		DAC1_SDA_TRIS=1;
	BSF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2535 :: 		}
L_end_DAC1_setoutputlevel:
	RETURN
; end of _DAC1_setoutputlevel

_DAC2_setoutputlevel:

;GWL_batscan.c,2536 :: 		void DAC2_setoutputlevel(u16_t  level)
;GWL_batscan.c,2538 :: 		if (level>0x1000) level=0x0FFF;
	MOVF       FARG_DAC2_setoutputlevel_level+1, 0
	SUBLW      16
	BTFSS      STATUS+0, 2
	GOTO       L__DAC2_setoutputlevel919
	MOVF       FARG_DAC2_setoutputlevel_level+0, 0
	SUBLW      0
L__DAC2_setoutputlevel919:
	BTFSC      STATUS+0, 0
	GOTO       L_DAC2_setoutputlevel503
	MOVLW      255
	MOVWF      FARG_DAC2_setoutputlevel_level+0
	MOVLW      15
	MOVWF      FARG_DAC2_setoutputlevel_level+1
L_DAC2_setoutputlevel503:
;GWL_batscan.c,2539 :: 		dac_i2c2_start();
	CALL       _dac_i2c2_start+0
;GWL_batscan.c,2540 :: 		dac_i2c2_write(MCP47X6_DEFAULT_ADDRESS);
	MOVLW      192
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2541 :: 		dac_i2c2_write(DAC2config);
	MOVF       _DAC2config+0, 0
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2542 :: 		dac_i2c2_write((u8_t) ((level>>4) & 0xFF));
	MOVF       FARG_DAC2_setoutputlevel_level+0, 0
	MOVWF      R0
	MOVF       FARG_DAC2_setoutputlevel_level+1, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2543 :: 		dac_i2c2_write((u8_t) ((level<<4) & 0xF0));
	MOVLW      4
	MOVWF      R0
	MOVF       FARG_DAC2_setoutputlevel_level+0, 0
	MOVWF      FARG_dac_i2c2_write_o_byte+0
	MOVF       R0, 0
L__DAC2_setoutputlevel920:
	BTFSC      STATUS+0, 2
	GOTO       L__DAC2_setoutputlevel921
	LSLF       FARG_dac_i2c2_write_o_byte+0, 1
	ADDLW      255
	GOTO       L__DAC2_setoutputlevel920
L__DAC2_setoutputlevel921:
	MOVLW      240
	ANDWF      FARG_dac_i2c2_write_o_byte+0, 1
	CALL       _dac_i2c2_write+0
;GWL_batscan.c,2544 :: 		dac_i2c2_stop();
	CALL       _dac_i2c2_stop+0
;GWL_batscan.c,2545 :: 		DAC2_SDA_OUT=1;
	BSF        LATF+0, 2
;GWL_batscan.c,2546 :: 		WPUF.WPUF2=1;
	BSF        WPUF+0, 2
;GWL_batscan.c,2547 :: 		DAC2_SDA_TRIS=1;
	BSF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2549 :: 		}
L_end_DAC2_setoutputlevel:
	RETURN
; end of _DAC2_setoutputlevel

_DACs_init:

;GWL_batscan.c,2555 :: 		void DACs_init()
;GWL_batscan.c,2558 :: 		DAC_SCL_TRIS=0;
	BCF        TRISG6_bit+0, BitPos(TRISG6_bit+0)
;GWL_batscan.c,2559 :: 		DAC1_SDA_TRIS=0;
	BCF        TRISF3_bit+0, BitPos(TRISF3_bit+0)
;GWL_batscan.c,2560 :: 		DAC2_SDA_TRIS=0;
	BCF        TRISF2_bit+0, BitPos(TRISF2_bit+0)
;GWL_batscan.c,2562 :: 		DAC1config=0;
	CLRF       _DAC1config+0
;GWL_batscan.c,2563 :: 		DAC2config=0;
	CLRF       _DAC2config+0
;GWL_batscan.c,2565 :: 		DAC1config=MCP47X6_CMD_VOLALL| MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED |MCP47X6_GAIN_1X ;
	MOVLW      88
	MOVWF      _DAC1config+0
;GWL_batscan.c,2566 :: 		DAC1_setoutputlevel(0);
	CLRF       FARG_DAC1_setoutputlevel_level+0
	CLRF       FARG_DAC1_setoutputlevel_level+1
	CALL       _DAC1_setoutputlevel+0
;GWL_batscan.c,2569 :: 		DAC2config=MCP47X6_CMD_VOLALL| MCP47X6_AWAKE | MCP47X6_VREF_VREFPIN_BUFFERED |MCP47X6_GAIN_1X ;
	MOVLW      88
	MOVWF      _DAC2config+0
;GWL_batscan.c,2570 :: 		DAC2_setoutputlevel(0x7ff);
	MOVLW      255
	MOVWF      FARG_DAC2_setoutputlevel_level+0
	MOVLW      7
	MOVWF      FARG_DAC2_setoutputlevel_level+1
	CALL       _DAC2_setoutputlevel+0
;GWL_batscan.c,2574 :: 		}
L_end_DACs_init:
	RETURN
; end of _DACs_init

_DAC_poll:

;GWL_batscan.c,2576 :: 		void DAC_poll()
;GWL_batscan.c,2580 :: 		min=0x0FFF;
	MOVLW      255
	MOVWF      DAC_poll_min_L0+0
	MOVLW      15
	MOVWF      DAC_poll_min_L0+1
;GWL_batscan.c,2581 :: 		max=0;
	CLRF       DAC_poll_max_L0+0
	CLRF       DAC_poll_max_L0+1
;GWL_batscan.c,2585 :: 		for (i=0; i<Missed_cell_ID; i++) {
	CLRF       DAC_poll_i_L0+0
L_DAC_poll504:
	MOVF       _Missed_cell_ID+0, 0
	SUBWF      DAC_poll_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_DAC_poll505
;GWL_batscan.c,2588 :: 		if (CHN_voltage[i]>LIMITVOLTAGE) {
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__DAC_poll924
	MOVF       R1, 0
	SUBLW      250
L__DAC_poll924:
	BTFSC      STATUS+0, 0
	GOTO       L_DAC_poll507
;GWL_batscan.c,2590 :: 		if (CHN_voltage[i]>max) {max=CHN_voltage[i]; GBmaxid=i;}
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBWF      DAC_poll_max_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DAC_poll925
	MOVF       R1, 0
	SUBWF      DAC_poll_max_L0+0, 0
L__DAC_poll925:
	BTFSC      STATUS+0, 0
	GOTO       L_DAC_poll508
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      DAC_poll_max_L0+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      DAC_poll_max_L0+1
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      _GBmaxid+0
L_DAC_poll508:
;GWL_batscan.c,2591 :: 		if (CHN_voltage[i]<min) {min=CHN_voltage[i]; GBminid=i; }
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       DAC_poll_min_L0+1, 0
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DAC_poll926
	MOVF       DAC_poll_min_L0+0, 0
	SUBWF      R1, 0
L__DAC_poll926:
	BTFSC      STATUS+0, 0
	GOTO       L_DAC_poll509
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      DAC_poll_min_L0+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      DAC_poll_min_L0+1
	MOVF       DAC_poll_i_L0+0, 0
	MOVWF      _GBminid+0
L_DAC_poll509:
;GWL_batscan.c,2592 :: 		}
L_DAC_poll507:
;GWL_batscan.c,2585 :: 		for (i=0; i<Missed_cell_ID; i++) {
	INCF       DAC_poll_i_L0+0, 1
;GWL_batscan.c,2593 :: 		}
	GOTO       L_DAC_poll504
L_DAC_poll505:
;GWL_batscan.c,2594 :: 		if (min==0x0FFF) min=0;
	MOVF       DAC_poll_min_L0+1, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L__DAC_poll927
	MOVLW      255
	XORWF      DAC_poll_min_L0+0, 0
L__DAC_poll927:
	BTFSS      STATUS+0, 2
	GOTO       L_DAC_poll510
	CLRF       DAC_poll_min_L0+0
	CLRF       DAC_poll_min_L0+1
L_DAC_poll510:
;GWL_batscan.c,2596 :: 		GBCELLUmax=max;
	MOVF       DAC_poll_max_L0+0, 0
	MOVWF      _GBCELLUmax+0
	MOVF       DAC_poll_max_L0+1, 0
	MOVWF      _GBCELLUmax+1
;GWL_batscan.c,2597 :: 		GBCELLUmin=min;
	MOVF       DAC_poll_min_L0+0, 0
	MOVWF      _GBCELLUmin+0
	MOVF       DAC_poll_min_L0+1, 0
	MOVWF      _GBCELLUmin+1
;GWL_batscan.c,2598 :: 		DAC1_setoutputlevel(min);
	MOVF       DAC_poll_min_L0+0, 0
	MOVWF      FARG_DAC1_setoutputlevel_level+0
	MOVF       DAC_poll_min_L0+1, 0
	MOVWF      FARG_DAC1_setoutputlevel_level+1
	CALL       _DAC1_setoutputlevel+0
;GWL_batscan.c,2599 :: 		DAC2_setoutputlevel(max);
	MOVF       DAC_poll_max_L0+0, 0
	MOVWF      FARG_DAC2_setoutputlevel_level+0
	MOVF       DAC_poll_max_L0+1, 0
	MOVWF      FARG_DAC2_setoutputlevel_level+1
	CALL       _DAC2_setoutputlevel+0
;GWL_batscan.c,2600 :: 		}
L_end_DAC_poll:
	RETURN
; end of _DAC_poll

_init_outputstatus:

;GWL_batscan.c,2603 :: 		void init_outputstatus()
;GWL_batscan.c,2605 :: 		UminOKstatus=CELLNA;
	MOVLW      255
	MOVWF      _UminOKstatus+0
;GWL_batscan.c,2606 :: 		UmaxOKstatus=CELLNA;
	MOVLW      255
	MOVWF      _UmaxOKstatus+0
;GWL_batscan.c,2608 :: 		UhavOKstatus=CELLUHAVFAIL;
	CLRF       _UhavOKstatus+0
;GWL_batscan.c,2609 :: 		GBUminEvent=1;
	MOVLW      1
	MOVWF      _GBUminEvent+0
;GWL_batscan.c,2610 :: 		GBUmaxEvent=1;
	MOVLW      1
	MOVWF      _GBUmaxEvent+0
;GWL_batscan.c,2611 :: 		DISCflag=0;
	CLRF       _DISCflag+0
;GWL_batscan.c,2613 :: 		GBUminBlockLR=1;
	MOVLW      1
	MOVWF      _GBUminBlockLR+0
;GWL_batscan.c,2614 :: 		GBUminBlock=1;
	MOVLW      1
	MOVWF      _GBUminBlock+0
;GWL_batscan.c,2615 :: 		GBUmaxBlockLR=1;
	MOVLW      1
	MOVWF      _GBUmaxBlockLR+0
;GWL_batscan.c,2616 :: 		GBUmaxBlock=1;
	MOVLW      1
	MOVWF      _GBUmaxBlock+0
;GWL_batscan.c,2617 :: 		GBUhavBlock=1;
	MOVLW      1
	MOVWF      _GBUhavBlock+0
;GWL_batscan.c,2620 :: 		Umin4_relay_event=CELLNA;
	MOVLW      255
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2621 :: 		Umax4_relay_event=CELLNA;
	MOVLW      255
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2625 :: 		}
L_end_init_outputstatus:
	RETURN
; end of _init_outputstatus

_OUTPUT_poll:

;GWL_batscan.c,2632 :: 		void   OUTPUT_poll()
;GWL_batscan.c,2640 :: 		UmaxEvent=0;
	CLRF       OUTPUT_poll_UmaxEvent_L0+0
;GWL_batscan.c,2641 :: 		UminEvent=0;
	CLRF       OUTPUT_poll_UminEvent_L0+0
;GWL_batscan.c,2643 :: 		Umax4Event=0;
	CLRF       OUTPUT_poll_Umax4Event_L0+0
;GWL_batscan.c,2644 :: 		Umin4Event=0;
	CLRF       OUTPUT_poll_Umin4Event_L0+0
;GWL_batscan.c,2649 :: 		DISCflag=0;
	CLRF       _DISCflag+0
;GWL_batscan.c,2653 :: 		for (i=0; i<16; i++) {
	CLRF       OUTPUT_poll_i_L0+0
L_OUTPUT_poll511:
	MOVLW      16
	SUBWF      OUTPUT_poll_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll512
;GWL_batscan.c,2654 :: 		CHN_voltageMINEventTemp[i]=0x00;
	MOVLW      _CHN_voltageMINEventTemp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMINEventTemp+0)
	MOVWF      FSR1H
	MOVF       OUTPUT_poll_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,2655 :: 		CHN_voltageMAXEventTemp[i]=0x00;
	MOVLW      _CHN_voltageMAXEventTemp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMAXEventTemp+0)
	MOVWF      FSR1H
	MOVF       OUTPUT_poll_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,2653 :: 		for (i=0; i<16; i++) {
	INCF       OUTPUT_poll_i_L0+0, 1
;GWL_batscan.c,2657 :: 		}
	GOTO       L_OUTPUT_poll511
L_OUTPUT_poll512:
;GWL_batscan.c,2658 :: 		GBUhavUminident=0;
	CLRF       _GBUhavUminident+0
;GWL_batscan.c,2659 :: 		GBUhavUmaxident=0;
	CLRF       _GBUhavUmaxident+0
;GWL_batscan.c,2664 :: 		totalV=0;
	CLRF       _totalV+0
	CLRF       _totalV+1
;GWL_batscan.c,2666 :: 		for (i=0; i<Missed_cell_ID; i++) {
	CLRF       OUTPUT_poll_i_L0+0
L_OUTPUT_poll514:
	MOVF       _Missed_cell_ID+0, 0
	SUBWF      OUTPUT_poll_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll515
;GWL_batscan.c,2669 :: 		if (CHN_voltage[i]>LIMITVOLTAGE) {
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll930
	MOVF       R1, 0
	SUBLW      250
L__OUTPUT_poll930:
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll517
;GWL_batscan.c,2671 :: 		totalV+= CHN_voltage[i];
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 1
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 1
	MOVF       R0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	ADDWF      _totalV+0, 1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDWFC     _totalV+1, 1
;GWL_batscan.c,2672 :: 		if (CHN_voltage[i]<GB_Uhavmin) {
	MOVF       R0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       _GB_Uhavmin+1, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll931
	MOVF       _GB_Uhavmin+0, 0
	SUBWF      R2, 0
L__OUTPUT_poll931:
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll518
;GWL_batscan.c,2673 :: 		DISCflag=1;
	MOVLW      1
	MOVWF      _DISCflag+0
;GWL_batscan.c,2674 :: 		GBUhavUminident=1;
	MOVLW      1
	MOVWF      _GBUhavUminident+0
;GWL_batscan.c,2675 :: 		debug_print_str("\r\nUHAVMINID!:");
	MOVLW      ?lstr21_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr21_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2676 :: 		debug_print_hex_u8(i);
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2677 :: 		EVENTCELLID=i+1;
	INCF       OUTPUT_poll_i_L0+0, 0
	MOVWF      _EVENTCELLID+0
;GWL_batscan.c,2678 :: 		EVENTCELLTYPE=EVENT_UMINHAV;
	MOVLW      2
	MOVWF      _EVENTCELLTYPE+0
;GWL_batscan.c,2679 :: 		EVENTCELLV=CHN_voltage[i];
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+1
;GWL_batscan.c,2680 :: 		if (EVENTTOTALflag) {
	MOVF       _EVENTTOTALflag+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll519
;GWL_batscan.c,2681 :: 		EVENTCELLTOTALV=EVENTTOTALV;
	MOVF       _EVENTTOTALV+0, 0
	MOVWF      _EVENTCELLTOTALV+0
	MOVF       _EVENTTOTALV+1, 0
	MOVWF      _EVENTCELLTOTALV+1
;GWL_batscan.c,2682 :: 		}
L_OUTPUT_poll519:
;GWL_batscan.c,2684 :: 		}
L_OUTPUT_poll518:
;GWL_batscan.c,2685 :: 		if (CHN_voltage[i]>GB_Uhavmax) {
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBWF      _GB_Uhavmax+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll932
	MOVF       R1, 0
	SUBWF      _GB_Uhavmax+0, 0
L__OUTPUT_poll932:
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll520
;GWL_batscan.c,2686 :: 		DISCflag=1;
	MOVLW      1
	MOVWF      _DISCflag+0
;GWL_batscan.c,2687 :: 		GBUhavUmaxident=1;
	MOVLW      1
	MOVWF      _GBUhavUmaxident+0
;GWL_batscan.c,2688 :: 		EVENTCELLID=i+1;
	INCF       OUTPUT_poll_i_L0+0, 0
	MOVWF      _EVENTCELLID+0
;GWL_batscan.c,2689 :: 		EVENTCELLTYPE=EVENT_UMAXHAV;
	MOVLW      3
	MOVWF      _EVENTCELLTYPE+0
;GWL_batscan.c,2690 :: 		EVENTCELLV=CHN_voltage[i];
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+1
;GWL_batscan.c,2691 :: 		if (EVENTTOTALflag) {
	MOVF       _EVENTTOTALflag+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll521
;GWL_batscan.c,2692 :: 		EVENTCELLTOTALV=EVENTTOTALV;
	MOVF       _EVENTTOTALV+0, 0
	MOVWF      _EVENTCELLTOTALV+0
	MOVF       _EVENTTOTALV+1, 0
	MOVWF      _EVENTCELLTOTALV+1
;GWL_batscan.c,2693 :: 		}
L_OUTPUT_poll521:
;GWL_batscan.c,2695 :: 		}
L_OUTPUT_poll520:
;GWL_batscan.c,2700 :: 		if (GB_Umin!=UminF) {
	MOVF       _GB_Umin+1, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll933
	MOVLW      255
	XORWF      _GB_Umin+0, 0
L__OUTPUT_poll933:
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll522
;GWL_batscan.c,2701 :: 		if  (CHN_voltage[i]<GB_Umin) {
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       _GB_Umin+1, 0
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll934
	MOVF       _GB_Umin+0, 0
	SUBWF      R1, 0
L__OUTPUT_poll934:
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll523
;GWL_batscan.c,2702 :: 		UminEvent=1;
	MOVLW      1
	MOVWF      OUTPUT_poll_UminEvent_L0+0
;GWL_batscan.c,2703 :: 		CHN_voltageMINEventTemp[i]=0x01;
	MOVLW      _CHN_voltageMINEventTemp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMINEventTemp+0)
	MOVWF      FSR1H
	MOVF       OUTPUT_poll_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      1
	MOVWF      INDF1+0
;GWL_batscan.c,2704 :: 		Umin4Event=1;
	MOVLW      1
	MOVWF      OUTPUT_poll_Umin4Event_L0+0
;GWL_batscan.c,2707 :: 		EVENTCELLID=i+1;
	INCF       OUTPUT_poll_i_L0+0, 0
	MOVWF      _EVENTCELLID+0
;GWL_batscan.c,2708 :: 		EVENTCELLTYPE=EVENT_UMIN;
	CLRF       _EVENTCELLTYPE+0
;GWL_batscan.c,2709 :: 		EVENTCELLV=CHN_voltage[i];
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+1
;GWL_batscan.c,2710 :: 		if (EVENTTOTALflag) {
	MOVF       _EVENTTOTALflag+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll524
;GWL_batscan.c,2711 :: 		EVENTCELLTOTALV=EVENTTOTALV;
	MOVF       _EVENTTOTALV+0, 0
	MOVWF      _EVENTCELLTOTALV+0
	MOVF       _EVENTTOTALV+1, 0
	MOVWF      _EVENTCELLTOTALV+1
;GWL_batscan.c,2712 :: 		}
L_OUTPUT_poll524:
;GWL_batscan.c,2714 :: 		}
L_OUTPUT_poll523:
;GWL_batscan.c,2715 :: 		}
L_OUTPUT_poll522:
;GWL_batscan.c,2717 :: 		if (GB_Umax!=UmaxF) {
	MOVF       _GB_Umax+1, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll935
	MOVLW      255
	XORWF      _GB_Umax+0, 0
L__OUTPUT_poll935:
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll525
;GWL_batscan.c,2720 :: 		if  (CHN_voltage[i]>GB_Umax) {
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBWF      _GB_Umax+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll936
	MOVF       R1, 0
	SUBWF      _GB_Umax+0, 0
L__OUTPUT_poll936:
	BTFSC      STATUS+0, 0
	GOTO       L_OUTPUT_poll526
;GWL_batscan.c,2722 :: 		UmaxEvent=1;
	MOVLW      1
	MOVWF      OUTPUT_poll_UmaxEvent_L0+0
;GWL_batscan.c,2723 :: 		EVENTCELLID=i+1;
	INCF       OUTPUT_poll_i_L0+0, 0
	MOVWF      _EVENTCELLID+0
;GWL_batscan.c,2724 :: 		EVENTCELLTYPE=EVENT_UMAX;
	MOVLW      1
	MOVWF      _EVENTCELLTYPE+0
;GWL_batscan.c,2725 :: 		EVENTCELLV=CHN_voltage[i];
	MOVF       OUTPUT_poll_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _EVENTCELLV+1
;GWL_batscan.c,2727 :: 		if (EVENTTOTALflag) {
	MOVF       _EVENTTOTALflag+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OUTPUT_poll527
;GWL_batscan.c,2728 :: 		EVENTCELLTOTALV=EVENTTOTALV;
	MOVF       _EVENTTOTALV+0, 0
	MOVWF      _EVENTCELLTOTALV+0
	MOVF       _EVENTTOTALV+1, 0
	MOVWF      _EVENTCELLTOTALV+1
;GWL_batscan.c,2729 :: 		}
L_OUTPUT_poll527:
;GWL_batscan.c,2732 :: 		CHN_voltageMAXEventTemp[i]=0x01;
	MOVLW      _CHN_voltageMAXEventTemp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMAXEventTemp+0)
	MOVWF      FSR1H
	MOVF       OUTPUT_poll_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      1
	MOVWF      INDF1+0
;GWL_batscan.c,2733 :: 		Umax4Event=1;
	MOVLW      1
	MOVWF      OUTPUT_poll_Umax4Event_L0+0
;GWL_batscan.c,2734 :: 		}
L_OUTPUT_poll526:
;GWL_batscan.c,2737 :: 		}
L_OUTPUT_poll525:
;GWL_batscan.c,2741 :: 		}
L_OUTPUT_poll517:
;GWL_batscan.c,2666 :: 		for (i=0; i<Missed_cell_ID; i++) {
	INCF       OUTPUT_poll_i_L0+0, 1
;GWL_batscan.c,2742 :: 		}
	GOTO       L_OUTPUT_poll514
L_OUTPUT_poll515:
;GWL_batscan.c,2744 :: 		EVENTTOTALV=totalV;
	MOVF       _totalV+0, 0
	MOVWF      _EVENTTOTALV+0
	MOVF       _totalV+1, 0
	MOVWF      _EVENTTOTALV+1
;GWL_batscan.c,2745 :: 		EVENTTOTALflag=1;
	MOVLW      1
	MOVWF      _EVENTTOTALflag+0
;GWL_batscan.c,2747 :: 		if  (DISCflag==1) {
	MOVF       _DISCflag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll528
;GWL_batscan.c,2748 :: 		if ((GBUhavUminident) || (UhavOKstatus==CELLUHAVOK))
	MOVF       _GBUhavUminident+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OUTPUT_poll780
	MOVF       _UhavOKstatus+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll780
	GOTO       L_OUTPUT_poll531
L__OUTPUT_poll780:
;GWL_batscan.c,2750 :: 		debug_print_str("\r\nUHAVFAIL:");
	MOVLW      ?lstr22_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr22_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2751 :: 		debug_print_hex_u8( DISCflag);
	MOVF       _DISCflag+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2752 :: 		debug_print_hex_u8(GBUhavUminident);
	MOVF       _GBUhavUminident+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2753 :: 		debug_print_hex_u8(UhavOKstatus==CELLUHAVOK);
	MOVF       _UhavOKstatus+0, 0
	XORLW      1
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,2755 :: 		UhavOKstatus=CELLUHAVFAIL;
	CLRF       _UhavOKstatus+0
;GWL_batscan.c,2756 :: 		Uhav_ltrelay_event=CELLUHAVFAIL;
	CLRF       _Uhav_ltrelay_event+0
;GWL_batscan.c,2757 :: 		Uhav_ltrelay_delay=timeticks+Uhav_delay_ltrelay_value;
	MOVLW      44
	ADDWF      _timeticks+0, 0
	MOVWF      _Uhav_ltrelay_delay+0
	MOVLW      1
	ADDWFC     _timeticks+1, 0
	MOVWF      _Uhav_ltrelay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Uhav_ltrelay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Uhav_ltrelay_delay+3
;GWL_batscan.c,2758 :: 		}
L_OUTPUT_poll531:
;GWL_batscan.c,2759 :: 		}
L_OUTPUT_poll528:
;GWL_batscan.c,2760 :: 		if  ((DISCflag==0) && (UhavOKstatus==CELLUHAVFAIL) )
	MOVF       _DISCflag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll534
	MOVF       _UhavOKstatus+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll534
L__OUTPUT_poll779:
;GWL_batscan.c,2762 :: 		UhavOKstatus=CELLUHAVOK;
	MOVLW      1
	MOVWF      _UhavOKstatus+0
;GWL_batscan.c,2763 :: 		if (GBUhavBlock==1) {
	MOVF       _GBUhavBlock+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll535
;GWL_batscan.c,2764 :: 		set_Uhav_OUTPUT(CELLUHAVOK);
	MOVLW      1
	MOVWF      FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,2765 :: 		Uhav_ltrelay_event=CELLUHAVOK;
	MOVLW      1
	MOVWF      _Uhav_ltrelay_event+0
;GWL_batscan.c,2766 :: 		debug_print_str("\r\nUHAVBLOCK");
	MOVLW      ?lstr23_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr23_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2767 :: 		}
L_OUTPUT_poll535:
;GWL_batscan.c,2769 :: 		debug_print_str("\r\nUHAVOK");
	MOVLW      ?lstr24_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr24_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2771 :: 		}
L_OUTPUT_poll534:
;GWL_batscan.c,2776 :: 		if (GBUminEvent==1)  {
	MOVF       _GBUminEvent+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll536
;GWL_batscan.c,2779 :: 		if  ( (Umin4Event==1) && ((Umin4_relay_event==CELLNA) || (Umin4_relay_event==CELLUMINOK)) ) {
	MOVF       OUTPUT_poll_Umin4Event_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll541
	MOVF       _Umin4_relay_event+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll778
	MOVF       _Umin4_relay_event+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll778
	GOTO       L_OUTPUT_poll541
L__OUTPUT_poll778:
L__OUTPUT_poll777:
;GWL_batscan.c,2780 :: 		Umin4_relay_event=CELLUMINFAIL;
	CLRF       _Umin4_relay_event+0
;GWL_batscan.c,2781 :: 		Umin4_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umin4_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umin4_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umin4_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umin4_relay_delay+3
;GWL_batscan.c,2782 :: 		debug_print_str("\r\nUMIN4FAIL");
	MOVLW      ?lstr25_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr25_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2783 :: 		}
L_OUTPUT_poll541:
;GWL_batscan.c,2784 :: 		if  (Umin4Event==0) {
	MOVF       OUTPUT_poll_Umin4Event_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll542
;GWL_batscan.c,2785 :: 		if ((Umin4_relay_event==CELLUMAXFAIL) || (Umin4_relay_event==CELLNA)) {
	MOVF       _Umin4_relay_event+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll776
	MOVF       _Umin4_relay_event+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll776
	GOTO       L_OUTPUT_poll545
L__OUTPUT_poll776:
;GWL_batscan.c,2786 :: 		Umin4_relay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2787 :: 		set_Umin4_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umin4_OUTPUT_status+0
	CALL       _set_Umin4_OUTPUT+0
;GWL_batscan.c,2788 :: 		debug_print_str("\r\nUMIN4EVENTOK");
	MOVLW      ?lstr26_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr26_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2789 :: 		}
L_OUTPUT_poll545:
;GWL_batscan.c,2791 :: 		}
L_OUTPUT_poll542:
;GWL_batscan.c,2793 :: 		if  ((UminEvent==1) && (  (UminOKstatus==CELLUMINOK) || (UminOKstatus==CELLNA)) )
	MOVF       OUTPUT_poll_UminEvent_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll550
	MOVF       _UminOKstatus+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll775
	MOVF       _UminOKstatus+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll775
	GOTO       L_OUTPUT_poll550
L__OUTPUT_poll775:
L__OUTPUT_poll774:
;GWL_batscan.c,2795 :: 		UminOKstatus=CELLUMINFAIL;
	CLRF       _UminOKstatus+0
;GWL_batscan.c,2798 :: 		Umin_relay_event=CELLUMINFAIL;
	CLRF       _Umin_relay_event+0
;GWL_batscan.c,2799 :: 		Umin_ltrelay_event=CELLUMINFAIL;
	CLRF       _Umin_ltrelay_event+0
;GWL_batscan.c,2800 :: 		Umin_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umin_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umin_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umin_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umin_relay_delay+3
;GWL_batscan.c,2801 :: 		Umin_ltrelay_delay=timeticks+Uminmax_delay_ltrelay_value;
	MOVLW      94
	ADDWF      _timeticks+0, 0
	MOVWF      _Umin_ltrelay_delay+0
	MOVLW      1
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umin_ltrelay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umin_ltrelay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umin_ltrelay_delay+3
;GWL_batscan.c,2802 :: 		}
L_OUTPUT_poll550:
;GWL_batscan.c,2803 :: 		if  ((UminEvent==0) && (  (UminOKstatus==CELLUMINFAIL) || (UminOKstatus==CELLNA)) )
	MOVF       OUTPUT_poll_UminEvent_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll555
	MOVF       _UminOKstatus+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll773
	MOVF       _UminOKstatus+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll773
	GOTO       L_OUTPUT_poll555
L__OUTPUT_poll773:
L__OUTPUT_poll772:
;GWL_batscan.c,2805 :: 		UminOKstatus=CELLUMINOK;
	MOVLW      1
	MOVWF      _UminOKstatus+0
;GWL_batscan.c,2806 :: 		if (GBUminBlock==1) {
	MOVF       _GBUminBlock+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll556
;GWL_batscan.c,2807 :: 		debug_print_str("\r\nUMINOKSET");
	MOVLW      ?lstr27_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr27_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2808 :: 		set_Umin_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umin_OUTPUT_status+0
	CALL       _set_Umin_OUTPUT+0
;GWL_batscan.c,2809 :: 		Umin_relay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umin_relay_event+0
;GWL_batscan.c,2810 :: 		}
L_OUTPUT_poll556:
;GWL_batscan.c,2811 :: 		if (GBUminBlockLR==1) {
	MOVF       _GBUminBlockLR+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll557
;GWL_batscan.c,2812 :: 		set_Umin_LT_OUTPUT(CELLUMINOK);
	MOVLW      1
	MOVWF      FARG_set_Umin_LT_OUTPUT_status+0
	CALL       _set_Umin_LT_OUTPUT+0
;GWL_batscan.c,2813 :: 		Umin_ltrelay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umin_ltrelay_event+0
;GWL_batscan.c,2814 :: 		}
L_OUTPUT_poll557:
;GWL_batscan.c,2816 :: 		debug_print_str("\r\n UMINOK");
	MOVLW      ?lstr28_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr28_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2818 :: 		}
L_OUTPUT_poll555:
;GWL_batscan.c,2819 :: 		}
L_OUTPUT_poll536:
;GWL_batscan.c,2822 :: 		if  (GBUmaxEvent==1)
	MOVF       _GBUmaxEvent+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll558
;GWL_batscan.c,2824 :: 		if  ( (Umax4Event==1) && ((Umax4_relay_event==CELLNA) || (Umax4_relay_event==CELLUMAXOK)) ) {
	MOVF       OUTPUT_poll_Umax4Event_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll563
	MOVF       _Umax4_relay_event+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll771
	MOVF       _Umax4_relay_event+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll771
	GOTO       L_OUTPUT_poll563
L__OUTPUT_poll771:
L__OUTPUT_poll770:
;GWL_batscan.c,2825 :: 		Umax4_relay_event=CELLUMAXFAIL;
	CLRF       _Umax4_relay_event+0
;GWL_batscan.c,2826 :: 		Umax4_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umax4_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umax4_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umax4_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umax4_relay_delay+3
;GWL_batscan.c,2827 :: 		debug_print_str("\r\nUMAX4EVENTFAIL");
	MOVLW      ?lstr29_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr29_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2828 :: 		}
L_OUTPUT_poll563:
;GWL_batscan.c,2829 :: 		if  (Umax4Event==0) {
	MOVF       OUTPUT_poll_Umax4Event_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll564
;GWL_batscan.c,2830 :: 		if ((Umax4_relay_event==CELLUMAXFAIL) || (Umax4_relay_event==CELLNA)) {
	MOVF       _Umax4_relay_event+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll769
	MOVF       _Umax4_relay_event+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll769
	GOTO       L_OUTPUT_poll567
L__OUTPUT_poll769:
;GWL_batscan.c,2831 :: 		Umax4_relay_event=CELLUMAXOK;
	MOVLW      1
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2832 :: 		set_Umax4_OUTPUT(CELLUMAXOK);
	MOVLW      1
	MOVWF      FARG_set_Umax4_OUTPUT_status+0
	CALL       _set_Umax4_OUTPUT+0
;GWL_batscan.c,2833 :: 		debug_print_str("\r\nUMAX4EVENTOK");
	MOVLW      ?lstr30_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr30_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2834 :: 		}
L_OUTPUT_poll567:
;GWL_batscan.c,2836 :: 		}
L_OUTPUT_poll564:
;GWL_batscan.c,2841 :: 		if  ( (UmaxEvent==1) && (  (UmaxOKstatus==CELLUMAXOK) || (UmaxOKstatus==CELLNA)) )
	MOVF       OUTPUT_poll_UmaxEvent_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll572
	MOVF       _UmaxOKstatus+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll768
	MOVF       _UmaxOKstatus+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll768
	GOTO       L_OUTPUT_poll572
L__OUTPUT_poll768:
L__OUTPUT_poll767:
;GWL_batscan.c,2843 :: 		UmaxOKstatus=CELLUMAXFAIL;
	CLRF       _UmaxOKstatus+0
;GWL_batscan.c,2844 :: 		Umax_relay_event=CELLUMAXFAIL;
	CLRF       _Umax_relay_event+0
;GWL_batscan.c,2846 :: 		Umax_ltrelay_event=CELLUMAXFAIL;
	CLRF       _Umax_ltrelay_event+0
;GWL_batscan.c,2847 :: 		Umax_relay_delay=timeticks+Uminmax_delay_relay_value;
	MOVLW      150
	ADDWF      _timeticks+0, 0
	MOVWF      _Umax_relay_delay+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umax_relay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umax_relay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umax_relay_delay+3
;GWL_batscan.c,2848 :: 		Umax_ltrelay_delay=timeticks+Uminmax_delay_ltrelay_value;
	MOVLW      94
	ADDWF      _timeticks+0, 0
	MOVWF      _Umax_ltrelay_delay+0
	MOVLW      1
	ADDWFC     _timeticks+1, 0
	MOVWF      _Umax_ltrelay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Umax_ltrelay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Umax_ltrelay_delay+3
;GWL_batscan.c,2849 :: 		debug_print_str("\r\nUMAXFAIL");
	MOVLW      ?lstr31_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr31_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2852 :: 		}
L_OUTPUT_poll572:
;GWL_batscan.c,2853 :: 		if   ((UmaxEvent==0) && ( (UmaxOKstatus==CELLUMAXFAIL) || (UmaxOKstatus==CELLNA)) )
	MOVF       OUTPUT_poll_UmaxEvent_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll577
	MOVF       _UmaxOKstatus+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll766
	MOVF       _UmaxOKstatus+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__OUTPUT_poll766
	GOTO       L_OUTPUT_poll577
L__OUTPUT_poll766:
L__OUTPUT_poll765:
;GWL_batscan.c,2855 :: 		UmaxOKstatus=CELLUMAXOK;
	MOVLW      1
	MOVWF      _UmaxOKstatus+0
;GWL_batscan.c,2856 :: 		debug_print_str("\r\nUMAXOK");
	MOVLW      ?lstr32_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr32_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2857 :: 		if (GBUmaxBlock==1) {
	MOVF       _GBUmaxBlock+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll578
;GWL_batscan.c,2858 :: 		debug_print_str("\r\nUMAXOKSET");
	MOVLW      ?lstr33_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr33_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2859 :: 		set_Umax_OUTPUT(CELLUMAXOK);
	MOVLW      1
	MOVWF      FARG_set_Umax_OUTPUT_status+0
	CALL       _set_Umax_OUTPUT+0
;GWL_batscan.c,2860 :: 		Umax_relay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umax_relay_event+0
;GWL_batscan.c,2864 :: 		}
L_OUTPUT_poll578:
;GWL_batscan.c,2865 :: 		if (GBUmaxBlockLR==1) {
	MOVF       _GBUmaxBlockLR+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_OUTPUT_poll579
;GWL_batscan.c,2866 :: 		set_Umax_LT_OUTPUT(CELLUMAXOK);
	MOVLW      1
	MOVWF      FARG_set_Umax_LT_OUTPUT_status+0
	CALL       _set_Umax_LT_OUTPUT+0
;GWL_batscan.c,2867 :: 		Umax_ltrelay_event=CELLUMINOK;
	MOVLW      1
	MOVWF      _Umax_ltrelay_event+0
;GWL_batscan.c,2868 :: 		}
L_OUTPUT_poll579:
;GWL_batscan.c,2870 :: 		}
L_OUTPUT_poll577:
;GWL_batscan.c,2872 :: 		}
L_OUTPUT_poll558:
;GWL_batscan.c,2874 :: 		}
L_end_OUTPUT_poll:
	RETURN
; end of _OUTPUT_poll

_DELAY_poll:

;GWL_batscan.c,2878 :: 		void DELAY_poll()
;GWL_batscan.c,2883 :: 		if (Umin4_relay_event==CELLUMINFAIL) {
	MOVF       _Umin4_relay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll580
;GWL_batscan.c,2884 :: 		if (timeticks>Umin4_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umin4_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll938
	MOVF       _timeticks+2, 0
	SUBWF      _Umin4_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll938
	MOVF       _timeticks+1, 0
	SUBWF      _Umin4_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll938
	MOVF       _timeticks+0, 0
	SUBWF      _Umin4_relay_delay+0, 0
L__DELAY_poll938:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll581
;GWL_batscan.c,2885 :: 		debug_print_str("\r\nUMIN4 DELAYEV WHYST");
	MOVLW      ?lstr34_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr34_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2886 :: 		Umin4_relay_event=CELLUMINWAITFORHYST;
	MOVLW      2
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,2887 :: 		set_Umin4_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin4_OUTPUT_status+0
	CALL       _set_Umin4_OUTPUT+0
;GWL_batscan.c,2888 :: 		}
L_DELAY_poll581:
;GWL_batscan.c,2889 :: 		}
L_DELAY_poll580:
;GWL_batscan.c,2892 :: 		if ((Umin_relay_event==CELLUMINFAIL) && GBUminBlock) {
	MOVF       _Umin_relay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll584
	MOVF       _GBUminBlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DELAY_poll584
L__DELAY_poll786:
;GWL_batscan.c,2893 :: 		if (timeticks>Umin_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umin_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll939
	MOVF       _timeticks+2, 0
	SUBWF      _Umin_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll939
	MOVF       _timeticks+1, 0
	SUBWF      _Umin_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll939
	MOVF       _timeticks+0, 0
	SUBWF      _Umin_relay_delay+0, 0
L__DELAY_poll939:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll585
;GWL_batscan.c,2894 :: 		debug_print_str("\r\nUMINDELAYEV");
	MOVLW      ?lstr35_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr35_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2895 :: 		set_Umin_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin_OUTPUT_status+0
	CALL       _set_Umin_OUTPUT+0
;GWL_batscan.c,2896 :: 		Umin_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umin_relay_event+0
;GWL_batscan.c,2897 :: 		GBUminBlock=0;
	CLRF       _GBUminBlock+0
;GWL_batscan.c,2898 :: 		memcpy(&CHN_voltageMINEvent,&CHN_voltageMINEventTemp,16);
	MOVLW      _CHN_voltageMINEvent+0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      hi_addr(_CHN_voltageMINEvent+0)
	MOVWF      FARG_memcpy_d1+1
	MOVLW      _CHN_voltageMINEventTemp+0
	MOVWF      FARG_memcpy_s1+0
	MOVLW      hi_addr(_CHN_voltageMINEventTemp+0)
	MOVWF      FARG_memcpy_s1+1
	MOVLW      16
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;GWL_batscan.c,2899 :: 		save_eeprom_event();
	CALL       _save_eeprom_event+0
;GWL_batscan.c,2902 :: 		}
L_DELAY_poll585:
;GWL_batscan.c,2904 :: 		}
L_DELAY_poll584:
;GWL_batscan.c,2905 :: 		if ((Umin_ltrelay_event==CELLUMINFAIL) && GBUminBlockLR) {
	MOVF       _Umin_ltrelay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll588
	MOVF       _GBUminBlockLR+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DELAY_poll588
L__DELAY_poll785:
;GWL_batscan.c,2906 :: 		if (timeticks>Umin_ltrelay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umin_ltrelay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll940
	MOVF       _timeticks+2, 0
	SUBWF      _Umin_ltrelay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll940
	MOVF       _timeticks+1, 0
	SUBWF      _Umin_ltrelay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll940
	MOVF       _timeticks+0, 0
	SUBWF      _Umin_ltrelay_delay+0, 0
L__DELAY_poll940:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll589
;GWL_batscan.c,2907 :: 		set_Umin_LT_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin_LT_OUTPUT_status+0
	CALL       _set_Umin_LT_OUTPUT+0
;GWL_batscan.c,2908 :: 		Umin_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Umin_ltrelay_event+0
;GWL_batscan.c,2909 :: 		GBUminBlockLR=0;
	CLRF       _GBUminBlockLR+0
;GWL_batscan.c,2913 :: 		}
L_DELAY_poll589:
;GWL_batscan.c,2914 :: 		}
L_DELAY_poll588:
;GWL_batscan.c,2917 :: 		if (Umax4_relay_event==CELLUMAXFAIL) {
	MOVF       _Umax4_relay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll590
;GWL_batscan.c,2918 :: 		if (timeticks>Umax4_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umax4_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll941
	MOVF       _timeticks+2, 0
	SUBWF      _Umax4_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll941
	MOVF       _timeticks+1, 0
	SUBWF      _Umax4_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll941
	MOVF       _timeticks+0, 0
	SUBWF      _Umax4_relay_delay+0, 0
L__DELAY_poll941:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll591
;GWL_batscan.c,2919 :: 		debug_print_str("\r\nUMAX4 DELAYEV WHYST!");
	MOVLW      ?lstr36_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr36_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2920 :: 		Umax4_relay_event=CELLUMAXWAITFORHYST;;
	MOVLW      2
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,2921 :: 		set_Umax4_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax4_OUTPUT_status+0
	CALL       _set_Umax4_OUTPUT+0
;GWL_batscan.c,2922 :: 		}
L_DELAY_poll591:
;GWL_batscan.c,2923 :: 		}
L_DELAY_poll590:
;GWL_batscan.c,2927 :: 		if ((Umax_relay_event==CELLUMAXFAIL) && GBUmaxBlock) {
	MOVF       _Umax_relay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll594
	MOVF       _GBUmaxBlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DELAY_poll594
L__DELAY_poll784:
;GWL_batscan.c,2928 :: 		if (timeticks>Umax_relay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umax_relay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll942
	MOVF       _timeticks+2, 0
	SUBWF      _Umax_relay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll942
	MOVF       _timeticks+1, 0
	SUBWF      _Umax_relay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll942
	MOVF       _timeticks+0, 0
	SUBWF      _Umax_relay_delay+0, 0
L__DELAY_poll942:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll595
;GWL_batscan.c,2929 :: 		set_Umax_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax_OUTPUT_status+0
	CALL       _set_Umax_OUTPUT+0
;GWL_batscan.c,2930 :: 		Umax_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umax_relay_event+0
;GWL_batscan.c,2931 :: 		GBUmaxBlock=0;
	CLRF       _GBUmaxBlock+0
;GWL_batscan.c,2932 :: 		memcpy(&CHN_voltageMAXEvent,&CHN_voltageMAXEventTemp,16);
	MOVLW      _CHN_voltageMAXEvent+0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      hi_addr(_CHN_voltageMAXEvent+0)
	MOVWF      FARG_memcpy_d1+1
	MOVLW      _CHN_voltageMAXEventTemp+0
	MOVWF      FARG_memcpy_s1+0
	MOVLW      hi_addr(_CHN_voltageMAXEventTemp+0)
	MOVWF      FARG_memcpy_s1+1
	MOVLW      16
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;GWL_batscan.c,2933 :: 		save_eeprom_event();
	CALL       _save_eeprom_event+0
;GWL_batscan.c,2935 :: 		}
L_DELAY_poll595:
;GWL_batscan.c,2936 :: 		}
L_DELAY_poll594:
;GWL_batscan.c,2937 :: 		if ((Umax_ltrelay_event==CELLUMAXFAIL)&& GBUmaxBlockLR) {
	MOVF       _Umax_ltrelay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll598
	MOVF       _GBUmaxBlockLR+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DELAY_poll598
L__DELAY_poll783:
;GWL_batscan.c,2938 :: 		if (timeticks>Umax_ltrelay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Umax_ltrelay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll943
	MOVF       _timeticks+2, 0
	SUBWF      _Umax_ltrelay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll943
	MOVF       _timeticks+1, 0
	SUBWF      _Umax_ltrelay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll943
	MOVF       _timeticks+0, 0
	SUBWF      _Umax_ltrelay_delay+0, 0
L__DELAY_poll943:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll599
;GWL_batscan.c,2939 :: 		set_Umax_LT_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax_LT_OUTPUT_status+0
	CALL       _set_Umax_LT_OUTPUT+0
;GWL_batscan.c,2940 :: 		Umax_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Umax_ltrelay_event+0
;GWL_batscan.c,2941 :: 		GBUmaxBlockLR=0;
	CLRF       _GBUmaxBlockLR+0
;GWL_batscan.c,2944 :: 		}
L_DELAY_poll599:
;GWL_batscan.c,2945 :: 		}
L_DELAY_poll598:
;GWL_batscan.c,2950 :: 		if (Uhav_ltrelay_event==CELLUHAVFAIL) {
	MOVF       _Uhav_ltrelay_event+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll600
;GWL_batscan.c,2952 :: 		if (timeticks>Uhav_ltrelay_delay) {
	MOVF       _timeticks+3, 0
	SUBWF      _Uhav_ltrelay_delay+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll944
	MOVF       _timeticks+2, 0
	SUBWF      _Uhav_ltrelay_delay+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll944
	MOVF       _timeticks+1, 0
	SUBWF      _Uhav_ltrelay_delay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DELAY_poll944
	MOVF       _timeticks+0, 0
	SUBWF      _Uhav_ltrelay_delay+0, 0
L__DELAY_poll944:
	BTFSC      STATUS+0, 0
	GOTO       L_DELAY_poll601
;GWL_batscan.c,2953 :: 		debug_print_str("\r\nUHAVDELAYEV");
	MOVLW      ?lstr37_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr37_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2954 :: 		set_Uhav_OUTPUT(CELLUHAVFAIL);
	CLRF       FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,2955 :: 		Uhav_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Uhav_ltrelay_event+0
;GWL_batscan.c,2956 :: 		if (GBUhavUminident==1) {
	MOVF       _GBUhavUminident+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll602
;GWL_batscan.c,2957 :: 		DLDISCflag=1;
	MOVLW      1
	MOVWF      _DLDISCflag+0
;GWL_batscan.c,2958 :: 		discontime=DISCONNECTTIME + timeticks;
	MOVLW      50
	ADDWF      _timeticks+0, 0
	MOVWF      _discontime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _discontime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _discontime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _discontime+3
;GWL_batscan.c,2959 :: 		debug_print_str("\r\nVYPINAME UMINHAV!");
	MOVLW      ?lstr38_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr38_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2960 :: 		}
L_DELAY_poll602:
;GWL_batscan.c,2962 :: 		save_eeprom_event();
	CALL       _save_eeprom_event+0
;GWL_batscan.c,2965 :: 		}
	GOTO       L_DELAY_poll603
L_DELAY_poll601:
;GWL_batscan.c,2967 :: 		if ((GBUminBlock==0) && (!DLDISCflag)) {
	MOVF       _GBUminBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll606
	MOVF       _DLDISCflag+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll606
L__DELAY_poll782:
;GWL_batscan.c,2968 :: 		debug_print_str("\r\nVYPINAMEUMINHAVPOUMIN");
	MOVLW      ?lstr39_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr39_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2969 :: 		DLDISCflag=1;
	MOVLW      1
	MOVWF      _DLDISCflag+0
;GWL_batscan.c,2970 :: 		discontime=10 + timeticks;
	MOVLW      10
	ADDWF      _timeticks+0, 0
	MOVWF      _discontime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _discontime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _discontime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _discontime+3
;GWL_batscan.c,2971 :: 		}
L_DELAY_poll606:
;GWL_batscan.c,2972 :: 		if ((GBUmaxBlock==0) && ((GBUhavBlock==1))) {
	MOVF       _GBUmaxBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll609
	MOVF       _GBUhavBlock+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_DELAY_poll609
L__DELAY_poll781:
;GWL_batscan.c,2973 :: 		set_Uhav_OUTPUT(CELLUHAVFAIL);
	CLRF       FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,2974 :: 		GBUhavBlock=0;
	CLRF       _GBUhavBlock+0
;GWL_batscan.c,2975 :: 		debug_print_str("\r\nSETUJEME UMAXHAV!");
	MOVLW      ?lstr40_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr40_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,2976 :: 		}
L_DELAY_poll609:
;GWL_batscan.c,2978 :: 		}
L_DELAY_poll603:
;GWL_batscan.c,2979 :: 		}
L_DELAY_poll600:
;GWL_batscan.c,2982 :: 		}
L_end_DELAY_poll:
	RETURN
; end of _DELAY_poll

_CPMOUTPUTGETREG:

;GWL_batscan.c,2985 :: 		void CPMOUTPUTGETREG()
;GWL_batscan.c,2987 :: 		if (CPMREGDATA[I2C_UMIN12]==RESWITCH) {
	MOVF       _CPMREGDATA+47, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG946
	MOVLW      165
	XORWF      _CPMREGDATA+46, 0
L__CPMOUTPUTGETREG946:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG610
;GWL_batscan.c,2988 :: 		reswitchoutputspinfromI2C(PINUMIN12);
	MOVLW      1
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,2989 :: 		}
	GOTO       L_CPMOUTPUTGETREG611
L_CPMOUTPUTGETREG610:
;GWL_batscan.c,2990 :: 		else if (CPMREGDATA[I2C_UMIN12]==ONSWITCH) {
	MOVF       _CPMREGDATA+47, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG947
	MOVLW      21
	XORWF      _CPMREGDATA+46, 0
L__CPMOUTPUTGETREG947:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG612
;GWL_batscan.c,2992 :: 		onswitchoutputspinfromI2C(PINUMIN12);
	MOVLW      1
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,2994 :: 		}
	GOTO       L_CPMOUTPUTGETREG613
L_CPMOUTPUTGETREG612:
;GWL_batscan.c,2995 :: 		else if (CPMREGDATA[I2C_UMIN12]==OFFSWITCH) {
	MOVF       _CPMREGDATA+47, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG948
	MOVLW      5
	XORWF      _CPMREGDATA+46, 0
L__CPMOUTPUTGETREG948:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG614
;GWL_batscan.c,2997 :: 		offswitchoutputspinfromI2C(PINUMIN12);
	MOVLW      1
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,2999 :: 		}
L_CPMOUTPUTGETREG614:
L_CPMOUTPUTGETREG613:
L_CPMOUTPUTGETREG611:
;GWL_batscan.c,3002 :: 		if (CPMREGDATA[I2C_UMIN3]==RESWITCH) {
	MOVF       _CPMREGDATA+49, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG949
	MOVLW      165
	XORWF      _CPMREGDATA+48, 0
L__CPMOUTPUTGETREG949:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG615
;GWL_batscan.c,3003 :: 		reswitchoutputspinfromI2C(PINUMIN3);
	MOVLW      2
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3004 :: 		}
	GOTO       L_CPMOUTPUTGETREG616
L_CPMOUTPUTGETREG615:
;GWL_batscan.c,3005 :: 		else if (CPMREGDATA[I2C_UMIN3]==ONSWITCH) {
	MOVF       _CPMREGDATA+49, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG950
	MOVLW      21
	XORWF      _CPMREGDATA+48, 0
L__CPMOUTPUTGETREG950:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG617
;GWL_batscan.c,3006 :: 		onswitchoutputspinfromI2C(PINUMIN3);
	MOVLW      2
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3007 :: 		}
	GOTO       L_CPMOUTPUTGETREG618
L_CPMOUTPUTGETREG617:
;GWL_batscan.c,3008 :: 		else if (CPMREGDATA[I2C_UMIN3]==OFFSWITCH) {
	MOVF       _CPMREGDATA+49, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG951
	MOVLW      5
	XORWF      _CPMREGDATA+48, 0
L__CPMOUTPUTGETREG951:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG619
;GWL_batscan.c,3009 :: 		offswitchoutputspinfromI2C(PINUMIN3);
	MOVLW      2
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3010 :: 		}
L_CPMOUTPUTGETREG619:
L_CPMOUTPUTGETREG618:
L_CPMOUTPUTGETREG616:
;GWL_batscan.c,3013 :: 		if (CPMREGDATA[I2C_UMIN4]==RESWITCH) {
	MOVF       _CPMREGDATA+51, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG952
	MOVLW      165
	XORWF      _CPMREGDATA+50, 0
L__CPMOUTPUTGETREG952:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG620
;GWL_batscan.c,3014 :: 		reswitchoutputspinfromI2C(PINUMIN4);
	MOVLW      3
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3015 :: 		}
	GOTO       L_CPMOUTPUTGETREG621
L_CPMOUTPUTGETREG620:
;GWL_batscan.c,3016 :: 		else if (CPMREGDATA[I2C_UMIN4]==ONSWITCH) {
	MOVF       _CPMREGDATA+51, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG953
	MOVLW      21
	XORWF      _CPMREGDATA+50, 0
L__CPMOUTPUTGETREG953:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG622
;GWL_batscan.c,3017 :: 		onswitchoutputspinfromI2C(PINUMIN4);
	MOVLW      3
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3018 :: 		}
	GOTO       L_CPMOUTPUTGETREG623
L_CPMOUTPUTGETREG622:
;GWL_batscan.c,3019 :: 		else if (CPMREGDATA[I2C_UMIN4]==OFFSWITCH) {
	MOVF       _CPMREGDATA+51, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG954
	MOVLW      5
	XORWF      _CPMREGDATA+50, 0
L__CPMOUTPUTGETREG954:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG624
;GWL_batscan.c,3020 :: 		offswitchoutputspinfromI2C(PINUMIN4);
	MOVLW      3
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3021 :: 		}
L_CPMOUTPUTGETREG624:
L_CPMOUTPUTGETREG623:
L_CPMOUTPUTGETREG621:
;GWL_batscan.c,3023 :: 		if (CPMREGDATA[I2C_UMAX12]==RESWITCH) {
	MOVF       _CPMREGDATA+53, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG955
	MOVLW      165
	XORWF      _CPMREGDATA+52, 0
L__CPMOUTPUTGETREG955:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG625
;GWL_batscan.c,3024 :: 		reswitchoutputspinfromI2C(PINUMAX12);
	MOVLW      4
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3025 :: 		}
	GOTO       L_CPMOUTPUTGETREG626
L_CPMOUTPUTGETREG625:
;GWL_batscan.c,3026 :: 		else if (CPMREGDATA[I2C_UMAX12]==ONSWITCH) {
	MOVF       _CPMREGDATA+53, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG956
	MOVLW      21
	XORWF      _CPMREGDATA+52, 0
L__CPMOUTPUTGETREG956:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG627
;GWL_batscan.c,3027 :: 		onswitchoutputspinfromI2C(PINUMAX12);
	MOVLW      4
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3028 :: 		}
	GOTO       L_CPMOUTPUTGETREG628
L_CPMOUTPUTGETREG627:
;GWL_batscan.c,3029 :: 		else if (CPMREGDATA[I2C_UMAX12]==OFFSWITCH) {
	MOVF       _CPMREGDATA+53, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG957
	MOVLW      5
	XORWF      _CPMREGDATA+52, 0
L__CPMOUTPUTGETREG957:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG629
;GWL_batscan.c,3030 :: 		offswitchoutputspinfromI2C(PINUMAX12);
	MOVLW      4
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3031 :: 		}
L_CPMOUTPUTGETREG629:
L_CPMOUTPUTGETREG628:
L_CPMOUTPUTGETREG626:
;GWL_batscan.c,3033 :: 		if (CPMREGDATA[I2C_UMAX3]==RESWITCH) {
	MOVF       _CPMREGDATA+55, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG958
	MOVLW      165
	XORWF      _CPMREGDATA+54, 0
L__CPMOUTPUTGETREG958:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG630
;GWL_batscan.c,3034 :: 		reswitchoutputspinfromI2C(PINUMAX3);
	MOVLW      5
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3035 :: 		}
	GOTO       L_CPMOUTPUTGETREG631
L_CPMOUTPUTGETREG630:
;GWL_batscan.c,3036 :: 		else if (CPMREGDATA[I2C_UMAX3]==ONSWITCH) {
	MOVF       _CPMREGDATA+55, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG959
	MOVLW      21
	XORWF      _CPMREGDATA+54, 0
L__CPMOUTPUTGETREG959:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG632
;GWL_batscan.c,3037 :: 		onswitchoutputspinfromI2C(PINUMAX3);
	MOVLW      5
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3038 :: 		}
	GOTO       L_CPMOUTPUTGETREG633
L_CPMOUTPUTGETREG632:
;GWL_batscan.c,3039 :: 		else if (CPMREGDATA[I2C_UMAX3]==OFFSWITCH) {
	MOVF       _CPMREGDATA+55, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG960
	MOVLW      5
	XORWF      _CPMREGDATA+54, 0
L__CPMOUTPUTGETREG960:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG634
;GWL_batscan.c,3040 :: 		offswitchoutputspinfromI2C(PINUMAX3);
	MOVLW      5
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3041 :: 		}
L_CPMOUTPUTGETREG634:
L_CPMOUTPUTGETREG633:
L_CPMOUTPUTGETREG631:
;GWL_batscan.c,3043 :: 		if (CPMREGDATA[I2C_UMAX4]==RESWITCH) {
	MOVF       _CPMREGDATA+57, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG961
	MOVLW      165
	XORWF      _CPMREGDATA+56, 0
L__CPMOUTPUTGETREG961:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG635
;GWL_batscan.c,3044 :: 		reswitchoutputspinfromI2C(PINUMAX4);
	MOVLW      6
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3045 :: 		}
	GOTO       L_CPMOUTPUTGETREG636
L_CPMOUTPUTGETREG635:
;GWL_batscan.c,3046 :: 		else if (CPMREGDATA[I2C_UMAX4]==ONSWITCH) {
	MOVF       _CPMREGDATA+57, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG962
	MOVLW      21
	XORWF      _CPMREGDATA+56, 0
L__CPMOUTPUTGETREG962:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG637
;GWL_batscan.c,3047 :: 		onswitchoutputspinfromI2C(PINUMAX4);
	MOVLW      6
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3048 :: 		}
	GOTO       L_CPMOUTPUTGETREG638
L_CPMOUTPUTGETREG637:
;GWL_batscan.c,3049 :: 		else if (CPMREGDATA[I2C_UMAX4]==OFFSWITCH) {
	MOVF       _CPMREGDATA+57, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG963
	MOVLW      5
	XORWF      _CPMREGDATA+56, 0
L__CPMOUTPUTGETREG963:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG639
;GWL_batscan.c,3050 :: 		offswitchoutputspinfromI2C(PINUMAX4);
	MOVLW      6
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3051 :: 		}
L_CPMOUTPUTGETREG639:
L_CPMOUTPUTGETREG638:
L_CPMOUTPUTGETREG636:
;GWL_batscan.c,3053 :: 		if (CPMREGDATA[I2C_EMERG12]==RESWITCH) {
	MOVF       _CPMREGDATA+59, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG964
	MOVLW      165
	XORWF      _CPMREGDATA+58, 0
L__CPMOUTPUTGETREG964:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG640
;GWL_batscan.c,3054 :: 		reswitchoutputspinfromI2C(PINEMER12);
	MOVLW      7
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3055 :: 		}
	GOTO       L_CPMOUTPUTGETREG641
L_CPMOUTPUTGETREG640:
;GWL_batscan.c,3056 :: 		else if (CPMREGDATA[I2C_EMERG12]==ONSWITCH) {
	MOVF       _CPMREGDATA+59, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG965
	MOVLW      21
	XORWF      _CPMREGDATA+58, 0
L__CPMOUTPUTGETREG965:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG642
;GWL_batscan.c,3057 :: 		onswitchoutputspinfromI2C(PINEMER12);
	MOVLW      7
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3058 :: 		}
	GOTO       L_CPMOUTPUTGETREG643
L_CPMOUTPUTGETREG642:
;GWL_batscan.c,3059 :: 		else if (CPMREGDATA[I2C_EMERG12]==OFFSWITCH) {
	MOVF       _CPMREGDATA+59, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG966
	MOVLW      5
	XORWF      _CPMREGDATA+58, 0
L__CPMOUTPUTGETREG966:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG644
;GWL_batscan.c,3060 :: 		offswitchoutputspinfromI2C(PINEMER12);
	MOVLW      7
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3061 :: 		}
L_CPMOUTPUTGETREG644:
L_CPMOUTPUTGETREG643:
L_CPMOUTPUTGETREG641:
;GWL_batscan.c,3063 :: 		if (CPMREGDATA[I2C_EMERG3]==RESWITCH) {
	MOVF       _CPMREGDATA+61, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG967
	MOVLW      165
	XORWF      _CPMREGDATA+60, 0
L__CPMOUTPUTGETREG967:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG645
;GWL_batscan.c,3064 :: 		reswitchoutputspinfromI2C(PINEMER3);
	MOVLW      8
	MOVWF      FARG_reswitchoutputspinfromI2C_iopin+0
	CALL       _reswitchoutputspinfromI2C+0
;GWL_batscan.c,3065 :: 		}
L_CPMOUTPUTGETREG645:
;GWL_batscan.c,3066 :: 		if (CPMREGDATA[I2C_EMERG3]==ONSWITCH) {
	MOVF       _CPMREGDATA+61, 0
	XORLW      161
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG968
	MOVLW      21
	XORWF      _CPMREGDATA+60, 0
L__CPMOUTPUTGETREG968:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG646
;GWL_batscan.c,3067 :: 		onswitchoutputspinfromI2C(PINEMER3);
	MOVLW      8
	MOVWF      FARG_onswitchoutputspinfromI2C_iopin+0
	CALL       _onswitchoutputspinfromI2C+0
;GWL_batscan.c,3068 :: 		}
L_CPMOUTPUTGETREG646:
;GWL_batscan.c,3069 :: 		if (CPMREGDATA[I2C_EMERG3]==OFFSWITCH) {
	MOVF       _CPMREGDATA+61, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L__CPMOUTPUTGETREG969
	MOVLW      5
	XORWF      _CPMREGDATA+60, 0
L__CPMOUTPUTGETREG969:
	BTFSS      STATUS+0, 2
	GOTO       L_CPMOUTPUTGETREG647
;GWL_batscan.c,3070 :: 		offswitchoutputspinfromI2C(PINEMER3);
	MOVLW      8
	MOVWF      FARG_offswitchoutputspinfromI2C_iopin+0
	CALL       _offswitchoutputspinfromI2C+0
;GWL_batscan.c,3071 :: 		}
L_CPMOUTPUTGETREG647:
;GWL_batscan.c,3074 :: 		CPMREGDATA[I2C_UMIN12]=PIN_UMIN12;
	MOVF       _PIN_UMIN12+0, 0
	MOVWF      _CPMREGDATA+46
	CLRF       _CPMREGDATA+47
;GWL_batscan.c,3075 :: 		CPMREGDATA[I2C_UMIN3]=PIN_UMIN3;
	MOVF       _PIN_UMIN3+0, 0
	MOVWF      _CPMREGDATA+48
	CLRF       _CPMREGDATA+49
;GWL_batscan.c,3076 :: 		CPMREGDATA[I2C_UMIN4]=PIN_UMIN4;
	MOVF       _PIN_UMIN4+0, 0
	MOVWF      _CPMREGDATA+50
	CLRF       _CPMREGDATA+51
;GWL_batscan.c,3077 :: 		CPMREGDATA[I2C_UMAX12]=PIN_UMAX12;
	MOVF       _PIN_UMAX12+0, 0
	MOVWF      _CPMREGDATA+52
	CLRF       _CPMREGDATA+53
;GWL_batscan.c,3078 :: 		CPMREGDATA[I2C_UMAX3]=PIN_UMAX3;
	MOVF       _PIN_UMAX3+0, 0
	MOVWF      _CPMREGDATA+54
	CLRF       _CPMREGDATA+55
;GWL_batscan.c,3079 :: 		CPMREGDATA[I2C_UMAX4]=PIN_UMAX4;
	MOVF       _PIN_UMAX4+0, 0
	MOVWF      _CPMREGDATA+56
	CLRF       _CPMREGDATA+57
;GWL_batscan.c,3080 :: 		CPMREGDATA[I2C_EMERG12]=PIN_EMERG12;
	MOVF       _PIN_EMERG12+0, 0
	MOVWF      _CPMREGDATA+58
	CLRF       _CPMREGDATA+59
;GWL_batscan.c,3081 :: 		CPMREGDATA[I2C_EMERG3]=PIN_EMERG3;
	MOVF       _PIN_EMERG3+0, 0
	MOVWF      _CPMREGDATA+60
	CLRF       _CPMREGDATA+61
;GWL_batscan.c,3083 :: 		}
L_end_CPMOUTPUTGETREG:
	RETURN
; end of _CPMOUTPUTGETREG

_main:

;GWL_batscan.c,3089 :: 		void main() {
;GWL_batscan.c,3092 :: 		u16_t volt=0;
;GWL_batscan.c,3097 :: 		PWRUP_OUT();
	BCF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,3098 :: 		PWRUP=0;
	BCF        LATF+0, 4
;GWL_batscan.c,3100 :: 		PORTA=0;
	CLRF       PORTA+0
;GWL_batscan.c,3101 :: 		PORTB=0;
	CLRF       PORTB+0
;GWL_batscan.c,3102 :: 		PORTC=0;
	CLRF       PORTC+0
;GWL_batscan.c,3103 :: 		PORTD=0;
	CLRF       PORTD+0
;GWL_batscan.c,3104 :: 		PORTE=0;
	CLRF       PORTE+0
;GWL_batscan.c,3105 :: 		PORTF=0;
	CLRF       PORTF+0
;GWL_batscan.c,3106 :: 		PORTG=0;
	CLRF       PORTG+0
;GWL_batscan.c,3107 :: 		PORTH=0;
	CLRF       PORTH+0
;GWL_batscan.c,3108 :: 		init_adc();
	CALL       _init_adc+0
;GWL_batscan.c,3109 :: 		multiplex_init();
	CALL       _multiplex_init+0
;GWL_batscan.c,3111 :: 		delay_ms(200);
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_main648:
	DECFSZ     R13, 1
	GOTO       L_main648
	DECFSZ     R12, 1
	GOTO       L_main648
	DECFSZ     R11, 1
	GOTO       L_main648
	NOP
;GWL_batscan.c,3114 :: 		PIN_UMIN12=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMIN12+0
;GWL_batscan.c,3115 :: 		PIN_UMIN3=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMIN3+0
;GWL_batscan.c,3116 :: 		PIN_UMIN4=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMIN4+0
;GWL_batscan.c,3117 :: 		PIN_UMAX12=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMAX12+0
;GWL_batscan.c,3118 :: 		PIN_UMAX3=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMAX3+0
;GWL_batscan.c,3119 :: 		PIN_UMAX4=0xFF;
	MOVLW      255
	MOVWF      _PIN_UMAX4+0
;GWL_batscan.c,3120 :: 		PIN_EMERG12=0xFF;
	MOVLW      255
	MOVWF      _PIN_EMERG12+0
;GWL_batscan.c,3121 :: 		PIN_EMERG3=0xFF;
	MOVLW      255
	MOVWF      _PIN_EMERG3+0
;GWL_batscan.c,3123 :: 		startflag=1;
	MOVLW      1
	MOVWF      _startflag+0
;GWL_batscan.c,3125 :: 		memset(&CELL_connect,0,16);
	MOVLW      _CELL_connect+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,3127 :: 		DISCONNECTFLAG=0;
	CLRF       _DISCONNECTFLAG+0
;GWL_batscan.c,3128 :: 		MISSEDBUTTONFLAG=0;
	CLRF       _MISSEDBUTTONFLAG+0
;GWL_batscan.c,3130 :: 		UMIN_WR=0;
	CLRF       _UMIN_WR+0
;GWL_batscan.c,3131 :: 		UMAX_WR=0;
	CLRF       _UMAX_WR+0
;GWL_batscan.c,3132 :: 		MISSEDINTERCELLFLAG=0;
	CLRF       _MISSEDINTERCELLFLAG+0
;GWL_batscan.c,3133 :: 		MAXMINFLAG=0;
	CLRF       _MAXMINFLAG+0
;GWL_batscan.c,3134 :: 		Missed_cell_TEST=0;
	CLRF       _Missed_cell_TEST+0
;GWL_batscan.c,3135 :: 		Missed_cell_ID=0;
	CLRF       _Missed_cell_ID+0
;GWL_batscan.c,3136 :: 		Umin_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umin_relay_event+0
;GWL_batscan.c,3137 :: 		Umax_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umax_relay_event+0
;GWL_batscan.c,3140 :: 		Umin4_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umin4_relay_event+0
;GWL_batscan.c,3141 :: 		Umax4_relay_event=0xFF;
	MOVLW      255
	MOVWF      _Umax4_relay_event+0
;GWL_batscan.c,3144 :: 		Umin_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Umin_ltrelay_event+0
;GWL_batscan.c,3145 :: 		Umax_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Umax_ltrelay_event+0
;GWL_batscan.c,3146 :: 		Uhav_ltrelay_event=0xFF;
	MOVLW      255
	MOVWF      _Uhav_ltrelay_event+0
;GWL_batscan.c,3147 :: 		GBUminBlockLR=1;
	MOVLW      1
	MOVWF      _GBUminBlockLR+0
;GWL_batscan.c,3148 :: 		GBUminBlock=1;
	MOVLW      1
	MOVWF      _GBUminBlock+0
;GWL_batscan.c,3149 :: 		GBUmaxBlockLR=1;
	MOVLW      1
	MOVWF      _GBUmaxBlockLR+0
;GWL_batscan.c,3150 :: 		GBUmaxBlock=1;
	MOVLW      1
	MOVWF      _GBUmaxBlock+0
;GWL_batscan.c,3151 :: 		GBUhavBlock=1;
	MOVLW      1
	MOVWF      _GBUhavBlock+0
;GWL_batscan.c,3154 :: 		for (i=0; i<16; i++) {
	CLRF       main_i_L0+0
L_main649:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main650
;GWL_batscan.c,3155 :: 		CHN_voltageMINEvent[i]=0x00;
	MOVLW      _CHN_voltageMINEvent+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMINEvent+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,3156 :: 		CHN_voltageMAXEvent[i]=0x00;
	MOVLW      _CHN_voltageMAXEvent+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_CHN_voltageMAXEvent+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,3154 :: 		for (i=0; i<16; i++) {
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3157 :: 		}
	GOTO       L_main649
L_main650:
;GWL_batscan.c,3160 :: 		init_outputstatus();
	CALL       _init_outputstatus+0
;GWL_batscan.c,3161 :: 		ZCDCON=0;
	CLRF       ZCDCON+0
;GWL_batscan.c,3162 :: 		OSCCON1=0x10;
	MOVLW      16
	MOVWF      OSCCON1+0
;GWL_batscan.c,3165 :: 		testtime=timeticks+50L;
	MOVLW      50
	ADDWF      _timeticks+0, 0
	MOVWF      _testtime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _testtime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _testtime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _testtime+3
;GWL_batscan.c,3166 :: 		testbuttontime=timeticks+20;
	MOVLW      20
	ADDWF      _timeticks+0, 0
	MOVWF      _testbuttontime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _testbuttontime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _testbuttontime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _testbuttontime+3
;GWL_batscan.c,3172 :: 		init_LED();
	CALL       _init_LED+0
;GWL_batscan.c,3173 :: 		start_timer();
	CALL       _start_timer+0
;GWL_batscan.c,3174 :: 		DACs_init();
	CALL       _DACs_init+0
;GWL_batscan.c,3177 :: 		LEDOFFflag=0;
	CLRF       _LEDOFFflag+0
;GWL_batscan.c,3178 :: 		LEDtime=timeticks+LEDONTIME;
	MOVLW      10
	ADDWF      _timeticks+0, 0
	MOVWF      _LEdtime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _LEdtime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _LEdtime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _LEdtime+3
;GWL_batscan.c,3180 :: 		DIGIN1_IN();
	BSF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;GWL_batscan.c,3181 :: 		DIGIN2_IN();
	BSF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;GWL_batscan.c,3183 :: 		debug_init();
	CALL       _debug_init+0
;GWL_batscan.c,3188 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,3189 :: 		TRISC3_bit=1;
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;GWL_batscan.c,3190 :: 		WPUC.WPUC3=1;
	BSF        WPUC+0, 3
;GWL_batscan.c,3192 :: 		debug_print_str("\r\nSTARTTI123456789");
	MOVLW      ?lstr41_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr41_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3193 :: 		INLVLC.INLVLC4=1;
	BSF        INLVLC+0, 4
;GWL_batscan.c,3194 :: 		INLVLC.INLVLC4=1;
	BSF        INLVLC+0, 4
;GWL_batscan.c,3196 :: 		I2C1_Initialize();
	CALL       _I2C1_Initialize+0
;GWL_batscan.c,3197 :: 		memset(&CPMREGDATA,0xFF,maxreg*2);
	MOVLW      _CPMREGDATA+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_CPMREGDATA+0)
	MOVWF      FARG_memset_p1+1
	MOVLW      255
	MOVWF      FARG_memset_character+0
	MOVLW      74
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;GWL_batscan.c,3203 :: 		eeprom_event_i2c_register_initialize();
	CALL       _eeprom_event_i2c_register_initialize+0
;GWL_batscan.c,3207 :: 		memcpy(&TEMPCPMREGDATA,&CPMREGDATA,maxreg*2);
	MOVLW      _TEMPCPMREGDATA+0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      hi_addr(_TEMPCPMREGDATA+0)
	MOVWF      FARG_memcpy_d1+1
	MOVLW      _CPMREGDATA+0
	MOVWF      FARG_memcpy_s1+0
	MOVLW      hi_addr(_CPMREGDATA+0)
	MOVWF      FARG_memcpy_s1+1
	MOVLW      74
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;GWL_batscan.c,3211 :: 		debug_print_str("\r\nCTRL1");
	MOVLW      ?lstr42_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr42_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3214 :: 		PWRUP_OUT();
	BCF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,3215 :: 		PWRUP=1;
	BSF        LATF+0, 4
;GWL_batscan.c,3217 :: 		delay_ms(200);
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_main652:
	DECFSZ     R13, 1
	GOTO       L_main652
	DECFSZ     R12, 1
	GOTO       L_main652
	DECFSZ     R11, 1
	GOTO       L_main652
	NOP
;GWL_batscan.c,3220 :: 		for (i=0; i<5; i++) {
	CLRF       main_i_L0+0
L_main653:
	MOVLW      5
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main654
;GWL_batscan.c,3221 :: 		adc_getval(VOLTAGEINPUT);
	MOVLW      40
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
;GWL_batscan.c,3222 :: 		adc_getval(UMININPUT);
	MOVLW      55
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
;GWL_batscan.c,3223 :: 		adc_getval(UMAXINPUT);
	MOVLW      41
	MOVWF      FARG_adc_getval_channel+0
	CALL       _adc_getval+0
;GWL_batscan.c,3224 :: 		delay_ms(200);
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_main656:
	DECFSZ     R13, 1
	GOTO       L_main656
	DECFSZ     R12, 1
	GOTO       L_main656
	DECFSZ     R11, 1
	GOTO       L_main656
	NOP
;GWL_batscan.c,3220 :: 		for (i=0; i<5; i++) {
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3225 :: 		}
	GOTO       L_main653
L_main654:
;GWL_batscan.c,3228 :: 		PWRUP_OUT();
	BCF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,3229 :: 		PWRUP=1;
	BSF        LATF+0, 4
;GWL_batscan.c,3230 :: 		i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
;GWL_batscan.c,3231 :: 		Umin_button();
	CALL       _Umin_button+0
;GWL_batscan.c,3232 :: 		Umax_button();
	CALL       _Umax_button+0
;GWL_batscan.c,3234 :: 		Uhav_ltrelay_delay=timeticks+Uhav_delay_ltrelay_value;
	MOVLW      44
	ADDWF      _timeticks+0, 0
	MOVWF      _Uhav_ltrelay_delay+0
	MOVLW      1
	ADDWFC     _timeticks+1, 0
	MOVWF      _Uhav_ltrelay_delay+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _Uhav_ltrelay_delay+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _Uhav_ltrelay_delay+3
;GWL_batscan.c,3235 :: 		while (1)
L_main657:
;GWL_batscan.c,3245 :: 		triginiput1();
	CALL       _triginiput1+0
;GWL_batscan.c,3246 :: 		triginiput2();
	CALL       _triginiput2+0
;GWL_batscan.c,3248 :: 		if (cellconnectflag==1) {
	MOVF       _cellconnectflag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main659
;GWL_batscan.c,3249 :: 		start_LED();
	CALL       _start_LED+0
;GWL_batscan.c,3250 :: 		EVENT_LED();
	CALL       _EVENT_LED+0
;GWL_batscan.c,3252 :: 		cellconnectflag=2;
	MOVLW      2
	MOVWF      _cellconnectflag+0
;GWL_batscan.c,3253 :: 		}
	GOTO       L_main660
L_main659:
;GWL_batscan.c,3254 :: 		else if (cellconnectflag==2) {
	MOVF       _cellconnectflag+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main661
;GWL_batscan.c,3255 :: 		if (timeticks>LEDstarttime) {
	MOVF       _timeticks+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main971
	MOVF       _timeticks+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main971
	MOVF       _timeticks+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main971
	MOVF       _timeticks+0, 0
	SUBLW      10
L__main971:
	BTFSC      STATUS+0, 0
	GOTO       L_main662
;GWL_batscan.c,3256 :: 		if (TOFFFLAG==1) {
	MOVF       _TOFFFLAG+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main663
;GWL_batscan.c,3257 :: 		for (i=0; i<16; i+=2) {
	CLRF       main_i_L0+0
L_main664:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main665
;GWL_batscan.c,3258 :: 		if (CELL_connect[i]) LED_stat[i]=BLUE;
	MOVLW      _CELL_connect+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main667
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      2
	MOVWF      INDF1+0
L_main667:
;GWL_batscan.c,3259 :: 		if (CELL_connect[i+1]) LED_stat[i+1]=RED;
	MOVF       main_i_L0+0, 0
	ADDLW      1
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      _CELL_connect+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main668
	MOVF       main_i_L0+0, 0
	ADDLW      1
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      _LED_stat+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVLW      1
	MOVWF      INDF1+0
L_main668:
;GWL_batscan.c,3257 :: 		for (i=0; i<16; i+=2) {
	MOVLW      2
	ADDWF      main_i_L0+0, 1
;GWL_batscan.c,3262 :: 		}
	GOTO       L_main664
L_main665:
;GWL_batscan.c,3263 :: 		LED_poll();
	CALL       _LED_poll+0
;GWL_batscan.c,3266 :: 		}
	GOTO       L_main669
L_main663:
;GWL_batscan.c,3270 :: 		if (timeticks>LEDtime) {
	MOVF       _timeticks+3, 0
	SUBWF      _LEdtime+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main972
	MOVF       _timeticks+2, 0
	SUBWF      _LEdtime+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main972
	MOVF       _timeticks+1, 0
	SUBWF      _LEdtime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main972
	MOVF       _timeticks+0, 0
	SUBWF      _LEdtime+0, 0
L__main972:
	BTFSC      STATUS+0, 0
	GOTO       L_main670
;GWL_batscan.c,3272 :: 		if (LEDOFFflag) {
	MOVF       _LEDOFFflag+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main671
;GWL_batscan.c,3273 :: 		if (LEDSTATFLAG==1) {
	MOVF       _LEDSTATFLAG+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main672
;GWL_batscan.c,3274 :: 		LEDSTATFLAG=0;
	CLRF       _LEDSTATFLAG+0
;GWL_batscan.c,3276 :: 		memcpy(&LED_stat,&temp_LED_stat,16);
	MOVLW      _LED_stat+0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FARG_memcpy_d1+1
	MOVLW      _temp_LED_stat+0
	MOVWF      FARG_memcpy_s1+0
	MOVLW      hi_addr(_temp_LED_stat+0)
	MOVWF      FARG_memcpy_s1+1
	MOVLW      16
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;GWL_batscan.c,3279 :: 		LED_stat[GBmaxid]=OFF;
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       _GBmaxid+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,3280 :: 		LED_stat[GBminid]=OFF;
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       _GBminid+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;GWL_batscan.c,3284 :: 		for (i=0; i<16; i++) {
	CLRF       main_i_L0+0
L_main673:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main674
;GWL_batscan.c,3285 :: 		if (GBUminBlock==0) {
	MOVF       _GBUminBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main676
;GWL_batscan.c,3286 :: 		if (GBminid!=i)
	MOVF       _GBminid+0, 0
	XORWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main677
;GWL_batscan.c,3287 :: 		if (CHN_voltageMINEvent[i]==1) LED_stat[i]=RED;
	MOVLW      _CHN_voltageMINEvent+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltageMINEvent+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main678
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      1
	MOVWF      INDF1+0
L_main678:
L_main677:
;GWL_batscan.c,3288 :: 		}
L_main676:
;GWL_batscan.c,3289 :: 		if (GBUmaxBlock==0) {
	MOVF       _GBUmaxBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main679
;GWL_batscan.c,3290 :: 		if (GBmaxid!=i)
	MOVF       _GBmaxid+0, 0
	XORWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main680
;GWL_batscan.c,3291 :: 		if (CHN_voltageMAXEvent[i]==1) LED_stat[i]=BLUE;
	MOVLW      _CHN_voltageMAXEvent+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltageMAXEvent+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main681
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      2
	MOVWF      INDF1+0
L_main681:
L_main680:
;GWL_batscan.c,3292 :: 		}
L_main679:
;GWL_batscan.c,3284 :: 		for (i=0; i<16; i++) {
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3293 :: 		}
	GOTO       L_main673
L_main674:
;GWL_batscan.c,3295 :: 		}
L_main672:
;GWL_batscan.c,3296 :: 		LEDtime=timeticks+LEDOFFTIME;
	MOVLW      50
	ADDWF      _timeticks+0, 0
	MOVWF      _LEdtime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _LEdtime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _LEdtime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _LEdtime+3
;GWL_batscan.c,3297 :: 		}
	GOTO       L_main682
L_main671:
;GWL_batscan.c,3299 :: 		LEDtime=timeticks+LEDONTIME;
	MOVLW      10
	ADDWF      _timeticks+0, 0
	MOVWF      _LEdtime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _LEdtime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _LEdtime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _LEdtime+3
;GWL_batscan.c,3300 :: 		memcpy(&LED_stat,&temp_LED_stat,16);
	MOVLW      _LED_stat+0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FARG_memcpy_d1+1
	MOVLW      _temp_LED_stat+0
	MOVWF      FARG_memcpy_s1+0
	MOVLW      hi_addr(_temp_LED_stat+0)
	MOVWF      FARG_memcpy_s1+1
	MOVLW      16
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;GWL_batscan.c,3301 :: 		if (LEDSTATFLAG==1) {
	MOVF       _LEDSTATFLAG+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main683
;GWL_batscan.c,3302 :: 		LEDSTATFLAG=0;
	CLRF       _LEDSTATFLAG+0
;GWL_batscan.c,3303 :: 		for (i=0; i<16; i++) {
	CLRF       main_i_L0+0
L_main684:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main685
;GWL_batscan.c,3304 :: 		if (GBUminBlock==0) {
	MOVF       _GBUminBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main687
;GWL_batscan.c,3305 :: 		if (CHN_voltageMINEvent[i]==1) LED_stat[i]=OFF;
	MOVLW      _CHN_voltageMINEvent+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltageMINEvent+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main688
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
L_main688:
;GWL_batscan.c,3306 :: 		}
L_main687:
;GWL_batscan.c,3307 :: 		if (GBUmaxBlock==0) {
	MOVF       _GBUmaxBlock+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main689
;GWL_batscan.c,3308 :: 		if (CHN_voltageMAXEvent[i]==1) LED_stat[i]=OFF;
	MOVLW      _CHN_voltageMAXEvent+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltageMAXEvent+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main690
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
L_main690:
;GWL_batscan.c,3309 :: 		}
L_main689:
;GWL_batscan.c,3303 :: 		for (i=0; i<16; i++) {
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3310 :: 		}
	GOTO       L_main684
L_main685:
;GWL_batscan.c,3312 :: 		LED_stat[GBmaxid]=BLUE;
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       _GBmaxid+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      2
	MOVWF      INDF1+0
;GWL_batscan.c,3313 :: 		LED_stat[GBminid]=RED;
	MOVLW      _LED_stat+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_LED_stat+0)
	MOVWF      FSR1H
	MOVF       _GBminid+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      1
	MOVWF      INDF1+0
;GWL_batscan.c,3318 :: 		}
L_main683:
;GWL_batscan.c,3320 :: 		}
L_main682:
;GWL_batscan.c,3322 :: 		LEDOFFflag=!LEDOFFflag;
	MOVF       _LEDOFFflag+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _LEDOFFflag+0
;GWL_batscan.c,3323 :: 		}
L_main670:
;GWL_batscan.c,3325 :: 		LED_poll();
	CALL       _LED_poll+0
;GWL_batscan.c,3327 :: 		}
L_main669:
;GWL_batscan.c,3328 :: 		}
L_main662:
;GWL_batscan.c,3329 :: 		}
L_main661:
L_main660:
;GWL_batscan.c,3331 :: 		push_poll();
	CALL       _push_poll+0
;GWL_batscan.c,3333 :: 		TRISC4_bit=1;
	BSF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;GWL_batscan.c,3334 :: 		TRISC3_bit=1;
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;GWL_batscan.c,3337 :: 		WPUC.WPUC3=1;
	BSF        WPUC+0, 3
;GWL_batscan.c,3339 :: 		if (timeticks>testbuttontime) {
	MOVF       _timeticks+3, 0
	SUBWF      _testbuttontime+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main973
	MOVF       _timeticks+2, 0
	SUBWF      _testbuttontime+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main973
	MOVF       _timeticks+1, 0
	SUBWF      _testbuttontime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main973
	MOVF       _timeticks+0, 0
	SUBWF      _testbuttontime+0, 0
L__main973:
	BTFSC      STATUS+0, 0
	GOTO       L_main691
;GWL_batscan.c,3341 :: 		Umin_button();
	CALL       _Umin_button+0
;GWL_batscan.c,3342 :: 		Umax_button();
	CALL       _Umax_button+0
;GWL_batscan.c,3350 :: 		if (UMIN_WR) {
	MOVF       _UMIN_WR+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main692
;GWL_batscan.c,3351 :: 		WEBPOTMINtimeout=timeticks+600;
	MOVLW      88
	ADDWF      _timeticks+0, 0
	MOVWF      _WEBPOTMINtimeout+0
	MOVLW      2
	ADDWFC     _timeticks+1, 0
	MOVWF      _WEBPOTMINtimeout+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _WEBPOTMINtimeout+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _WEBPOTMINtimeout+3
;GWL_batscan.c,3352 :: 		UMIN_WR=0;
	CLRF       _UMIN_WR+0
;GWL_batscan.c,3353 :: 		}
L_main692:
;GWL_batscan.c,3354 :: 		if (CPMREGDATA[I2C_RUMINPOT]!=0xFFFF) {
	MOVF       _CPMREGDATA+43, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main974
	MOVLW      255
	XORWF      _CPMREGDATA+42, 0
L__main974:
	BTFSC      STATUS+0, 2
	GOTO       L_main693
;GWL_batscan.c,3355 :: 		if (timeticks>WEBPOTMINtimeout) {
	MOVF       _timeticks+3, 0
	SUBWF      _WEBPOTMINtimeout+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main975
	MOVF       _timeticks+2, 0
	SUBWF      _WEBPOTMINtimeout+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main975
	MOVF       _timeticks+1, 0
	SUBWF      _WEBPOTMINtimeout+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main975
	MOVF       _timeticks+0, 0
	SUBWF      _WEBPOTMINtimeout+0, 0
L__main975:
	BTFSC      STATUS+0, 0
	GOTO       L_main694
;GWL_batscan.c,3356 :: 		CPMREGDATA[I2C_RUMINPOT]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+42
	MOVLW      255
	MOVWF      _CPMREGDATA+43
;GWL_batscan.c,3357 :: 		}
L_main694:
;GWL_batscan.c,3358 :: 		}
L_main693:
;GWL_batscan.c,3359 :: 		if (UMAX_WR) {
	MOVF       _UMAX_WR+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main695
;GWL_batscan.c,3360 :: 		WEBPOTMAXtimeout=timeticks+600;
	MOVLW      88
	ADDWF      _timeticks+0, 0
	MOVWF      _WEBPOTMAXtimeout+0
	MOVLW      2
	ADDWFC     _timeticks+1, 0
	MOVWF      _WEBPOTMAXtimeout+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _WEBPOTMAXtimeout+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _WEBPOTMAXtimeout+3
;GWL_batscan.c,3361 :: 		UMAX_WR=0;
	CLRF       _UMAX_WR+0
;GWL_batscan.c,3363 :: 		}
L_main695:
;GWL_batscan.c,3364 :: 		if ( CPMREGDATA[I2C_RUMAXPOT]!=0xFFFF)  {
	MOVF       _CPMREGDATA+45, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main976
	MOVLW      255
	XORWF      _CPMREGDATA+44, 0
L__main976:
	BTFSC      STATUS+0, 2
	GOTO       L_main696
;GWL_batscan.c,3365 :: 		if (timeticks>WEBPOTMAXtimeout) {
	MOVF       _timeticks+3, 0
	SUBWF      _WEBPOTMAXtimeout+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main977
	MOVF       _timeticks+2, 0
	SUBWF      _WEBPOTMAXtimeout+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main977
	MOVF       _timeticks+1, 0
	SUBWF      _WEBPOTMAXtimeout+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main977
	MOVF       _timeticks+0, 0
	SUBWF      _WEBPOTMAXtimeout+0, 0
L__main977:
	BTFSC      STATUS+0, 0
	GOTO       L_main697
;GWL_batscan.c,3366 :: 		CPMREGDATA[I2C_RUMAXPOT]=0xFFFF;
	MOVLW      255
	MOVWF      _CPMREGDATA+44
	MOVLW      255
	MOVWF      _CPMREGDATA+45
;GWL_batscan.c,3367 :: 		}
L_main697:
;GWL_batscan.c,3368 :: 		}
L_main696:
;GWL_batscan.c,3371 :: 		if( CPMREGDATA[I2C_RUMINPOT]==0xFFFF) TGB_Umin=GB_Umin;
	MOVF       _CPMREGDATA+43, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main978
	MOVLW      255
	XORWF      _CPMREGDATA+42, 0
L__main978:
	BTFSS      STATUS+0, 2
	GOTO       L_main698
	MOVF       _GB_Umin+0, 0
	MOVWF      _TGB_Umin+0
	MOVF       _GB_Umin+1, 0
	MOVWF      _TGB_Umin+1
	GOTO       L_main699
L_main698:
;GWL_batscan.c,3373 :: 		TGB_Umin=GB_Umin;
	MOVF       _GB_Umin+0, 0
	MOVWF      _TGB_Umin+0
	MOVF       _GB_Umin+1, 0
	MOVWF      _TGB_Umin+1
;GWL_batscan.c,3374 :: 		GB_Umin=CPMREGDATA[I2C_RUMINPOT];
	MOVF       _CPMREGDATA+42, 0
	MOVWF      _GB_Umin+0
	MOVF       _CPMREGDATA+43, 0
	MOVWF      _GB_Umin+1
;GWL_batscan.c,3375 :: 		GB_Uhavmin=GB_Umin-Uhavmindiff;
	MOVLW      44
	SUBWF      _CPMREGDATA+42, 0
	MOVWF      _GB_Uhavmin+0
	MOVLW      1
	SUBWFB     _CPMREGDATA+43, 0
	MOVWF      _GB_Uhavmin+1
;GWL_batscan.c,3376 :: 		debug_print_strROM("\r\nREMOTEPOMIN!:");
	MOVLW      ?lstr_43_GWL_batscan+0
	MOVWF      FARG_debug_print_strROM_s+0
	MOVLW      hi_addr(?lstr_43_GWL_batscan+0)
	MOVWF      FARG_debug_print_strROM_s+1
	CALL       _debug_print_strROM+0
;GWL_batscan.c,3377 :: 		debug_print_hex_u16( GB_Umin);
	MOVF       _GB_Umin+0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       _GB_Umin+1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,3378 :: 		debug_print_hex_u16( GB_Uhavmin);
	MOVF       _GB_Uhavmin+0, 0
	MOVWF      FARG_debug_print_hex_u16_byte+0
	MOVF       _GB_Uhavmin+1, 0
	MOVWF      FARG_debug_print_hex_u16_byte+1
	CALL       _debug_print_hex_u16+0
;GWL_batscan.c,3380 :: 		}
L_main699:
;GWL_batscan.c,3381 :: 		if( CPMREGDATA[I2C_RUMAXPOT]==0xFFFF) TGB_Umax=GB_Umax;
	MOVF       _CPMREGDATA+45, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main979
	MOVLW      255
	XORWF      _CPMREGDATA+44, 0
L__main979:
	BTFSS      STATUS+0, 2
	GOTO       L_main700
	MOVF       _GB_Umax+0, 0
	MOVWF      _TGB_Umax+0
	MOVF       _GB_Umax+1, 0
	MOVWF      _TGB_Umax+1
	GOTO       L_main701
L_main700:
;GWL_batscan.c,3383 :: 		TGB_Umax=GB_Umax;
	MOVF       _GB_Umax+0, 0
	MOVWF      _TGB_Umax+0
	MOVF       _GB_Umax+1, 0
	MOVWF      _TGB_Umax+1
;GWL_batscan.c,3384 :: 		GB_Umax=CPMREGDATA[I2C_RUMAXPOT];
	MOVF       _CPMREGDATA+44, 0
	MOVWF      _GB_Umax+0
	MOVF       _CPMREGDATA+45, 0
	MOVWF      _GB_Umax+1
;GWL_batscan.c,3385 :: 		GB_Uhavmax=GB_Umax+Uhavmaxdiff;
	MOVLW      44
	ADDWF      _CPMREGDATA+44, 0
	MOVWF      _GB_Uhavmax+0
	MOVLW      1
	ADDWFC     _CPMREGDATA+45, 0
	MOVWF      _GB_Uhavmax+1
;GWL_batscan.c,3387 :: 		}
L_main701:
;GWL_batscan.c,3390 :: 		CPMREGDATA[I2C_UMINPOT]=TGB_Umin;
	MOVF       _TGB_Umin+0, 0
	MOVWF      _CPMREGDATA+38
	MOVF       _TGB_Umin+1, 0
	MOVWF      _CPMREGDATA+39
;GWL_batscan.c,3391 :: 		CPMREGDATA[I2C_UMAXPOT]=TGB_Umax;
	MOVF       _TGB_Umax+0, 0
	MOVWF      _CPMREGDATA+40
	MOVF       _TGB_Umax+1, 0
	MOVWF      _CPMREGDATA+41
;GWL_batscan.c,3393 :: 		if (CPMREGDATA[I2C_TURNOFF]==0x0001) {
	MOVLW      0
	XORWF      _CPMREGDATA+65, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main980
	MOVLW      1
	XORWF      _CPMREGDATA+64, 0
L__main980:
	BTFSS      STATUS+0, 2
	GOTO       L_main702
;GWL_batscan.c,3394 :: 		debug_print_strROM("\r\nVYPINAME I2c!");
	MOVLW      ?lstr_44_GWL_batscan+0
	MOVWF      FARG_debug_print_strROM_s+0
	MOVLW      hi_addr(?lstr_44_GWL_batscan+0)
	MOVWF      FARG_debug_print_strROM_s+1
	CALL       _debug_print_strROM+0
;GWL_batscan.c,3397 :: 		set_Uhav_OUTPUT(CELLUHAVFAIL);
	CLRF       FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,3398 :: 		set_Umin_LT_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin_LT_OUTPUT_status+0
	CALL       _set_Umin_LT_OUTPUT+0
;GWL_batscan.c,3399 :: 		set_Umax_LT_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax_LT_OUTPUT_status+0
	CALL       _set_Umax_LT_OUTPUT+0
;GWL_batscan.c,3400 :: 		PWRUP=0;
	BCF        LATF+0, 4
;GWL_batscan.c,3401 :: 		delay_ms(2000);
	MOVLW      82
	MOVWF      R11
	MOVLW      43
	MOVWF      R12
	MOVLW      0
	MOVWF      R13
L_main703:
	DECFSZ     R13, 1
	GOTO       L_main703
	DECFSZ     R12, 1
	GOTO       L_main703
	DECFSZ     R11, 1
	GOTO       L_main703
	NOP
;GWL_batscan.c,3402 :: 		PWRUP_IN();
	BSF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,3403 :: 		}
L_main702:
;GWL_batscan.c,3404 :: 		if (CPMREGDATA[I2C_RESET]==0x0001) {
	MOVLW      0
	XORWF      _CPMREGDATA+63, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main981
	MOVLW      1
	XORWF      _CPMREGDATA+62, 0
L__main981:
	BTFSS      STATUS+0, 2
	GOTO       L_main704
;GWL_batscan.c,3405 :: 		init_outputstatus();
	CALL       _init_outputstatus+0
;GWL_batscan.c,3406 :: 		CPMREGDATA[I2C_RESET]=0;
	CLRF       _CPMREGDATA+62
	CLRF       _CPMREGDATA+63
;GWL_batscan.c,3407 :: 		debug_print_strROM("\r\nRESETUJEME I2c!");
	MOVLW      ?lstr_45_GWL_batscan+0
	MOVWF      FARG_debug_print_strROM_s+0
	MOVLW      hi_addr(?lstr_45_GWL_batscan+0)
	MOVWF      FARG_debug_print_strROM_s+1
	CALL       _debug_print_strROM+0
;GWL_batscan.c,3408 :: 		events_reset();
	CALL       _events_reset+0
;GWL_batscan.c,3409 :: 		}
L_main704:
;GWL_batscan.c,3411 :: 		CPMOUTPUTGETREG();
	CALL       _CPMOUTPUTGETREG+0
;GWL_batscan.c,3412 :: 		if (UhavOKstatus==CELLUHAVFAIL) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]&~0x8000;}
	MOVF       _UhavOKstatus+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main705
	MOVLW      255
	ANDWF      _CPMREGDATA+36, 1
	MOVLW      127
	ANDWF      _CPMREGDATA+37, 1
	GOTO       L_main706
L_main705:
;GWL_batscan.c,3413 :: 		else if (UhavOKstatus==CELLUHAVOK) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]|0x8000;}
	MOVF       _UhavOKstatus+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main707
	BSF        _CPMREGDATA+37, 7
L_main707:
L_main706:
;GWL_batscan.c,3414 :: 		if (UminOKstatus==CELLUMINFAIL) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]&~0x4000;}
	MOVF       _UminOKstatus+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main708
	BCF        _CPMREGDATA+37, 6
	GOTO       L_main709
L_main708:
;GWL_batscan.c,3415 :: 		else if (UminOKstatus==CELLUMINOK) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]|0x4000;}
	MOVF       _UminOKstatus+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main710
	BSF        _CPMREGDATA+37, 6
L_main710:
L_main709:
;GWL_batscan.c,3416 :: 		if (UmaxOKstatus==CELLUMAXFAIL) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]&~0x2000;}
	MOVF       _UmaxOKstatus+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main711
	BCF        _CPMREGDATA+37, 5
	GOTO       L_main712
L_main711:
;GWL_batscan.c,3417 :: 		else if (UmaxOKstatus==CELLUMAXOK) {CPMREGDATA[I2C_EVENTS]=CPMREGDATA[I2C_EVENTS]|0x2000;}
	MOVF       _UmaxOKstatus+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main713
	BSF        _CPMREGDATA+37, 5
L_main713:
L_main712:
;GWL_batscan.c,3419 :: 		if (GB_Umin>=GB_Umax) MAXMINFLAG=1;
	MOVF       _GB_Umax+1, 0
	SUBWF      _GB_Umin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main982
	MOVF       _GB_Umax+0, 0
	SUBWF      _GB_Umin+0, 0
L__main982:
	BTFSS      STATUS+0, 0
	GOTO       L_main714
	MOVLW      1
	MOVWF      _MAXMINFLAG+0
	GOTO       L_main715
L_main714:
;GWL_batscan.c,3420 :: 		else MAXMINFLAG=0;
	CLRF       _MAXMINFLAG+0
L_main715:
;GWL_batscan.c,3423 :: 		testbuttontime=timeticks+5;
	MOVLW      5
	ADDWF      _timeticks+0, 0
	MOVWF      _testbuttontime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _testbuttontime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _testbuttontime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _testbuttontime+3
;GWL_batscan.c,3425 :: 		DAC_poll();
	CALL       _DAC_poll+0
;GWL_batscan.c,3426 :: 		OUTPUT_poll();
	CALL       _OUTPUT_poll+0
;GWL_batscan.c,3429 :: 		DELAY_poll();
	CALL       _DELAY_poll+0
;GWL_batscan.c,3435 :: 		}
L_main691:
;GWL_batscan.c,3436 :: 		if (!startupflag) {
	MOVF       _startupflag+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main716
;GWL_batscan.c,3437 :: 		if (timeticks>STARTUPTIME) {
	MOVF       _timeticks+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main983
	MOVF       _timeticks+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main983
	MOVF       _timeticks+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main983
	MOVF       _timeticks+0, 0
	SUBLW      100
L__main983:
	BTFSC      STATUS+0, 0
	GOTO       L_main717
;GWL_batscan.c,3438 :: 		startupflag=1;
	MOVLW      1
	MOVWF      _startupflag+0
;GWL_batscan.c,3440 :: 		}
L_main717:
;GWL_batscan.c,3442 :: 		}
L_main716:
;GWL_batscan.c,3443 :: 		if ((DLDISCflag==1) || (TOFFFLAG==1) || (DISCONNECTFLAG==1) || (MISSEDINTERCELLFLAG==1) || (MAXMINFLAG==1)) {
	MOVF       _DLDISCflag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main788
	MOVF       _TOFFFLAG+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main788
	MOVF       _DISCONNECTFLAG+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main788
	MOVF       _MISSEDINTERCELLFLAG+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main788
	MOVF       _MAXMINFLAG+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main788
	GOTO       L_main720
L__main788:
;GWL_batscan.c,3445 :: 		if (timeticks>Discontime) {
	MOVF       _timeticks+3, 0
	SUBWF      _discontime+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main984
	MOVF       _timeticks+2, 0
	SUBWF      _discontime+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main984
	MOVF       _timeticks+1, 0
	SUBWF      _discontime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main984
	MOVF       _timeticks+0, 0
	SUBWF      _discontime+0, 0
L__main984:
	BTFSC      STATUS+0, 0
	GOTO       L_main721
;GWL_batscan.c,3446 :: 		debug_print_str("\r\nVHAV:");
	MOVLW      ?lstr46_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr46_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3447 :: 		debug_print_hex_u8(MAXMINFLAG);
	MOVF       _MAXMINFLAG+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3448 :: 		debug_print_hex_u8(DLDISCflag);
	MOVF       _DLDISCflag+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3449 :: 		debug_print_hex_u8(DISCflag);
	MOVF       _DISCflag+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3450 :: 		debug_print_hex_u8(TOFFFLAG);
	MOVF       _TOFFFLAG+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3451 :: 		debug_print_hex_u8(DISCONNECTFLAG);
	MOVF       _DISCONNECTFLAG+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3452 :: 		debug_print_hex_u8(MISSEDINTERCELLFLAG);
	MOVF       _MISSEDINTERCELLFLAG+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3454 :: 		set_Uhav_OUTPUT(CELLUHAVFAIL);
	CLRF       FARG_set_Uhav_OUTPUT_status+0
	CALL       _set_Uhav_OUTPUT+0
;GWL_batscan.c,3456 :: 		set_Umin_LT_OUTPUT(CELLUMINFAIL);
	CLRF       FARG_set_Umin_LT_OUTPUT_status+0
	CALL       _set_Umin_LT_OUTPUT+0
;GWL_batscan.c,3457 :: 		set_Umax_LT_OUTPUT(CELLUMAXFAIL);
	CLRF       FARG_set_Umax_LT_OUTPUT_status+0
	CALL       _set_Umax_LT_OUTPUT+0
;GWL_batscan.c,3461 :: 		debug_print_str("\r\nUHAVFAIL");
	MOVLW      ?lstr47_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr47_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3462 :: 		delay_ms(100);
	MOVLW      5
	MOVWF      R11
	MOVLW      15
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L_main722:
	DECFSZ     R13, 1
	GOTO       L_main722
	DECFSZ     R12, 1
	GOTO       L_main722
	DECFSZ     R11, 1
	GOTO       L_main722
;GWL_batscan.c,3465 :: 		PWRUP=0;
	BCF        LATF+0, 4
;GWL_batscan.c,3466 :: 		delay_ms(2000);
	MOVLW      82
	MOVWF      R11
	MOVLW      43
	MOVWF      R12
	MOVLW      0
	MOVWF      R13
L_main723:
	DECFSZ     R13, 1
	GOTO       L_main723
	DECFSZ     R12, 1
	GOTO       L_main723
	DECFSZ     R11, 1
	GOTO       L_main723
	NOP
;GWL_batscan.c,3467 :: 		PWRUP_IN();
	BSF        TRISF4_bit+0, BitPos(TRISF4_bit+0)
;GWL_batscan.c,3469 :: 		}
L_main721:
;GWL_batscan.c,3470 :: 		}
L_main720:
;GWL_batscan.c,3473 :: 		if (timeticks>testtime) {
	MOVF       _timeticks+3, 0
	SUBWF      _testtime+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main985
	MOVF       _timeticks+2, 0
	SUBWF      _testtime+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main985
	MOVF       _timeticks+1, 0
	SUBWF      _testtime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main985
	MOVF       _timeticks+0, 0
	SUBWF      _testtime+0, 0
L__main985:
	BTFSC      STATUS+0, 0
	GOTO       L_main724
;GWL_batscan.c,3476 :: 		if ((CELL_connect[0]==0) || (CELL_connect[1]==0) ||
	MOVF       _CELL_connect+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main787
	MOVF       _CELL_connect+1, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main787
;GWL_batscan.c,3477 :: 		(CELL_connect[2]==0) || (CELL_connect[3]==0))  {
	MOVF       _CELL_connect+2, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main787
	MOVF       _CELL_connect+3, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main787
	GOTO       L_main727
L__main787:
;GWL_batscan.c,3478 :: 		MISSEDINTERCELLFLAG=1;
	MOVLW      1
	MOVWF      _MISSEDINTERCELLFLAG+0
;GWL_batscan.c,3479 :: 		debug_print_str("\r\nMISSEDBUTTONCELLFLAG1!:");
	MOVLW      ?lstr48_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr48_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3480 :: 		debug_print_hex_u8(CELL_connect[0]);
	MOVF       _CELL_connect+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3481 :: 		debug_print_hex_u8(CELL_connect[1]);
	MOVF       _CELL_connect+1, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3482 :: 		debug_print_hex_u8(CELL_connect[2]);
	MOVF       _CELL_connect+2, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3483 :: 		debug_print_hex_u8(CELL_connect[3]);
	MOVF       _CELL_connect+3, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3484 :: 		}
L_main727:
;GWL_batscan.c,3486 :: 		if (MISSEDBUTTONFLAG==1) {
	MOVF       _MISSEDBUTTONFLAG+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main728
;GWL_batscan.c,3487 :: 		debug_print_str("\r\nMISSEDBUTTONCELLFLAG2!");
	MOVLW      ?lstr49_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr49_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3488 :: 		MISSEDINTERCELLFLAG=1;
	MOVLW      1
	MOVWF      _MISSEDINTERCELLFLAG+0
;GWL_batscan.c,3489 :: 		}
L_main728:
;GWL_batscan.c,3492 :: 		debug_print_str("\r\n\r\nVMIN:");
	MOVLW      ?lstr50_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr50_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3493 :: 		debug_print_udec(GB_Umin);
	MOVF       _GB_Umin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Umin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3494 :: 		debug_print_str("   VMAX:");
	MOVLW      ?lstr51_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr51_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3495 :: 		debug_print_udec(GB_Umax);
	MOVF       _GB_Umax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Umax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3496 :: 		debug_print_str("   REALMIN:");
	MOVLW      ?lstr52_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr52_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3497 :: 		debug_print_udec(testUmin);
	MOVF       _testUmin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _testUmin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3498 :: 		debug_print_str("   REALMAX:");
	MOVLW      ?lstr53_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr53_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3499 :: 		debug_print_udec(testUmax);
	MOVF       _testUmax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _testUmax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3502 :: 		debug_print_str(" UMAXID:");
	MOVLW      ?lstr54_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr54_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3503 :: 		debug_print_hex_u8(Umax_button());
	CALL       _Umax_button+0
	MOVF       R0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3504 :: 		debug_print_str(" UMINID:");
	MOVLW      ?lstr55_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr55_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3505 :: 		debug_print_hex_u8(Umin_button());
	CALL       _Umin_button+0
	MOVF       R0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3507 :: 		debug_print_str("   UHAVMIN:");
	MOVLW      ?lstr56_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr56_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3508 :: 		debug_print_udec(GB_Uhavmin);
	MOVF       _GB_Uhavmin+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Uhavmin+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3510 :: 		debug_print_str("   UHAVMAX:");
	MOVLW      ?lstr57_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr57_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3511 :: 		debug_print_udec(GB_Uhavmax);
	MOVF       _GB_Uhavmax+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	MOVF       _GB_Uhavmax+1, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3513 :: 		debug_print_str("  NCEL:");
	MOVLW      ?lstr58_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr58_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3514 :: 		debug_print_hex_u8(Missed_cell_ID);
	MOVF       _Missed_cell_ID+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3515 :: 		debug_print_str("  BCA:");
	MOVLW      ?lstr59_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr59_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3517 :: 		for (i=0; i<16; i++){
	CLRF       main_i_L0+0
L_main729:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main730
;GWL_batscan.c,3518 :: 		debug_print_hex_u8(CELL_connect[i]);
	MOVLW      _CELL_connect+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CELL_connect+0)
	MOVWF      FSR0H
	MOVF       main_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3517 :: 		for (i=0; i<16; i++){
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3520 :: 		}
	GOTO       L_main729
L_main730:
;GWL_batscan.c,3521 :: 		for (i=0; i<16; i++){
	CLRF       main_i_L0+0
L_main732:
	MOVLW      16
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main733
;GWL_batscan.c,3522 :: 		debug_print_str("  VCHN:");
	MOVLW      ?lstr60_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr60_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3523 :: 		debug_print_hex_u8(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3524 :: 		debug_print_str("=");
	MOVLW      ?lstr61_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr61_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3525 :: 		debug_print_udec(CHN_voltage[i]);
	MOVF       main_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _CHN_voltage+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_CHN_voltage+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_print_udec_prd+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_debug_print_udec_prd+1
	CALL       _debug_print_udec+0
;GWL_batscan.c,3521 :: 		for (i=0; i<16; i++){
	INCF       main_i_L0+0, 1
;GWL_batscan.c,3530 :: 		}
	GOTO       L_main732
L_main733:
;GWL_batscan.c,3532 :: 		debug_print_str("\r\nCUMAXWAIT:");
	MOVLW      ?lstr62_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr62_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3533 :: 		debug_print_hex_u8(CONDUMAXWAIT);
	MOVF       _CONDUMAXWAIT+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3534 :: 		debug_print_str(" CUMAXNOW:");
	MOVLW      ?lstr63_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr63_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3535 :: 		debug_print_hex_u8(CONDUMAXNOW);
	MOVF       _CONDUMAXNOW+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3536 :: 		debug_print_str(" CUMINWAIT:");
	MOVLW      ?lstr64_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr64_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3537 :: 		debug_print_hex_u8(CONDUMINWAIT);
	MOVF       _CONDUMINWAIT+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3538 :: 		debug_print_str(" CUNDERMIN:");
	MOVLW      ?lstr65_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr65_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3539 :: 		debug_print_hex_u8(CELLUNDERMIN);
	MOVF       _CELLUNDERMIN+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3540 :: 		debug_print_str(" CABOVMAX:");
	MOVLW      ?lstr66_GWL_batscan+0
	MOVWF      FARG_debug_print_str_s+0
	MOVLW      hi_addr(?lstr66_GWL_batscan+0)
	MOVWF      FARG_debug_print_str_s+1
	CALL       _debug_print_str+0
;GWL_batscan.c,3541 :: 		debug_print_hex_u8(CELLABOVEMAX);
	MOVF       _CELLABOVEMAX+0, 0
	MOVWF      FARG_debug_print_hex_u8_byt+0
	CALL       _debug_print_hex_u8+0
;GWL_batscan.c,3547 :: 		testtime=timeticks+50L;
	MOVLW      50
	ADDWF      _timeticks+0, 0
	MOVWF      _testtime+0
	MOVLW      0
	ADDWFC     _timeticks+1, 0
	MOVWF      _testtime+1
	MOVLW      0
	ADDWFC     _timeticks+2, 0
	MOVWF      _testtime+2
	MOVLW      0
	ADDWFC     _timeticks+3, 0
	MOVWF      _testtime+3
;GWL_batscan.c,3550 :: 		}
L_main724:
;GWL_batscan.c,3551 :: 		TEST_CELL_poll();
	CALL       _TEST_CELL_poll+0
;GWL_batscan.c,3554 :: 		}
	GOTO       L_main657
;GWL_batscan.c,3556 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
