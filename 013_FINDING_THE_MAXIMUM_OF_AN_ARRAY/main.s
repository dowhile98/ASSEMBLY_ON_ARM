;ESTE PROGRAMA HALLA EL ELEMENTO MAYOR DE UN ARRAY
			;AREA DE DATOS
max			EQU		0x20000000			;PARA ALMACENAR EL VALOR MAXIMO ALLADO EN LA SRAM
	
			AREA myDATA, DATA,READONLY,ALIGN=2
			ALIGN
array		DCD		-1,5,3,8,10,23,6,5,2,-10
size		DCD		10
	
			;AREA DE CODIGO
			AREA myCODE, CODE,READONLY,ALIGN=2
			EXPORT	__main

		    ENTRY

__main		PROC
			;IDENTIFICAMOS EL TAMAÑO DEL ARREGLO
			LDR		R3,=size
			LDR		R3,[R3]			;TAMAÑO DEL ARRAY
			SUB		R3,R3,#1
			;SE INICIALIZA EL VALOR MAXIMO
			LDR		R4,=array
			LDR		R0,[R4]		;se asigna el primer elemeto del array al valor maximo
			MOV		R1,#0		;INDICE DEL VALOR MAXIMO
			
			
			;iterador para el for
			MOV		R2,#0
loop		CMP		R2,R3
			BGE		maxSave
			LDR		R5,[R4,R2,LSL #2];ARRAY[I]
			CMP		R5,R0;SE COMPARA CON  EL VALOR MAXIMO
			MOVGT	R0,R5;si es mayor se actualiza el valor maximo
			MOVGT	R1,R2;se actualiza el indice del array
			ADD		R2,R2,#1;se actualiza el i, del for
			B		loop
maxSave		LDR		R3,=max
			ALIGN			;PARA ALINEAR EL DATO LEIDO
			STR		R0,[R3]
			
stop		B		stop
		    ENDP
			END
	