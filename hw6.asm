TITLE	S04353041  HW6	�O�ƥ�MACRO��
;----------------------------------------------------------------------
INSWW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,53		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'I'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,54		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'n'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,55		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'s'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
INSBB		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,53		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'I'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,54		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'n'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,55		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'s'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
BACKSPACE		MACRO
	DEC		TEXT_C
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R		;�C
	MOV		DL,TEXT_C		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,' '		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
ENTERR		MACRO
	CMP		DH,00		;�O��0�C��?
	JNE		ENTER2		;���O���ܨ�ENTER2
		
FUNCOPY:
	CMP		FUN,30H
	JNE		FUNCUT
	;COPY��FUNTION:					

FUNCUT:
	CMP		FUN,31H
	JNE		FUNPASTE
	;CUT��FUNTION:	

FUNPASTE:
	CMP		FUN,32H
	JNE		FUNEXIT
	;PASTE��FUNTION:

FUNEXIT:
	CMP		FUN,33H
	JNE		ENTEREND
	    	EXIT
	JMP		ENTEREND

ENTER2:
	CMP		DH,16H		;�b���e�̤U���੹�U
	JE		ENTEREND
	    	DOWNARROW

ENTEREND:
	 
ENDM
;---------------------------------------------------------
EXIT		MACRO
	MOV		AX,4C00H	;�����{��
	INT		21H 		;INT�N��:�I�s���_�Ƶ{��
	 
ENDM
;---------------------------------------------------------
PRINTFUN		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,50		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,[FUN]	;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
NUMLOCK		MACRO
	MOV		AH,12H
	INT		16H
	AND		AL,00100000B;NUMLOCK�OLOCK(����)��
	JZ		NLEXIT		;
	NLW					;�Y�O�h�ϥ�
	 
NLEXIT:		
	NLB			
ENDM
;---------------------------------------------------------
NLB			MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,59		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'N'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,60		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'u'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,61		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'m'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,62		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'L'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,63		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'o'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,64		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'c'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,65		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'k'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	RESETCUR
ENDM
;---------------------------------------------------------
NLW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,59		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'N'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,60		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'u'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,61		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'m'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,62		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'L'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,63		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'o'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,64		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'c'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,24		;�C
	MOV		DL,65		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'k'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	RESETCUR
	 
ENDM
;---------------------------------------------------------
EXITW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,21		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'E'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,22		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'x'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,23		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'i'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,24		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
EXITB		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,21		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'E'		;���
	MOV		BH,00		;
	MOV		BL,07H		;�©��զr
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,22		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'x'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,23		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'i'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,24		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
PASTEW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,13		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'P'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,14		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'a'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,15		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'s'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,16		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,17		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'e'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
PASTEB		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,13		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'P'		;���
	MOV		BH,00		;
	MOV		BL,07H		;�©��զr
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,14		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'a'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,15		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'s'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,16		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,17		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'e'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
CUTW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,07		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'C'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,08		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'u'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,09		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
CUTB		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,07		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'C'		;���
	MOV		BH,00		;
	MOV		BL,07H		;�©��զr
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,08		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'u'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,09		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'t'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
COPYW		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,00		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'C'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,01		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'o'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,02		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'p'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,03		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'y'		;���
	MOV		BH,00		;
	MOV		BL,70H		;�թ��¦r
	INT		10H
	 
ENDM
;---------------------------------------------------------
COPYB		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,00		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'C'		;���
	MOV		BH,00		;
	MOV		BL,07H		;�©��զr
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,01		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'o'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,02		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'p'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,03		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'y'		;���
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
LEFTARROW		MACRO
	CMP		DH,00H
	JNE		LL
	CMP		FUN,33H
	JNE		L1
	DEC		FUN
;	    	PRINTFUN
	EXITB
	PASTEW
	JMP		LLL
L1:
	CMP		FUN,32H
	JNE		L2
	DEC		FUN
;	    	PRINTFUN
	PASTEB
	CUTW
	JMP		LLL
L2:
	CMP		FUN,31H
	JNE		L3
	DEC		FUN
;	    	PRINTFUN
	CUTB
	COPYW
	JMP		LLL
L3:
	CMP		FUN,30H
	JNE		LLL
	CUTB
	COPYW
	JMP		LLL
LL:
	DEC		TEXT_C
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R		;�C
	MOV		DL,TEXT_C		;��
	INT		10H			;�I�s���_�A��
LLL:
	 
ENDM
;--------------------------------------------------------
RIGHTARROW		MACRO
	CMP		DH,00H
	JNE		RR
	CMP		FUN,30H
	JNE		R1
	INC		FUN
;	    	PRINTFUN
	COPYB
	CUTW
	JMP		RRR
R1:
	CMP		FUN,31H
	JNE		R2
	INC		FUN
;	    	PRINTFUN
	CUTB
	PASTEW
	JMP		RRR
R2:
	CMP		FUN,32H
	JNE		R3
	INC		FUN
;	    	PRINTFUN
	    	PASTEB
	    	EXITW
	JMP		RRR
R3:
	CMP		FUN,33H
	JNE		RRR
	    	PASTEB
	    	EXITW
	JMP		RRR
RR:
	INC		TEXT_C
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R		;�C
	MOV		DL,TEXT_C		;��
	INT		10H			;�I�s���_�A��
RRR:
	 
ENDM
;--------------------------------------------------------
UPARROW		MACRO
	DEC		TEXT_R
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R		;�C
	MOV		DL,TEXT_C		;��
	INT		10H			;�I�s���_�A��

	 
ENDM
;--------------------------------------------------------
DOWNARROW		MACRO
	INC		TEXT_R
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R		;�C
	MOV		DL,TEXT_C		;��
	INT		10H			;�I�s���_�A��
	 
ENDM
;--------------------------------------------------------
PTEXT		MACRO
	CMP		AL,30H	;�P�_�r���O�_���Ʀr 30H~39H
	JB		P40		;�YAH<30H�h����P40
	CMP		AL,39H	;
	JA		P20		;�YAH>39H�h����P20
P20:
	CMP		AL,41H	;�P�_�r���O�_���^��r�� �j�g:41H~5AH  �p�g:61H~7AH
	JB		P40		;�YAH<41H�h����P40
	CMP		AL,7AH	;
	JA		P40		;�YAH>7AH�h����A40
	CMP		AL,5AH	;
	JBE 	P30		;�YAH<=5AH�h����A30
	CMP		AL,61H	;
	JAE		P30		;�YAH>=61H�h����A30
	
	CMP		AL,5AH	;
	JA 		P40		;�YAH>5AH�h����A40(�j�g�p�g�����r����������)

P30:
	MOV		AH,09H
	;MOV	AL,' '		;���' '
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H			;
	INC		TEXT_C		;

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R	;�C
	MOV		DL,TEXT_C	;��
	INT		10H			;�I�s���_�A��	
P40:
	 
ENDM
;--------------------------------------------------------
KEY			MACRO

	;AH=SCAN	AL=ASCII
	
	CMP		AL,0E0H		;�OExtended Key?
	JNE		KK
K3:
	CMP		AH,47H		;�OHome��?
	JNE		K4
	
	MOV		TEXT_C,00	;��
	    	RESETCUR
	JMP		KE
K4:
	CMP		AH,52H		;�OIns��?
	JNE		K5			;���O,����KE
	CMP		INS1,00;
	JNE		INSON
	INC		INS1
	    	INSWW
	    	RESETCUR
	JMP		KE
INSON:
	DEC		INS1
	    	INSBB
	    	RESETCUR
	JMP		KE
K5:
	CMP		AH,4DH		;�ORIGHTARROW��?
	JNE		K6			;���O,����K6
	    	RIGHTARROW 
	JMP		KE
K6:
	CMP		AH,4BH		;�OLEFTARROW��?
	JNE		K7			;���O,����K7
	    	LEFTARROW
	JMP		KE
K7:
	CMP		AH,48H		;�OUPARROW��?
	JNE		K8			;���O,����K8
	CMP		DH,00H		;�b�\����W���੹�W
	JE		K8
	CMP		DH,02H		;�b���e�̤W���੹�W
	JE		K8
	    	UPARROW
	JMP		KE
K8:
	CMP		AH,50H		;�ODOWNARROW��?
	JNE		KE			;���O,����KE
	CMP		DH,00H		;�b�\����U���੹�U
	JE		KE
	CMP		DH,16H		;�b���e�̤U���੹�U
	JE		KE
	    	DOWNARROW
	JMP		KE
KK:
	CMP		AL,1BH		;�O1B?
	JE		KK1			;�O �ˬdAH�O������
	JNE		KBS			;���O �~���ˬdAL
KK1:
	CMP		AH,01H		;�OESC��?
	JNE		KE			;���O,����KE


	CMP		ESC1,00H	;�P�_ESC1�O�_��0
	JNE		EE			;���O00H�A����EE
	INC		ESC1
	MOV		FUN,30H		;copy
;	    	PRINTFUN
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,00		;��
	INT		10H			;�I�s���_�A��	
	MOV		AH,09H
	MOV		AL,'C'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,01		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'o'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,02		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'p'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,00		;�C
	MOV		DL,03		;��
	INT		10H			;�I�s���_�A��
	MOV		AH,09H
	MOV		AL,'y'		;���
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	JMP		KE
EE:
	MOV		ESC1,00H	;
	CMP		FUN,30H		;
	JNE		FF1
	    	COPYB
	JMP		FFE
FF1:
	CMP		FUN,31H		;
	JNE		FF2
	    	CUTB
	JMP		FFE
FF2:
	CMP		FUN,32H		;
	JNE		FF3
	    	PASTEB
	JMP		FFE
FF3:
	CMP		FUN,33H		;
	JNE		FFE
	    	EXITB
	JMP		FFE
FFE:


	    	RESETCUR
	JMP		KE

KBS:
	CMP		AL,08H		;�O08? 
	JE		KBS1
	JNE		EN
KBS1:
	CMP		AH,0EH		;�OBACKSPACE��?

	JNE		KE			;���O,����KE
	CMP		DH,00H		;�b�\����ɤ���ϥ�
	JE		KE
	    	BACKSPACE
	JMP		KE
EN:
	CMP		AL,0DH		;�O0D? 
	JE		EN1
	JNE		KE
EN1:
	CMP		AH,1CH		;�OENTER��?
	JNE		KE			;���O,����KE
	    	ENTERR
	JMP		KE
KE:
	 
ENDM
;----------------------------------------------------
INPUT		MACRO
	    	KEY			;Ū����L�\��
	MOV		AH,10H		;�n�D��L��J
	INT		16H
	    	PTEXT
	MOV		[SI],AL		;
	INC		SI			;
			
	 
ENDM
;----------------------------------------------------------------------
RESETSC		MACRO
	MOV		AH,06H		;
	MOV		AL,00H		;���ʦ��:���ù�
	MOV		BH,07H		;�C��©��զr
	MOV		CX,0200H	;�q0�C
	MOV		DX,164FH	;��24:79
	INT		10H			;�I�s���_�A��
	 
ENDM
;----------------------------------------------------------------------
NEWCURSOR	MACRO	
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,02		;�C
	MOV		DL,00		;��
	INT		10H			;�I�s���_�A��
	 
ENDM
;-----------------------------------------------------------------------
DISPLAY		MACRO
	MOV		AH,09H		;��X�r���ù��A�n��ܪ��r�ꥲ���H�u$�v����
	;LEA	DX,STR_A	;��ܦr��
	INT		21H			;�I�s���_�A��
ENDM
;-----------------------------------------------------------------------
RESETCUR	MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,TEXT_R	;�C
	MOV		DL,TEXT_C	;��
	INT		10H			;�I�s���_�A��
	 
ENDM
;----------------------------------------------------------------------
ENDCUR		MACRO
	MOV		AH,02H		;�n�D�]�w���
	MOV		BH,00		;�����s��0
	MOV		DH,23		;�C
	MOV		DL,00		;��
	INT		10H			;�I�s���_�A��
	 
ENDM
;----------------------------------------------------------------------
CLEAR	MACRO
	MOV		AH,06H		;
	MOV		AL,00H		;���ʦ��:���ù�
	MOV		BH,07H		;�C��©��զr
	MOV		CX,0000H	;�q0�C
	MOV		DX,184FH	;��24:79
	INT		10H			;�I�s���_�A��
ENDM
;-----------------------------------------------------------------------
STACK	  SEGMENT	PARA	STACK	'Stack'
	DB	64 DUP(0)
STACK	  ENDS
;---------------------------------------------------
DATASEG   SEGMENT	PARA	'Data'
SET1	DB	'Copy   Cut   Paste   Exit',0AH    
SET2	DB	'--------------------------------------------------------------------------------$'       ;


SET3	DB	'--------------------------------------------------------------------------------'		;
SET4	DB	'                                                     Ins   NumLock    Caps  '
ROW		DB	'0'
DOT		DB	','
COL		DB	'0','$'

FUN		DB	30H
ESC1	DB	00
INS1	DB	00
NUM1	DB	00
CAPS1	DB	00



TEXT_R	DB	00H
TEXT_C	DB	00H

copy	DB	?




TEXT	DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
		DB	80 Dup('$')
	
		

DATASEG	ENDS
;---------------------------------------------------
CODESEG	  SEGMENT	PARA	'Code'
MAIN	PROC 	  FAR
	ASSUME SS:STACK,CS:CODESEG,DS:DATASEG,ES:DATASEG
	MOV		AX, DATASEG	;���X .data ��segment�A�s�J AX
	MOV		DS,AX		;
	MOV		ES,AX		;

	CLEAR		;�M������

	
	RESETCUR	;�]���0,0

	MOV		TEXT_R,02H

	LEA		DX,SET1		;
	DISPLAY		;

	ENDCUR		;�]���23,0
	
	LEA		DX,SET3		;
	DISPLAY		;	
	
	NEWCURSOR	;�]���2,0

	LEA		SI,TEXT
A10:

	INPUT		;�n�D��L��J
;	    	NUMLOCK		;�^����LNUMLOCK���A   �o�y�k�����D ��Q___Q
	JMP		A10			;�L����J���e

	
MAIN	ENDP
;-----------------------------------------------------------------------
CODESEG	ENDS
	END	  MAIN