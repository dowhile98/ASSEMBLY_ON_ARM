;ENCENDER UN LED SI BUTTON ES PRESIONADO
;PA0->BUTTON
;PA1->LED
				INCLUDE stm32f407_constants.s		;se incluyen las constantes definicion de registros
				INCLUDE delay_systick.s
				AREA |.text|,CODE,READONLY,ALIGN=2
				EXPORT	__main
				IMPORT morseTime
				ENTRY
__main			PROC
				BL		GPIO_Init
loop			
				
				LDR		R6,=morseTime
				MOV 	R7,#0
forLoop			CMP		R7,#17
				BHI		endLoop
				LDR		R0,=GPIOA_BASE
				LDR		R1,[R0,#GPIO_ODR]
				EOR		R1,R1,#2
				STR		R1,[R0,#GPIO_ODR]
				LDR		R5,[R6,R7,LSL #2]
				MOV		R0,R5
				BL		delay_ms
				ADD		R7,R7,#1
				B		forLoop
endLoop			B		loop
				ENDP
					
GPIO_Init		PROC
				LDR		R0,=RCC_BASE
				LDR		R1,[R0,#RCC_AHB1ENR]
				ORR		R1,R1,#1
				STR		R1,[R0,#RCC_AHB1ENR]
				
				;se configura la PA1 como salida
				LDR 	r0, =GPIOA_BASE					; Load GPIO Port D base address
				;SE SELECCIONA EL MODO
				LDR		R1,[R0,#GPIO_MODER]
				BIC		R1,R1,#0xF
				ORR		R1,R1,#4						;PA0->ENTRADA , PA1->SALIDA
				STR		R1,[R0,#GPIO_MODER]
				;SE SELECCIONA EL TIPO
				LDR		R1,[R0,#GPIO_OTYPER]
				BIC		R1,R1,#3						;SE RESETEA OT0 Y OT1
				STR		R1,[R0,#GPIO_OTYPER]
				;SE CONFIGURA LA RAPIDEZ
				LDR		R1,[R0,#GPIO_OSPEEDR]
				BIC		R1,R1,#0xF
				ORR		R1,R1,#4						;MEDIUM SPEED
				STR		R1,[R0,#GPIO_OSPEEDR]
				;SE CONFIGURA LA RESISTENCIA DE PULL DOWN
				LDR		R1,[R0,#GPIO_PUPDR]
				BIC		R1,R1,#0xF
				ORR		R1,R1,#0
				STR		R1,[R0,#GPIO_PUPDR]
				BX		LR
				ENDP
				ALIGN
				END