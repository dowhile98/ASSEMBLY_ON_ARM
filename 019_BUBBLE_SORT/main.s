;ESTE PROGRAMA ES UN ALGORITMO DE ARDENAMIENTO->METODO DE LA BURBUJA

			AREA myDATA, DATA
			ALIGN
array		DCD	12,11,10,9,8,7,6,5,4,3,2,1
size		DCD	12
	
			;AREA DE CODIGO
			AREA myCODE,CODE
			EXPORT	__main
			ALIGN
			ENTRY

__main		PROC
	
			LDR		R5,=array		;SE CARGA EL PUNTERO AL ARRAY
			LDR		R6,=size		;SE CARGA EL PUNTERO AL TAMAÑO DEL ARREGLO
			LDR		R6,[R6]			;SE CARGA EL TRAMAÑO DEL ARREGLO
			SUB		R1,R6,#1		;R1 = R6-1
			
loop_i		CMP		R1,#0		
			BLE		stop			;SI R0<=0
			MOV		R0,#1			;j = 1
loop_j		CMP		R0,R1			
			BGT		exit_j			;SI R0>R1
			SUB		R2,R0,#1		;R2 = j - 1
			LDR		R3,[R5,R2,LSL #2];array[j-1]
			LDR		R4,[R5,R0,LSL #2];array[j]
			CMP		R3,R4
			STRGT	R4,[R5,R2,LSL #2];array[j-1]
			STRGT	R3,[R5,R0,LSL #2];array[j]
			ADD		R0,R0,#1		;j++
			B		loop_j
exit_j		SUB		R1,R1,#1
			B		loop_i
stop		B		stop
			ENDP
			ALIGN
			END