

		AREA stringLen,CODE,READONLY
		EXPORT	strLen				;hace que el strLen sea visible para el linker
		ALIGN
strLen	PROC
		PUSH	{R4,LR}
		MOV		R4,#0				;SE INICIALIZA EL TAMAÑO
loop	LDRB	R1,[R0,R4]			;R0->PUNTERO
		CBZ		R1,exit				;SI SE LLEGA AL FINAL DE LA CADENA
		ADD		R4,R4,#1			;R4 = R4 + 1
		B		loop
exit	MOV		R0,R4				;SE ASIGNA  EL VALOR DE RETORNO
		POP		{R4,PC}				;se retorna 	
		ENDP
		END