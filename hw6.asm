TITLE	S04353041  HW6	記事本MACRO版
;----------------------------------------------------------------------
INSWW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,53		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'I'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,54		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'n'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,55		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'s'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
INSBB		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,53		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'I'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,54		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'n'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,55		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'s'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
BACKSPACE		MACRO
	DEC		TEXT_C
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R		;列
	MOV		DL,TEXT_C		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,' '		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
ENTERR		MACRO
	CMP		DH,00		;是第0列嗎?
	JNE		ENTER2		;不是的話到ENTER2
		
FUNCOPY:
	CMP		FUN,30H
	JNE		FUNCUT
	;COPY的FUNTION:					

FUNCUT:
	CMP		FUN,31H
	JNE		FUNPASTE
	;CUT的FUNTION:	

FUNPASTE:
	CMP		FUN,32H
	JNE		FUNEXIT
	;PASTE的FUNTION:

FUNEXIT:
	CMP		FUN,33H
	JNE		ENTEREND
	    	EXIT
	JMP		ENTEREND

ENTER2:
	CMP		DH,16H		;在內容最下不能往下
	JE		ENTEREND
	    	DOWNARROW

ENTEREND:
	 
ENDM
;---------------------------------------------------------
EXIT		MACRO
	MOV		AX,4C00H	;結束程式
	INT		21H 		;INT意思:呼叫中斷副程式
	 
ENDM
;---------------------------------------------------------
PRINTFUN		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,50		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,[FUN]	;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
NUMLOCK		MACRO
	MOV		AH,12H
	INT		16H
	AND		AL,00100000B;NUMLOCK是LOCK(有效)的
	JZ		NLEXIT		;
	NLW					;若是則反白
	 
NLEXIT:		
	NLB			
ENDM
;---------------------------------------------------------
NLB			MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,59		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'N'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,60		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'u'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,61		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'m'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,62		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'L'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,63		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'o'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,64		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'c'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,65		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'k'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	RESETCUR
ENDM
;---------------------------------------------------------
NLW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,59		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'N'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,60		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'u'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,61		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'m'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,62		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'L'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,63		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'o'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,64		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'c'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,24		;列
	MOV		DL,65		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'k'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	RESETCUR
	 
ENDM
;---------------------------------------------------------
EXITW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,21		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'E'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,22		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'x'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,23		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'i'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,24		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
EXITB		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,21		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'E'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;黑底白字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,22		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'x'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,23		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'i'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,24		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
PASTEW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,13		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'P'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,14		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'a'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,15		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'s'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,16		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,17		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'e'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
PASTEB		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,13		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'P'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;黑底白字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,14		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'a'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,15		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'s'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,16		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,17		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'e'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
CUTW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,07		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'C'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,08		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'u'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,09		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
CUTB		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,07		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'C'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;黑底白字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,08		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'u'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,09		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'t'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H
	 
ENDM
;---------------------------------------------------------
COPYW		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,00		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'C'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,01		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'o'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,02		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'p'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,03		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'y'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;白底黑字
	INT		10H
	 
ENDM
;---------------------------------------------------------
COPYB		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,00		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'C'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;黑底白字
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,01		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'o'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,02		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'p'		;顯示
	MOV		BH,00		;
	MOV		BL,07H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,03		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'y'		;顯示
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
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R		;列
	MOV		DL,TEXT_C		;行
	INT		10H			;呼叫岔斷服務
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
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R		;列
	MOV		DL,TEXT_C		;行
	INT		10H			;呼叫岔斷服務
RRR:
	 
ENDM
;--------------------------------------------------------
UPARROW		MACRO
	DEC		TEXT_R
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R		;列
	MOV		DL,TEXT_C		;行
	INT		10H			;呼叫岔斷服務

	 
ENDM
;--------------------------------------------------------
DOWNARROW		MACRO
	INC		TEXT_R
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R		;列
	MOV		DL,TEXT_C		;行
	INT		10H			;呼叫岔斷服務
	 
ENDM
;--------------------------------------------------------
PTEXT		MACRO
	CMP		AL,30H	;判斷字元是否為數字 30H~39H
	JB		P40		;若AH<30H則跳到P40
	CMP		AL,39H	;
	JA		P20		;若AH>39H則跳到P20
P20:
	CMP		AL,41H	;判斷字元是否為英文字母 大寫:41H~5AH  小寫:61H~7AH
	JB		P40		;若AH<41H則跳到P40
	CMP		AL,7AH	;
	JA		P40		;若AH>7AH則跳到A40
	CMP		AL,5AH	;
	JBE 	P30		;若AH<=5AH則跳到A30
	CMP		AL,61H	;
	JAE		P30		;若AH>=61H則跳到A30
	
	CMP		AL,5AH	;
	JA 		P40		;若AH>5AH則跳到A40(大寫小寫間的字元不做改變)

P30:
	MOV		AH,09H
	;MOV	AL,' '		;顯示' '
	MOV		BH,00		;
	MOV		BL,07H		;
	MOV		CX,01		;	
	INT		10H			;
	INC		TEXT_C		;

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R	;列
	MOV		DL,TEXT_C	;行
	INT		10H			;呼叫岔斷服務	
P40:
	 
ENDM
;--------------------------------------------------------
KEY			MACRO

	;AH=SCAN	AL=ASCII
	
	CMP		AL,0E0H		;是Extended Key?
	JNE		KK
K3:
	CMP		AH,47H		;是Home鍵?
	JNE		K4
	
	MOV		TEXT_C,00	;行
	    	RESETCUR
	JMP		KE
