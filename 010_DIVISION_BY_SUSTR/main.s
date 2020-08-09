			AREA myCode, CODE, READONLY
			ENTRY
			EXPORT __main

__main		proc	
		    LDR		R0,=0x10
			MOV		R1,#0x4
			MOV		R2,#0		;contendra el valor del cociente
			
AGAIN		CMP		R0,R1		;se compara r0-r1
			BLO		Stop		;si r0<r1
			SUBS	R0,R0,R1	;r0 = r0 - r1
			ADD		R2,R2,#1	;r2 = r2 + 1
			B		AGAIN		;repite la ejecucion
			

Stop		B		Stop
			ENDP
			end