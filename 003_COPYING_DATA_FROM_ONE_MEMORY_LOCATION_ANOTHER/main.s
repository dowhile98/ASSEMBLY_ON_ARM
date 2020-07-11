;este programa almacena un valor hexadecimal en una direccion de memoria y luego copia los valores en otra
;DEFINICION DE CONSTANTES SIMBOLICAS

RAM1_ADDR	EQU		0x20000000		;direccion de memoria de la sramm
RAM2_ADDR	EQU		0x20000100		;otra direccion de memoria de la sram
			
			;AREA DE CODIGO
			AREA myCODE, CODE,READONLY
			ENTRY
			EXPORT	__main

__main
			BL		FILL			;Subrutina que el almacena el valor hexadecimal en RAM1_ADDR
			BL		COPY			;subrutina que copia los datos de RAM1_ADRR a RAM2_ADR
					
Stop		B		Stop			;bucle infinito
					
FILL		LDR		R1,= RAM1_ADDR	;carga la direccion el valor a RAM1_ADDR a R1
			MOV		R0,#10			;carga el valor del literal a R0
			LDR		R2,=0xAAAABBBB	;carga el valor del hexadecinal a R2
					
L1			STR		R2,[R1],#4		;almacena el contenido de R2 a la direccion contenida por R1
									;R1 = R1 + 4
			SUBS	R0,R0,#1		;R0 = R0 - 1
			CMP		R0,#0			;Instruccion de comparacion(R0-0)
			BNE		L1				;si no son iguales
			BX		LR				;finaliza la subrutina y regresa a __main
					
COPY		LDR		R1,=RAM1_ADDR	;carga la direccion el valor a RAM1_ADDR a R1
			LDR		R2,=RAM2_ADDR	;carga la direccion el valor a RAM1_ADDR a R1
			MOV		R0,#10			;carga el valor del literal a R0

L2			LDR 	R3,[R1],#4		;carga el contenido de la direccion apuntada por r1
									;R1 = R1 + 4 luego de ejecutarse la instruccion
			STR		R3,[R2],#4		;almacena el contenido de R3 a la direccio apuntada por R2
									;R2 = R2 + 4 luego de ejecutar la instruccion
			SUBS	R0,R0,#1		;R0 = R0-1
			CMP		R0,#0			;RO - 0
			BNE		L2				;SI NO SON IGUALES
			BX		LR				;finaliza la subrutina y retorna a __main
			
			END
			
