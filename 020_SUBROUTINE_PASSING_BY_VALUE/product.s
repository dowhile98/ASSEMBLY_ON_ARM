		AREA procducto,CODE
		EXPORT	product
		ENTRY
product	PROC
		MUL		R0,R0,R1
		BX		LR
		ENDP
		END