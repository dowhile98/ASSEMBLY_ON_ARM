		AREA myDATA,DATA,READONLY
		ALIGN
str		DCB		"123456",0
		
		AREA atoi,CODE,READONLY
		EXPORT	__main
		ENTRY
		
__main	PROC
		LDR		R1,=str				;puntero que apunta al primer elemeto de STR
		MOVS	R2,#0				;r2 = value (valor convertido)
loop	LDRB	R0,[R1],#1			;r0 = *p, p++
		CBZ		R0,stop				;si r0 ==0
		CMP		R0,#0x30			;r0<'0'
		BLT		stop	
		CMP		R0,#0x39			;r0>'9'
		BGT		stop
		SUBS	R0,R0,#0x30			;r0 = *p-48
		ADD		R3,R2,R2,LSL #2		;r3 = 5*r2
		ADD		R2,R0,R3,LSL #1		;r2 = 10*r2 + r0
		B		loop
stop	B		stop
		ENDP
		END