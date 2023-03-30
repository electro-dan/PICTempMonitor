;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.97
;// License Type  : Lite License (Unregistered)
;// Limitations   : PIC12,PIC16 max code size:2048 words, max RAM banks:2, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F628A.inc"
; Heap block 0, size:95 (0x000000A0 - 0x000000FE)
__HEAP_BLOCK0_BANK               EQU	0x00000001
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000020
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000007E
; Heap block 1, size:17 (0x0000005F - 0x0000006F)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x0000005F
__HEAP_BLOCK1_END_OFFSET         EQU	0x0000006F
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
gbl_status                       EQU	0x00000003 ; bytes:1
__mul_16s__0000E_arg_a           EQU	0x00000052 ; bytes:2
__mul_16s__0000E_arg_b           EQU	0x00000054 ; bytes:2
CompTempVarRet384                EQU	0x0000005B ; bytes:2
__mul_16s__0000E_1_i             EQU	0x00000058 ; bytes:1
__mul_16s__0000E_1_t             EQU	0x00000059 ; bytes:2
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_porta                        EQU	0x00000005 ; bytes:1
gbl_portb                        EQU	0x00000006 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_tmr2                         EQU	0x00000011 ; bytes:1
gbl_t2con                        EQU	0x00000012 ; bytes:1
gbl_ccpr1l                       EQU	0x00000015 ; bytes:1
gbl_ccpr1h                       EQU	0x00000016 ; bytes:1
gbl_ccp1con                      EQU	0x00000017 ; bytes:1
gbl_rcsta                        EQU	0x00000018 ; bytes:1
gbl_txreg                        EQU	0x00000019 ; bytes:1
gbl_rcreg                        EQU	0x0000001A ; bytes:1
gbl_cmcon                        EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisa                        EQU	0x00000085 ; bytes:1
gbl_trisb                        EQU	0x00000086 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_pr2                          EQU	0x00000092 ; bytes:1
gbl_txsta                        EQU	0x00000098 ; bytes:1
gbl_spbrg                        EQU	0x00000099 ; bytes:1
gbl_eedata                       EQU	0x0000009A ; bytes:1
gbl_eeadr                        EQU	0x0000009B ; bytes:1
gbl_eecon1                       EQU	0x0000009C ; bytes:1
gbl_eecon2                       EQU	0x0000009D ; bytes:1
gbl_vrcon                        EQU	0x0000009F ; bytes:1
gbl_bUnitButtonPrev              EQU	0x00000043 ; bytes:1
gbl_cTempH                       EQU	0x00000044 ; bytes:1
gbl_cTempL                       EQU	0x00000045 ; bytes:1
gbl_arrSegments0                 EQU	0x00000020 ; bytes:12
gbl_arrSegments1                 EQU	0x0000002C ; bytes:12
gbl_arrDigits                    EQU	0x00000038 ; bytes:4
gbl_arrTemp                      EQU	0x0000003C ; bytes:4
gbl_iDecimalPosition             EQU	0x00000046 ; bytes:1
gbl_iDigitCounter                EQU	0x00000047 ; bytes:1
gbl_iTempUnit                    EQU	0x00000048 ; bytes:1
gbl_cTask                        EQU	0x00000049 ; bytes:1
gbl_iTimer1Count                 EQU	0x0000004A ; bytes:1
gbl_oneWireIsPresent             EQU	0x0000004B ; bytes:1
gbl_oneWireResetStage            EQU	0x0000004C ; bytes:1
oneWireBus_00013_1_isPresent     EQU	0x0000004D ; bytes:1
oneWireTxB_00016_arg_cData       EQU	0x0000004F ; bytes:1
oneWireTxB_00016_1_cTemp         EQU	0x00000050 ; bytes:1
oneWireTxB_00016_1_i             EQU	0x00000051 ; bytes:1
oneWireTxB_00017_arg_cData       EQU	0x0000004D ; bytes:1
oneWireTxB_00017_arg_cData2      EQU	0x0000004E ; bytes:1
CompTempVarRet579                EQU	0x0000004F ; bytes:1
oneWireRxB_00018_1_cDataIn       EQU	0x0000004D ; bytes:1
oneWireRxB_00018_1_i             EQU	0x0000004E ; bytes:1
displayVal_00019_arg_iDigit      EQU	0x0000004D ; bytes:1
displayVal_00019_1_cDig          EQU	0x0000004E ; bytes:1
storeTempD_0001B_arg_iValue      EQU	0x00000058 ; bytes:2
storeTempD_0001B_1_cDig3         EQU	0x0000005A ; bytes:1
storeTempD_0001B_1_cDig2         EQU	0x0000005B ; bytes:1
storeTempD_0001B_1_cDig1         EQU	0x0000005C ; bytes:1
storeTempD_0001B_1_cDig0         EQU	0x0000005D ; bytes:1
CompTempVar586                   EQU	0x0000005E ; bytes:1
CompTempVar589                   EQU	0x0000005E ; bytes:1
storeTemp_00000_1_iTemp          EQU	0x0000004D ; bytes:2
storeTemp_00000_3_isMinus        EQU	0x0000004F ; bytes:1
storeTemp_00000_3_iTempC         EQU	0x00000050 ; bytes:2
CompTempVar601                   EQU	0x00000056 ; bytes:1
CompTempVar604                   EQU	0x00000057 ; bytes:1
storeTemp_00000_16_iTempF        EQU	0x0000004F ; bytes:2
CompTempVar619                   EQU	0x00000051 ; bytes:1
CompTempVar621                   EQU	0x00000052 ; bytes:1
storeTemp_00000_16_isMinus       EQU	0x00000053 ; bytes:1
delay_us_00000_arg_del           EQU	0x0000004F ; bytes:1
delay_10us_00000_arg_del         EQU	0x00000052 ; bytes:1
delay_ms_00000_arg_del           EQU	0x0000004E ; bytes:1
delay_s_00000_arg_del            EQU	0x0000004D ; bytes:1
Int1Context                      EQU	0x0000007F ; bytes:1
Int1BContext                     EQU	0x00000040 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
delay_us_00000
; { delay_us ; function begin
	MOVLW 0x03
	ADDWF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	MOVLW 0x7F
	ANDWF delay_us_00000_arg_del, F
label1
	NOP
	DECFSZ delay_us_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_us function end

	ORG 0x0000001A
delay_10us_00000
; { delay_10us ; function begin
label2
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DECFSZ delay_10us_00000_arg_del, F
	GOTO	label2
	RETURN
; } delay_10us function end

	ORG 0x00000024
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label3
	RETURN
label3
	MOVLW 0xF9
label4
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label4
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label3
	RETURN
; } delay_ms function end

	ORG 0x00000030
