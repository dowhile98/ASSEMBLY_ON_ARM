;ODD PARITY

		AREA myCODE,CODE,READONLY,ALIGN=2
		EXPORT	__main
		ENTRY
		
__main	PROC
		MOVS	R0,#11	;NUMERO A CHEQUEAR
		MOVS	R1,#0	;PARIDAD
		
loop	CBZ		R0,stop	;termina la ejecucion si es cero
		CMP		R1,#0	;compara r1 con 0
		MOVEQ	R1,#1	;si r1 == 1
		MOVNE	R2,#0	;si r1 !=0
		SUBS	R2,R0,#1;(n-1)
		ANDS	R0,R0,R2;n&(n-1)
		B		loop
stop	B		stop
		ENDP
		END