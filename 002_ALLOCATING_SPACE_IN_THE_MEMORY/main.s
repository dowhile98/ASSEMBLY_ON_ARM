;ESTE PROGRAMA RESERVA MEMORIA CON LA INSTRUCCION SPACE

;********************************************************
;*				AREA DE CODIGO							*
;********************************************************

		AREA myCODE, CODE, READONLY
		ENTRY
		EXPORT 	__main

__main
		LDR		R0,=A		;carga la direecion de memoria de A
		MOV		R1,#0x44	;Carga el numero 4 al registro R1
		STR		R1,[R0]		;guarda el contenido del registro R1 al direccion apuntada por R0
		
		LDR		R0,=C		;carga la direecion de memoria de C
		MOV		R1,#0x50	;Carga el numero 4 al registro R1
		STR		R1,[R0]		;guarda el contenido del registro R1 al direccion apuntada por R0
		
Stop	B		Stop		;ciclo infinito

;********************************************************
;*				AREA DE DATOS							*
;********************************************************
		AREA myDATA, DATA, READWRITE
		
A		SPACE	4			;reserva 4 bytes con la etiqueta A
C		SPACE	4			;reserva 4 bytes con la etiqueta C 	
		END					;FIN DEL PROGRAMA