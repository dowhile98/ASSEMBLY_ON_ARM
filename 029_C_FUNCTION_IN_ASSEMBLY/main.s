
;ESTE PROGRMA LLAMA UNA FUNCION ESCRITA EN C
		AREA myCODE,CODE
		EXPORT	__main
		IMPORT	strLen			;SI IMPORTA LA FUNCION ESCRITA EN C
		IMPORT	getValue	[WEAK];no genera errores si no esta definido en otro lugar 
		ALIGN
		ENTRY
		
__main	PROC
		LDR		R0,=Str_s
		BL		strLen			;se llama al funcion escrita en c
stop	B		stop
		ENDP
			
		AREA myData, DATA,READONLY
		ALIGN
Str_s	DCB		"1245678",0		;se define una cadena
		END