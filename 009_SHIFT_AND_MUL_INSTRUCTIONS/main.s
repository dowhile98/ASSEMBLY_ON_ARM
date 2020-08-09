;RESOLVER LA SIGUIENTE ECUACION

; (A + 8B + 7C -27) /4
; Let A = 25, B =19, c=99

		AREA myCODE,CODE,READONLY
		ENTRY
		EXPORT	__main
		
__main	PROC
		MOV		R0,#25				;A = 25
		MOV		R1,#19				;B = 19
		ADD		R0,R0,R1, LSL #3	;R0 = R0 + 8*R1
		MOV		R1,#99				;C = 99
		MOV		R2,#7
		MLA		R0,R1,r2,R0			;R0 = R1*R2 + R0		
		SUB		R0,R0,#27			;R0 = R0 - 27
		ASR		R0,R0,#2			;RO = R0 / 4
		
Stoop	B		Stoop
		ENDP
		END