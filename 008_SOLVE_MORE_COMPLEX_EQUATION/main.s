;ESTE POGRAMA CALCULA EL NUMERO MAYOR A PARTIR DE UNA LISTA DE NUMEROS
;RENOMBRANDO ALGUNOS REGISTROS
COUNT	RN		R0
MAX		RN		R1
POINTER	RN		R2
NEXT	RN		R3

;AREA DE DATOS
		AREA myDATA,DATA,READONLY
MYDATA	DCD		69,67,32,23,88

;AREA DE DATOS
		AREA myCODE, CODE, READONLY
		ENTRY
		EXPORT	__main
			
__main	PROC
		MOV		COUNT,#5			;ASIGNAMOS 5 AL CONTADOR
		MOV		MAX,#0				;ASIGNAMOS 0 AL VALOR MAXIMO
		LDR		POINTER,=MYDATA		;INICIAMOS EL PUNTERO
		
AGAIN	LDR		NEXT,[POINTER]		;NEXT = contenido de MYDATA
		CMP		MAX,NEXT			;MAX-NEXT ;COMPARA
		BHS		CTNU				;MAX>NEXT
		MOV		MAX,NEXT			;MAXT = NEXT->NUMERO MAYOR
		
		
CTNU	ADD		POINTER,POINTER,#4	;AUMENTA EN 4 EL PUNTERO
		SUBS	COUNT,COUNT,#1		;COUNT = COUNT + 1
		BNE		AGAIN				;COUNT !=0 SI DIFERENTE DE CERO SE REPITE LA SECUENCIA
		
Stoop	B		Stoop
		ENDP
		END