K4:
	CMP		AH,52H		;是Ins鍵?
	JNE		K5			;不是,跳到KE
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
	CMP		AH,4DH		;是RIGHTARROW鍵?
	JNE		K6			;不是,跳到K6
	    	RIGHTARROW 
	JMP		KE
K6:
	CMP		AH,4BH		;是LEFTARROW鍵?
	JNE		K7			;不是,跳到K7
	    	LEFTARROW
	JMP		KE
K7:
	CMP		AH,48H		;是UPARROW鍵?
	JNE		K8			;不是,跳到K8
	CMP		DH,00H		;在功能鍵上不能往上
	JE		K8
	CMP		DH,02H		;在內容最上不能往上
	JE		K8
	    	UPARROW
	JMP		KE
K8:
	CMP		AH,50H		;是DOWNARROW鍵?
	JNE		KE			;不是,跳到KE
	CMP		DH,00H		;在功能鍵下不能往下
	JE		KE
	CMP		DH,16H		;在內容最下不能往下
	JE		KE
	    	DOWNARROW
	JMP		KE
KK:
	CMP		AL,1BH		;是1B?
	JE		KK1			;是 檢查AH是什麼鍵
	JNE		KBS			;不是 繼續檢查AL
KK1:
	CMP		AH,01H		;是ESC鍵?
	JNE		KE			;不是,跳到KE


	CMP		ESC1,00H	;判斷ESC1是否為0
	JNE		EE			;不是00H，跳到EE
	INC		ESC1
	MOV		FUN,30H		;copy
;	    	PRINTFUN
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,00		;行
	INT		10H			;呼叫岔斷服務	
	MOV		AH,09H
	MOV		AL,'C'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	MOV		CX,01		;	
	INT		10H


	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,01		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'o'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,02		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'p'		;顯示
	MOV		BH,00		;
	MOV		BL,70H		;
	INT		10H

	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,00		;列
	MOV		DL,03		;行
	INT		10H			;呼叫岔斷服務
	MOV		AH,09H
	MOV		AL,'y'		;顯示
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
	CMP		AL,08H		;是08? 
	JE		KBS1
	JNE		EN
KBS1:
	CMP		AH,0EH		;是BACKSPACE鍵?

	JNE		KE			;不是,跳到KE
	CMP		DH,00H		;在功能鍵時不能使用
	JE		KE
	    	BACKSPACE
	JMP		KE
EN:
	CMP		AL,0DH		;是0D? 
	JE		EN1
	JNE		KE
EN1:
	CMP		AH,1CH		;是ENTER鍵?
	JNE		KE			;不是,跳到KE
	    	ENTERR
	JMP		KE
KE:
	 
ENDM
;----------------------------------------------------
INPUT		MACRO
	    	KEY			;讀取鍵盤功能
	MOV		AH,10H		;要求鍵盤輸入
	INT		16H
	    	PTEXT
	MOV		[SI],AL		;
	INC		SI			;
			
	 
ENDM
;----------------------------------------------------------------------
RESETSC		MACRO
	MOV		AH,06H		;
	MOV		AL,00H		;捲動行數:全螢幕
	MOV		BH,07H		;顏色黑底白字
	MOV		CX,0200H	;從0列
	MOV		DX,164FH	;到24:79
	INT		10H			;呼叫岔斷服務
	 
ENDM
;----------------------------------------------------------------------
NEWCURSOR	MACRO	
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,02		;列
	MOV		DL,00		;行
	INT		10H			;呼叫岔斷服務
	 
ENDM
;-----------------------------------------------------------------------
DISPLAY		MACRO
	MOV		AH,09H		;輸出字串到螢幕，要顯示的字串必須以「$」結束
	;LEA	DX,STR_A	;顯示字串
	INT		21H			;呼叫岔斷服務
ENDM
;-----------------------------------------------------------------------
RESETCUR	MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,TEXT_R	;列
	MOV		DL,TEXT_C	;行
	INT		10H			;呼叫岔斷服務
	 
ENDM
;----------------------------------------------------------------------
ENDCUR		MACRO
	MOV		AH,02H		;要求設定游標
	MOV		BH,00		;頁面編號0
	MOV		DH,23		;列
	MOV		DL,00		;行
	INT		10H			;呼叫岔斷服務
	 
ENDM
;----------------------------------------------------------------------
CLEAR	MACRO
	MOV		AH,06H		;
	MOV		AL,00H		;捲動行數:全螢幕
	MOV		BH,07H		;顏色黑底白字
	MOV		CX,0000H	;從0列
	MOV		DX,184FH	;到24:79
	INT		10H			;呼叫岔斷服務
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
	MOV		AX, DATASEG	;取出 .data 的segment，存入 AX
	MOV		DS,AX		;
	MOV		ES,AX		;

	CLEAR		;清除全部

	
	RESETCUR	;設游標0,0

	MOV		TEXT_R,02H

	LEA		DX,SET1		;
	DISPLAY		;

	ENDCUR		;設游標23,0
	
	LEA		DX,SET3		;
	DISPLAY		;	
	
	NEWCURSOR	;設游標2,0

	LEA		SI,TEXT
A10:

	INPUT		;要求鍵盤輸入
;	    	NUMLOCK		;回傳鍵盤NUMLOCK狀態   這語法有問題 怪Q___Q
	JMP		A10			;無限輸入內容

	
MAIN	ENDP
;-----------------------------------------------------------------------
CODESEG	ENDS
	END	  MAIN