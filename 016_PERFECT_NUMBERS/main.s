;ESTE PROGRAMA DETERMINA SI UN NUMERO DADO ES PERFECTO O NO

		AREA myCODE,CODE,READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
		MOV		R1,#28	;NUMERO A CHEQUEAR
		MOV		R2,#0	;SUMA = 0
		
		MOV		R3,#1	;INTERADOR I PARA EL LOOP
loop	CMP 	R3,R1	;COMPARA R3 CON R1
		BHS		check	;si sum i>=num, se del loop
		UDIV	R4,R1,R3;r4 = r1/r3
		MLS		R4,R3,R4,R1;R4 = num-i*R4
		CMP		R4,#0
		ADDEQ	R2,R2,R3;sum +=i
		ADD		R3,R3,#1
		B		loop
		
check	CMP R2,R1;COMPARA LA SUMA CON  EL NUMERO
		MOVEQ	R0,#1
		MOVNE	R0,#0
stop	B		stop
		ENDP
		END