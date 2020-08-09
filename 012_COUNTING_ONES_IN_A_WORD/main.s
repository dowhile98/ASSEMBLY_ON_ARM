;ESTE PROGRAMA CUENTA LA CANTIDAD DE 1S QUE HAY UN CONJUNTO DE 32 BITS

			AREA count_ones, CODE, READONLY
			EXPORT	__main
			ALIGN
			ENTRY
			
__main		PROC
			; R0 = entrada = x
			; R1 = numero de unos = contador
			LDR		R0,=0xAAAAAAAA
			;R1 = R0>>31
			MOV		R1,R0,LSR #31
			
			; R0 = RO<<2 Y CAMBIA EL FLAG C
loop		MOVS	R0,R0,LSR #2
			;R1 = R1 + R0>>31 + CARRY
			ADC		R1,R1,R0,LSR #31
			BNE		loop
stop		B 		stop
			ENDP
			END
			