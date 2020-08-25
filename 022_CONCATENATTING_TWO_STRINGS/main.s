;este programa concatena dos cadenas de texto
;(NECESITA CORRECCION)
		AREA myDATA,DATA
str1	DCB	"Jeffry",0
result	SPACE	20		;reserva 20bytes para almacenar el resultado
str2	DCB	" Quino",0

		;AREA DE CODIGO
		AREA my_strcat,CODE
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
		LDR		R0,=str1	;primer argumento
		LDR		R1,=str2	;segundo argumento
		BL		strcat
stop	B		stop
		ENDP
;concatenacion de 2 cadenas
strcat	PROC
loop	LDRB	R2,[R0]		;post index
		CBZ		R2,copy		;finaliza si detecta un caracter nulo
		ADD		R0,R0,#1	
		B		loop
		
copy	LDRB	R3,[R1],#1	;post index
		STRB	R3,[R0],#1	;post-index
		CBNZ	R3,copy
		
		BX		LR
		ENDP
		END
