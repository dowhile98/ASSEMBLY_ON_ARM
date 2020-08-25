			AREA maxValue,CODE
			EXPORT	maxInteger
			ALIGN
				
maxInteger	PROC
			;R0->CONTIENE EL PUNTERO AL ARREGLO
			PUSH	{R4,LR}
			LDR		R2,[R0]			;SE ESTABLE EL VALOR MAXIMO A R1
			SUB		R1,R1,#1		;SIZE-1
			MOV		R3,#0			;i = 0 
loop		CMP		R3,R1
			BGT		exit
			LDR		R4,[R0,R3,LSL #2]
			CMP		R4,R2
			MOVGT	R2,R4
			ADD		R3,R3,#1
			B 		loop
			
exit		MOV		R0,R4
			POP		{R4,PC}
			ENDP
			END