delay_s_00000
; { delay_s ; function begin
label5
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	DECFSZ delay_s_00000_arg_del, F
	GOTO	label5
	RETURN
; } delay_s function end

	ORG 0x0000003F
storeTempD_0001B
; { storeTempDigits4 ; function begin
	CLRF storeTempD_0001B_1_cDig3
	CLRF storeTempD_0001B_1_cDig2
	CLRF storeTempD_0001B_1_cDig1
	CLRF storeTempD_0001B_1_cDig0
label6
	MOVLW 0x03
	SUBWF storeTempD_0001B_arg_iValue+D'1', W
	BTFSS STATUS,Z
	GOTO	label7
	MOVLW 0xE8
	SUBWF storeTempD_0001B_arg_iValue, W
label7
	BTFSS STATUS,C
	GOTO	label8
	BTFSC storeTempD_0001B_arg_iValue+D'1',7
	GOTO	label8
	MOVLW 0xE8
	SUBWF storeTempD_0001B_arg_iValue, F
	MOVLW 0x03
	BTFSS STATUS,C
	MOVLW 0x04
	SUBWF storeTempD_0001B_arg_iValue+D'1', F
	INCF storeTempD_0001B_1_cDig3, F
	GOTO	label6
label8
	MOVF storeTempD_0001B_arg_iValue+D'1', W
	XORLW 0x80
	MOVWF CompTempVar586
	MOVLW 0x80
	SUBWF CompTempVar586, W
	BTFSS STATUS,Z
	GOTO	label9
	MOVLW 0x64
	SUBWF storeTempD_0001B_arg_iValue, W
label9
	BTFSS STATUS,C
	GOTO	label10
	MOVLW 0x64
	SUBWF storeTempD_0001B_arg_iValue, F
	MOVF storeTempD_0001B_arg_iValue+D'1', F
	BTFSS STATUS,C
	DECF storeTempD_0001B_arg_iValue+D'1', F
	INCF storeTempD_0001B_1_cDig2, F
	GOTO	label8
label10
	MOVF storeTempD_0001B_arg_iValue+D'1', W
	XORLW 0x80
	MOVWF CompTempVar589
	MOVLW 0x80
	SUBWF CompTempVar589, W
	BTFSS STATUS,Z
	GOTO	label11
	MOVLW 0x0A
	SUBWF storeTempD_0001B_arg_iValue, W
label11
	BTFSS STATUS,C
	GOTO	label12
	MOVLW 0x0A
	SUBWF storeTempD_0001B_arg_iValue, F
	MOVF storeTempD_0001B_arg_iValue+D'1', F
	BTFSS STATUS,C
	DECF storeTempD_0001B_arg_iValue+D'1', F
	INCF storeTempD_0001B_1_cDig1, F
	GOTO	label10
label12
	MOVF storeTempD_0001B_arg_iValue, W
	MOVWF storeTempD_0001B_1_cDig0
	MOVF storeTempD_0001B_1_cDig3, F
	BTFSS STATUS,Z
	GOTO	label13
	MOVLW 0x0B
	MOVWF storeTempD_0001B_1_cDig3
	MOVF storeTempD_0001B_1_cDig2, F
	BTFSS STATUS,Z
	GOTO	label13
	DECF gbl_iDecimalPosition, W
	BTFSS STATUS,Z
	GOTO	label13
	MOVLW 0x0B
	MOVWF storeTempD_0001B_1_cDig2
label13
	MOVF storeTempD_0001B_1_cDig3, W
	MOVWF gbl_arrTemp+D'3'
	MOVF storeTempD_0001B_1_cDig2, W
	MOVWF gbl_arrTemp+D'2'
	MOVF storeTempD_0001B_1_cDig1, W
	MOVWF gbl_arrTemp+D'1'
	MOVF storeTempD_0001B_1_cDig0, W
	MOVWF gbl_arrTemp
	RETURN
; } storeTempDigits4 function end

	ORG 0x00000091
