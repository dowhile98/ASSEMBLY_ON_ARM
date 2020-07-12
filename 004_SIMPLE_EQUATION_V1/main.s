; P = Q + R + S
; Q = 3, R=2, S = 4

;DEFINICION DE CONSTANTES
Q		EQU		3
R		EQU		2
S		EQU		4

;ZONA DE CODIGO
		AREA myCODE, CODE, READONLY
		ENTRY
		EXPORT	__main
			
__main	PROC			;subrutina principal
		MOV		R1,#Q	;carga el valor de Q al registro R1
		MOV		R2,#R	;Carga el valor de R al registro R2
		MOV 	R3,#S	;carga el valor de S al registro R3
		ADD		R0,R1,R2;R0 = R1 + R2
		ADD		R0,R0,R3;R0 = R0 + R3
	
Loop	B		Loop	;bucle infinito

		ENDP			;fin de la subrutina
		END				;fin del programa