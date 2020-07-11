;ESTRUCTURA BASICA DE PROGRAMA DE ASEMBLER

		AREA myFirstProgram, CODE, READONLY
		ENTRY					;indica la entrada del programa
		EXPORT __main			;accesible desde otro archivo diferente

__main	
		MOV		R0,#0x123		;carga el valor del numero al registro R0
		MOV		R1,#0x100		;carga el valor del numero al registro R1
		ADD		R2,R0,R1		;R2 = R0 + R0
		
stop	B		stop			;ciclo infinito o fin 
		END						;indica el fin del programa
		