oneWireTxB_00016
; { oneWireTxByte ; function begin
	MOVLW 0x01
	MOVWF oneWireTxB_00016_1_cTemp
	CLRF oneWireTxB_00016_1_i
label14
	MOVLW 0x08
	SUBWF oneWireTxB_00016_1_i, W
	BTFSC STATUS,C
	RETURN
	BSF STATUS, RP0
	BCF gbl_trisa,2
	BCF STATUS, RP0
	BCF gbl_porta,2
	MOVF oneWireTxB_00016_1_cTemp, W
	ANDWF oneWireTxB_00016_arg_cData, W
	BTFSC STATUS,Z
	GOTO	label15
	BSF STATUS, RP0
	BSF gbl_trisa,2
label15
	MOVLW 0x05
	BCF STATUS, RP0
	MOVWF delay_10us_00000_arg_del
	CALL delay_10us_00000
	BSF STATUS, RP0
	BSF gbl_trisa,2
	BCF STATUS,C
	BCF STATUS, RP0
	RLF oneWireTxB_00016_1_cTemp, F
	INCF oneWireTxB_00016_1_i, F
	GOTO	label14
; } oneWireTxByte function end

	ORG 0x000000AD
displayVal_00019
; { displayValue ; function begin
	MOVLW 0x3C
	ANDWF gbl_porta, W
	ADDLW 0xC3
	MOVWF gbl_porta
	MOVLW 0x05
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF	STATUS,IRP
	MOVLW LOW(gbl_arrTemp+D'0')
	MOVWF FSR
	MOVF displayVal_00019_arg_iDigit, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF displayVal_00019_1_cDig
	MOVF displayVal_00019_arg_iDigit, F
	BTFSC STATUS,Z
	GOTO	label16
	MOVF displayVal_00019_arg_iDigit, W
	XORLW 0x02
	BTFSS STATUS,Z
	GOTO	label18
label16
	BCF	STATUS,IRP
	MOVLW LOW(gbl_arrSegments0+D'0')
	MOVWF FSR
	MOVF displayVal_00019_1_cDig, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF gbl_portb
	MOVF gbl_iDecimalPosition, W
	XORWF displayVal_00019_arg_iDigit, W
	BTFSC STATUS,Z
	GOTO	label17
	MOVF gbl_iTempUnit, W
	XORWF displayVal_00019_arg_iDigit, W
	BTFSS STATUS,Z
	GOTO	label19
label17
	MOVLW 0x10
	SUBWF gbl_portb, F
	GOTO	label19
label18
	BCF	STATUS,IRP
	MOVLW LOW(gbl_arrSegments1+D'0')
	MOVWF FSR
	MOVF displayVal_00019_1_cDig, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF gbl_portb
	MOVF gbl_iDecimalPosition, W
	XORWF displayVal_00019_arg_iDigit, W
	BTFSS STATUS,Z
	GOTO	label19
	MOVLW 0x80
	SUBWF gbl_portb, F
label19
	BCF	STATUS,IRP
	MOVLW LOW(gbl_arrDigits+D'0')
	MOVWF FSR
	MOVF displayVal_00019_arg_iDigit, W
	ADDWF FSR, F
	MOVLW 0x3C
	ANDWF gbl_porta, W
	ADDWF INDF, W
	MOVWF gbl_porta
	MOVLW 0x05
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	RETURN
; } displayValue function end

	ORG 0x000000EE
