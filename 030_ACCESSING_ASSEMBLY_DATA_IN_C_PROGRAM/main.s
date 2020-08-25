;este programa usa un variable global de assembler para ser modificado con 
;con funciones escritas en c
		AREA main,CODE
		EXPORT	__main
		IMPORT	getValue	[WEAK]
		IMPORT	increment	[WEAK]
		IMPORT	setValue	[WEAK]
		IMPORT	value				;ESTO ES UNA VARIABLE DEFINIDA EN C
		ALIGN
		ENTRY
__main	PROC
		MOVS	R2,#0
		MOVS	R0,#1
		BL		setValue		;se llama la funciones escritas en c
		BL		increment
		BL		getValue
		MOV		R2,R0
		;ESTA PARTE DE CODIGO MODIFICA UNA VARIABLE DEFINIDA EN C
		LDR		R0,=value
		STR		R2,[R0]
		LDR		R1,[R0]
		ADD		R1,R1,#20
		STR		R1,[R0]
stop	B		stop
		ENDP
		
		AREA myData,DATA
		EXPORT	counter
counter	DCD	0
		END