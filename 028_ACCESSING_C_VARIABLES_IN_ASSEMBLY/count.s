

			AREA count,CODE
			IMPORT counter
			ALIGN

;DEFINICION DE FUNCIONES
setValue	PROC
			EXPORT	setValue
			LDR		R1,=counter	;SE LEE LA DIRECCION DE LA VARIABLE
			STR		R0,[R1]		;SE ALMACENA EL VALOR PASADO A R0
			BX		LR			;SE RETORNA DE LA FUNCION
			ENDP
				
getValue	PROC
			EXPORT	getValue
			LDR		R1,=counter
			LDR		R0,[R1]
			BX		LR
			ENDP

increment	PROC
			EXPORT	increment
			LDR		R1,=counter
			LDR		R0,[R1]		;R0->COUTNER
			ADD		R0,R0,#1
			STR		R0,[R1]
			BX		LR
			ENDP
			END