__mul_16s__0000E
; { __mul_16s_16s__16 ; function begin
	CLRF __mul_16s__0000E_1_i
	CLRF CompTempVarRet384
	CLRF CompTempVarRet384+D'1'
	MOVF __mul_16s__0000E_arg_a, W
	MOVWF __mul_16s__0000E_1_t
	MOVF __mul_16s__0000E_arg_a+D'1', W
	MOVWF __mul_16s__0000E_1_t+D'1'
	BTFSS __mul_16s__0000E_arg_b+D'1',7
	GOTO	label20
	BSF __mul_16s__0000E_1_i,7
	COMF __mul_16s__0000E_arg_b, F
	COMF __mul_16s__0000E_arg_b+D'1', F
	INCF __mul_16s__0000E_arg_b, F
	BTFSC gbl_status,2
	INCF __mul_16s__0000E_arg_b+D'1', F
label20
	BTFSC __mul_16s__0000E_1_i,4
	GOTO	label22
	BTFSS __mul_16s__0000E_arg_b,0
	GOTO	label21
	MOVF __mul_16s__0000E_1_t, W
	ADDWF CompTempVarRet384, F
	MOVF __mul_16s__0000E_1_t+D'1', W
	BTFSC gbl_status,0
	INCFSZ __mul_16s__0000E_1_t+D'1', W
	ADDWF CompTempVarRet384+D'1', F
label21
	BCF gbl_status,0
	RRF __mul_16s__0000E_arg_b+D'1', F
	RRF __mul_16s__0000E_arg_b, F
	BCF gbl_status,0
	RLF __mul_16s__0000E_1_t, F
	RLF __mul_16s__0000E_1_t+D'1', F
	INCF __mul_16s__0000E_1_i, F
	GOTO	label20
label22
	BTFSS __mul_16s__0000E_1_i,7
	RETURN
	COMF CompTempVarRet384, F
	COMF CompTempVarRet384+D'1', F
	INCF CompTempVarRet384, F
	BTFSC gbl_status,2
	INCF CompTempVarRet384+D'1', F
	RETURN
; } __mul_16s_16s__16 function end

	ORG 0x00000117
