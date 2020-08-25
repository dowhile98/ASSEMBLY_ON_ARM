;ESTE PROGRAMA INSERTA UN VALOR A UN NUMERO ENTERO DE UN ARRAY

		AREA myDATA,DATA,ALIGN=2
		ALIGN
a		DCD	1,2,4,5,7

		;AREA DE CODIGO
		AREA insert_array,CODE,ALIGN=2
		EXPORT	__main
		ALIGN
		ENTRY

__main	PROC
		MOV		R0,#3	;primer argumento,ELEMENTO A AGREGAR
		LDR		R1,=a	;SEGUNDO ARGUMENTO,PUNTERO AL ARRAY
		ALIGN
		MOV		R2,#5	;TERCER ARGUMENTO, TAMAÑO
		
		BL		insert
stop	B		stop
		ENDP
;SUBRUTINA
insert	PROC
		PUSH 	{R4,LR}
loop	CMP		R2,#0	;verifica si tamaño>0
		BLE		done	
		SUB		R4,R2,#1
		LDR		R4,[R1,R4,LSL #2]	;a[i-1]
		CMP		R0,R4
		BGE		done
		STR		R4,[R1,R2,LSL #2]	;a[i]
		SUB		R2,R2,#1
		B 		loop
done	STR		R0,[R1,R2,LSL #2]	;a[i]=V
		POP		{R4,PC}
		
		ENDP
		END