;este programa compara dos cadenas

		;AREA DE DATOS
		AREA myDATA,DATA,READWRITE,ALIGN=2

str1	DCB	"stm32",0
str2	DCB	"stm32",0
result	DCW	0

		;AREA DE CODIGO
		AREA my_strcmp,CODE,CODE
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
		LDR		R0,=str1
		LDR		R1,=str2
		BL		strcmp
		
		LDR		R1,=result
		ALIGN
		STR		R1,[R0]
stop	B		stop
		ENDP
			
;FUNCION QUE COMPARA LOS STRING
strcmp	PROC
		;R0 = s , R1 = t
		LDRB	R2,[R0],#1	;post-index
		LDRB	R3,[R1],#1	;post-index
loop	CBZ		R2,exit
		CMP		R2,R3
		BEQ		loop
		
exit	SUB		R0,R2,R3	;R0 = *S-*T
		BX		LR			;retorna R0
		ENDP
			
		END