storeTemp_00000
; { storeTemp ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF storeTemp_00000_1_iTemp
	MOVF gbl_cTempH, W
	MOVWF storeTemp_00000_1_iTemp+D'1'
	MOVF gbl_cTempL, W
	IORWF storeTemp_00000_1_iTemp, F
	MOVLW 0x02
	MOVWF gbl_iDecimalPosition
	MOVF gbl_iTempUnit, F
	BTFSC STATUS,Z
	GOTO	label26
	CLRF storeTemp_00000_3_isMinus
	BTFSC storeTemp_00000_1_iTemp+D'1',7
	INCF storeTemp_00000_3_isMinus, F
	MOVF storeTemp_00000_3_isMinus, F
	BTFSC STATUS,Z
	GOTO	label23
	COMF storeTemp_00000_1_iTemp, F
	COMF storeTemp_00000_1_iTemp+D'1', F
	INCF storeTemp_00000_1_iTemp, F
	BTFSC STATUS,Z
	INCF storeTemp_00000_1_iTemp+D'1', F
label23
	MOVLW 0x06
	MOVWF __mul_16s__0000E_arg_a
	CLRF __mul_16s__0000E_arg_a+D'1'
	MOVF storeTemp_00000_1_iTemp, W
	MOVWF __mul_16s__0000E_arg_b
	MOVF storeTemp_00000_1_iTemp+D'1', W
	MOVWF __mul_16s__0000E_arg_b+D'1'
	CALL __mul_16s__0000E
	MOVF CompTempVarRet384, W
	MOVWF storeTemp_00000_3_iTempC
	MOVF CompTempVarRet384+D'1', W
	MOVWF CompTempVar604
	MOVF storeTemp_00000_1_iTemp, W
	MOVWF CompTempVar601
	MOVF storeTemp_00000_1_iTemp+D'1', W
	MOVWF storeTemp_00000_3_iTempC+D'1'
	RLF storeTemp_00000_1_iTemp+D'1', W
	RRF storeTemp_00000_3_iTempC+D'1', F
	RRF CompTempVar601, F
	RLF storeTemp_00000_1_iTemp+D'1', W
	RRF storeTemp_00000_3_iTempC+D'1', F
	RRF CompTempVar601, W
	ADDWF storeTemp_00000_3_iTempC, F
	MOVF CompTempVar604, W
	BTFSC STATUS,C
	INCF storeTemp_00000_3_iTempC+D'1', F
	ADDWF storeTemp_00000_3_iTempC+D'1', F
	MOVF storeTemp_00000_3_iTempC, W
	MOVWF storeTempD_0001B_arg_iValue
	MOVF storeTemp_00000_3_iTempC+D'1', W
	MOVWF storeTempD_0001B_arg_iValue+D'1'
	CALL storeTempD_0001B
	MOVF storeTemp_00000_3_isMinus, F
	BTFSC STATUS,Z
	RETURN
	MOVLW 0x03
	SUBWF storeTemp_00000_3_iTempC+D'1', W
	BTFSS STATUS,Z
	GOTO	label24
	MOVLW 0xE8
	SUBWF storeTemp_00000_3_iTempC, W
label24
	BTFSS STATUS,C
	GOTO	label25
	BTFSC storeTemp_00000_3_iTempC+D'1',7
	GOTO	label25
	MOVLW 0x01
	MOVWF gbl_iDecimalPosition
	MOVF gbl_arrTemp+D'1', W
	MOVWF gbl_arrTemp
	MOVF gbl_arrTemp+D'2', W
	MOVWF gbl_arrTemp+D'1'
	MOVF gbl_arrTemp+D'3', W
	MOVWF gbl_arrTemp+D'2'
label25
	MOVLW 0x0A
	MOVWF gbl_arrTemp+D'3'
	RETURN
label26
	MOVLW 0x01
	MOVWF gbl_iDecimalPosition
	MOVLW 0x04
	ADDWF storeTemp_00000_1_iTemp, W
	MOVWF storeTemp_00000_16_iTempF
	MOVF storeTemp_00000_1_iTemp+D'1', W
	MOVWF CompTempVar619
	BTFSC STATUS,C
	INCF CompTempVar619, F
	MOVF CompTempVar619, W
	MOVWF CompTempVar621
	RLF CompTempVar619, W
	RRF CompTempVar621, F
	RRF storeTemp_00000_16_iTempF, F
	RLF CompTempVar619, W
	RRF CompTempVar621, F
	RRF storeTemp_00000_16_iTempF, F
	RLF CompTempVar619, W
	RRF CompTempVar621, F
	RRF storeTemp_00000_16_iTempF, F
	MOVF storeTemp_00000_1_iTemp, W
	ADDWF storeTemp_00000_16_iTempF, F
	MOVF storeTemp_00000_1_iTemp+D'1', W
	MOVWF storeTemp_00000_16_iTempF+D'1'
	MOVF CompTempVar621, W
	BTFSC STATUS,C
	INCF storeTemp_00000_16_iTempF+D'1', F
	ADDWF storeTemp_00000_16_iTempF+D'1', F
	MOVLW 0x40
	ADDWF storeTemp_00000_16_iTempF, F
	MOVLW 0x01
	BTFSC STATUS,C
	INCF storeTemp_00000_16_iTempF+D'1', F
	ADDWF storeTemp_00000_16_iTempF+D'1', F
	CLRF storeTemp_00000_16_isMinus
	BTFSC storeTemp_00000_16_iTempF+D'1',7
	INCF storeTemp_00000_16_isMinus, F
	MOVF storeTemp_00000_16_isMinus, F
	BTFSC STATUS,Z
	GOTO	label27
	COMF storeTemp_00000_16_iTempF, F
	COMF storeTemp_00000_16_iTempF+D'1', F
	INCF storeTemp_00000_16_iTempF, F
	BTFSC STATUS,Z
	INCF storeTemp_00000_16_iTempF+D'1', F
label27
	MOVF storeTemp_00000_16_iTempF, W
	MOVWF storeTempD_0001B_arg_iValue
	MOVF storeTemp_00000_16_iTempF+D'1', W
	MOVWF storeTempD_0001B_arg_iValue+D'1'
	CALL storeTempD_0001B
	MOVF storeTemp_00000_16_isMinus, F
	BTFSC STATUS,Z
	RETURN
	MOVLW 0x0A
	MOVWF gbl_arrTemp+D'3'
	RETURN
; } storeTemp function end

	ORG 0x0000019E
