;ESTE PROGRAMA CALCULA EL FACTURIAL DE UN NUMERO N POSITIVO

			AREA factorial,CODE,READONLY
			EXPORT	__main 
		    ENTRY
__main		PROC
			MOV		R0,#1	; R0 = 1, RESULTADO
			MOV		R1,#5	; n = 5
			MOV		R2,#1	; R2 = i = 1
			;SE INICIAN CON EL BUCLE
loop		CMP		R2,R1
			BGT		stop
			MUL		R0,R0,R2; RESULTADO *=i
			ADD		R2,R2,#1; i++
			B 		loop
stop		B stop
			
			ENDP
			END
			