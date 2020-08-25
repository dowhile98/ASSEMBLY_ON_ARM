;SUBRUTUNIA QUE SUMA DOS NUMEROS Y DEVUELVE LA SUMA->PASO POR VALOR

		AREA myCODE,CODE
		EXPORT	__main
		IMPORT	product
		ALIGN
		ENTRY
__main	PROC
		MOV		R0,#1		;primer argumento
		MOV		R1,#2		;segundo argumento
		BL		sum2		;se llama la subrutina
		BL		product		;esta funcion esta definida en otro archivo .s
		LDR		R1,=t		;Direccion de memoria de t
		ALIGN
		STR		R0,[R1]		;se almacena la suma
		
stop	B		stop
		ENDP

sum2	PROC
		ADD		R0,R0,R1	;DEVUELVE LA SUMA
		BX		LR			;RETORNA LA FUNCION PRINCIPAL
		ENDP
			
		AREA myDATA,DATA
t		DCD		0
		END					;FIN DEL PROGRAMA