refreshDis_0001A
; { refreshDisplay ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iDigitCounter, W
	XORLW 0x04
	BTFSC STATUS,Z
	CLRF gbl_iDigitCounter
	MOVF gbl_iDigitCounter, W
	MOVWF displayVal_00019_arg_iDigit
	CALL displayVal_00019
	INCF gbl_iDigitCounter, F
	RETURN
; } refreshDisplay function end

	ORG 0x000001A9
oneWireTxB_00017
; { oneWireTxBytes ; function begin
	MOVF oneWireTxB_00017_arg_cData, W
	MOVWF oneWireTxB_00016_arg_cData
	CALL oneWireTxB_00016
	MOVF oneWireTxB_00017_arg_cData2, W
	MOVWF oneWireTxB_00016_arg_cData
	CALL oneWireTxB_00016
	RETURN
; } oneWireTxBytes function end

	ORG 0x000001B0
oneWireRxB_00018
; { oneWireRxByte ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF oneWireRxB_00018_1_cDataIn
	CLRF oneWireRxB_00018_1_i
label28
	MOVLW 0x08
	SUBWF oneWireRxB_00018_1_i, W
	BTFSC STATUS,C
	GOTO	label29
	BSF STATUS, RP0
	BCF gbl_trisa,2
	BCF STATUS, RP0
	BCF gbl_porta,2
	BSF STATUS, RP0
	BSF gbl_trisa,2
	MOVLW 0x06
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF STATUS,C
	RRF oneWireRxB_00018_1_cDataIn, F
	BTFSC gbl_porta,2
	BSF oneWireRxB_00018_1_cDataIn,7
	MOVLW 0x06
	MOVWF delay_10us_00000_arg_del
	CALL delay_10us_00000
	INCF oneWireRxB_00018_1_i, F
	GOTO	label28
label29
	MOVF oneWireRxB_00018_1_cDataIn, W
	MOVWF CompTempVarRet579
	RETURN
; } oneWireRxByte function end

	ORG 0x000001CE
oneWireBus_00014
; { oneWireBusResetTimerStart ; function begin
	MOVLW 0xFA
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_pr2
	BCF STATUS, RP0
	BCF gbl_cTask,5
	BSF gbl_t2con,2
	RETURN
; } oneWireBusResetTimerStart function end

	ORG 0x000001D6
startTemp_00000
; { startTemp ; function begin
	MOVLW 0xCC
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF oneWireTxB_00017_arg_cData
	MOVLW 0x44
	MOVWF oneWireTxB_00017_arg_cData2
	CALL oneWireTxB_00017
	RETURN
; } startTemp function end

	ORG 0x000001DE
readTemp_00000
; { readTemp ; function begin
	MOVLW 0xCC
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF oneWireTxB_00017_arg_cData
	MOVLW 0xBE
	MOVWF oneWireTxB_00017_arg_cData2
	CALL oneWireTxB_00017
	CALL refreshDis_0001A
	CALL oneWireRxB_00018
	MOVF CompTempVarRet579, W
	MOVWF gbl_cTempL
	CALL refreshDis_0001A
	CALL oneWireRxB_00018
	MOVF CompTempVarRet579, W
	MOVWF gbl_cTempH
	CALL refreshDis_0001A
	CALL storeTemp_00000
	RETURN
; } readTemp function end

	ORG 0x000001F0
