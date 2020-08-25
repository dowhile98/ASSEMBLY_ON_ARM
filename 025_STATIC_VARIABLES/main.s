;este programa declara una variable local x
		AREA myDATA,DATA
		ALIGN
x		DCD		5
	
		AREA myCODE,CODE
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
		BL		foo
		BL		foo
		BL		foo
stop	B		stop
		ENDP
			
foo		PROC
		LDR		R1,=x
		LDR		R0,[R0]
		ADD		R0,R0,#1
		STR		R0,[R1]
		BX		LR
		ENDP
		END