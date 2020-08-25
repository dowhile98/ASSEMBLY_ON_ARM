;se crea una funcion que calcula el maximo comun divisor de dos numeros
;METODO DE EUCLIDES
		AREA myRESULT,DATA
		ALIGN
result	DCD	0
	
		AREA myCODE,CODE
		EXPORT	__main

		ENTRY

__main	PROC
		MOV		R1,#21	;primer argumento
		MOV		R0,#28	;segundo argumento
		BL		gcd
		
		LDR		R2,=result
		ALIGN
		STR		R0,[R2]
		
stop	B		stop
		ENDP
		
gcd		PROC
		;r0 = a
		;r1 = b
		CMP		R0,R1	;si a<b
		MOVLT	R2,R0	;se hace el cambio
		MOVLT	R0,R1
		MOVLT	R1,R2
		
loop	CBZ		R1,exit
		SDIV	R3,R0,R1;a/b
		MLS		R2,R1,R3,R0;R2 = R1-R3*R0
		MOV		R0,R1		;A = B
		MOV		R1,R2		;B = AL RESULTADO DE LA DIVISION
		B 		loop

exit	BX		LR
		
		ENDP
		END
		