oneWireBus_00015
; { oneWireBusReset2 ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_trisa,2
	MOVLW 0x07
	BCF STATUS, RP0
	MOVWF delay_10us_00000_arg_del
	CALL delay_10us_00000
	BTFSC gbl_porta,2
	CLRF gbl_oneWireIsPresent
	CALL oneWireBus_00014
	RETURN
; } oneWireBusReset2 function end

	ORG 0x000001FB
oneWireBus_00013
; { oneWireBusReset ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_trisa,2
	BCF STATUS, RP0
	CLRF oneWireBus_00013_1_isPresent
	BCF gbl_porta,2
	BSF STATUS, RP0
	BCF gbl_trisa,2
	CALL oneWireBus_00014
	RETURN
; } oneWireBusReset function end

	ORG 0x00000205
initialise_00000
; { initialise ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_pcon,3
	MOVLW 0xC3
	BCF STATUS, RP0
	MOVWF gbl_porta
	MOVLW 0x0C
	BSF STATUS, RP0
	MOVWF gbl_trisa
	CLRF gbl_trisb
	MOVLW 0xFF
	BCF STATUS, RP0
	MOVWF gbl_portb
	BSF STATUS, RP0
	CLRF gbl_option_reg
	BSF gbl_option_reg,7
	MOVLW 0x07
	BCF STATUS, RP0
	MOVWF gbl_cmcon
	BSF STATUS, RP0
	BSF gbl_option_reg,1
	BSF gbl_option_reg,0
	BCF STATUS, RP0
	CLRF gbl_tmr0
	BCF gbl_intcon,2
	BSF gbl_intcon,5
	CLRF gbl_t1con
	BSF gbl_t1con,5
	BSF gbl_t1con,2
	BSF STATUS, RP0
	BSF gbl_pie1,0
	BCF STATUS, RP0
	BCF gbl_pir1,0
	MOVLW 0x08
	MOVWF gbl_t2con
	MOVLW 0xFA
	BSF STATUS, RP0
	MOVWF gbl_pr2
	BSF gbl_pie1,1
	BCF STATUS, RP0
	BCF gbl_pir1,1
	MOVLW 0x01
	MOVWF delay_s_00000_arg_del
	CALL delay_s_00000
	BSF gbl_intcon,7
	BSF gbl_intcon,6
	BSF gbl_t1con,0
	RETURN
; } initialise function end

	ORG 0x00000235
main
; { main ; function begin
	CALL initialise_00000
label30
	MOVF gbl_cTask, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label30
	BTFSS gbl_cTask,5
	GOTO	label34
	CALL refreshDis_0001A
	INCF gbl_oneWireResetStage, F
	MOVF gbl_oneWireResetStage, W
	XORLW 0x02
	BTFSS STATUS,Z
	GOTO	label31
	CALL oneWireBus_00015
	GOTO	label33
label31
	MOVF gbl_oneWireResetStage, W
	XORLW 0x03
	BTFSS STATUS,Z
	GOTO	label33
	BCF gbl_t2con,2
	CLRF gbl_oneWireResetStage
	BTFSS gbl_cTask,3
	GOTO	label32
	CALL startTemp_00000
	BCF gbl_cTask,3
	GOTO	label33
label32
	BTFSS gbl_cTask,4
	GOTO	label33
	CALL readTemp_00000
	BCF gbl_cTask,4
label33
	BCF gbl_cTask,5
label34
	BTFSS gbl_cTask,2
	GOTO	label38
	BTFSC gbl_porta,3
	GOTO	label37
	MOVF gbl_bUnitButtonPrev, F
	BTFSC STATUS,Z
	GOTO	label37
	MOVF gbl_iTempUnit, F
	BTFSC STATUS,Z
	GOTO	label35
	CLRF gbl_iTempUnit
	GOTO	label36
label35
	MOVLW 0x05
	MOVWF gbl_iTempUnit
label36
	CALL storeTemp_00000
label37
	CLRF gbl_bUnitButtonPrev
	BTFSC gbl_porta,3
	INCF gbl_bUnitButtonPrev, F
	BCF gbl_cTask,2
label38
	BTFSS gbl_cTask,1
	GOTO	label39
	CALL refreshDis_0001A
	BCF gbl_cTask,1
label39
	BTFSS gbl_cTask,3
	GOTO	label40
	MOVF gbl_oneWireResetStage, F
	BTFSS STATUS,Z
	GOTO	label40
	INCF gbl_oneWireResetStage, F
	CALL oneWireBus_00013
label40
	BTFSS gbl_cTask,4
	GOTO	label30
	MOVF gbl_oneWireResetStage, F
	BTFSS STATUS,Z
	GOTO	label30
	INCF gbl_oneWireResetStage, F
	CALL oneWireBus_00013
	GOTO	label30
; } main function end

	ORG 0x0000027A
_startup
	MOVLW 0x01
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_bUnitButtonPrev
	MOVLW 0x11
	MOVWF gbl_arrSegments0
	MOVLW 0xD7
	MOVWF gbl_arrSegments0+D'1'
	MOVLW 0x32
	MOVWF gbl_arrSegments0+D'2'
	MOVLW 0x92
	MOVWF gbl_arrSegments0+D'3'
	MOVLW 0xD4
	MOVWF gbl_arrSegments0+D'4'
	MOVLW 0x98
	MOVWF gbl_arrSegments0+D'5'
	MOVLW 0x18
	MOVWF gbl_arrSegments0+D'6'
	MOVLW 0xD3
	MOVWF gbl_arrSegments0+D'7'
	MOVLW 0x10
	MOVWF gbl_arrSegments0+D'8'
	MOVLW 0x90
	MOVWF gbl_arrSegments0+D'9'
	MOVLW 0xFE
	MOVWF gbl_arrSegments0+D'10'
	MOVLW 0xFF
	MOVWF gbl_arrSegments0+D'11'
	MOVLW 0x88
	MOVWF gbl_arrSegments1
	MOVLW 0xBE
	MOVWF gbl_arrSegments1+D'1'
	MOVLW 0xC4
	MOVWF gbl_arrSegments1+D'2'
	MOVLW 0x94
	MOVWF gbl_arrSegments1+D'3'
	MOVLW 0xB2
	MOVWF gbl_arrSegments1+D'4'
	MOVLW 0x91
	MOVWF gbl_arrSegments1+D'5'
	MOVLW 0x81
	MOVWF gbl_arrSegments1+D'6'
	MOVLW 0xBC
	MOVWF gbl_arrSegments1+D'7'
	MOVLW 0x80
	MOVWF gbl_arrSegments1+D'8'
	MOVLW 0x90
	MOVWF gbl_arrSegments1+D'9'
	MOVLW 0xF7
	MOVWF gbl_arrSegments1+D'10'
	MOVLW 0xFF
	MOVWF gbl_arrSegments1+D'11'
	MOVLW 0xC2
	MOVWF gbl_arrDigits
	MOVLW 0xC1
	MOVWF gbl_arrDigits+D'1'
	MOVLW 0x43
	MOVWF gbl_arrDigits+D'2'
	MOVLW 0x83
	MOVWF gbl_arrDigits+D'3'
	CLRF gbl_arrTemp
	CLRF gbl_arrTemp+D'1'
	CLRF gbl_arrTemp+D'2'
	CLRF gbl_arrTemp+D'3'
	MOVLW 0x02
	MOVWF gbl_iDecimalPosition
	CLRF gbl_iDigitCounter
	MOVLW 0x05
	MOVWF gbl_iTempUnit
	CLRF gbl_cTask
	MOVLW 0x71
	MOVWF gbl_iTimer1Count
	CLRF gbl_oneWireIsPresent
	CLRF gbl_oneWireResetStage
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x000002C7
interrupt
; { interrupt ; function begin
	BTFSS gbl_intcon,2
	GOTO	label42
	BCF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_cTask,1
	BCF gbl_intcon,2
label42
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_pir1,0
	GOTO	label44
	BSF gbl_cTask,2
	MOVF gbl_iTimer1Count, W
	XORLW 0x72
	BTFSC STATUS,Z
	BSF gbl_cTask,3
	MOVLW 0x75
	SUBWF gbl_iTimer1Count, W
	BTFSS STATUS,C
	GOTO	label43
	CLRF gbl_iTimer1Count
	BSF gbl_cTask,4
label43
	INCF gbl_iTimer1Count, F
	BCF gbl_pir1,0
label44
	BTFSS gbl_pir1,1
	GOTO	label45
	BSF gbl_cTask,5
	BCF gbl_pir1,1
label45
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	ORG 0x00002007
	DW 0x3F18
	END
