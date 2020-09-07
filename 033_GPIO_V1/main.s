;SE DEFINEN LAS DIRECCIONES BASE

AHB3_BASE		EQU			0x60000000
AHB2_BASE		EQU			0x50000000
AHB1_BASE		EQU			0x40020000
APB2_BASE		EQU			0x40010000
APB1_BASE		EQU			0x40000000

;SRAM BASE
SRAM1_BASE		EQU			0x20000000
;PERIFERICOS
RCC_BASE		EQU			(AHB1_BASE + 0x3800)
GPIOA_BASE		EQU			(AHB1_BASE + 0x0000)
GPIOB_BASE		EQU			(AHB1_BASE + 0x0400)
;DEFINICION DE OFSET
RCC_AHB1ENR     EQU  		0x30   ;  RCC AHB1 peripheral clock register,                          Address offset: 0x30

	
GPIO_MODER     	EQU  		0x00   ;  GPIO port mode register,               Address offset: 0x00
GPIO_OTYPER    	EQU  		0x04   ;  GPIO port output type register,        Address offset: 0x04
GPIO_OSPEEDR   	EQU  		0x08   ;  GPIO port output speed register,       Address offset: 0x08
GPIO_PUPDR     	EQU  		0x0C   ;  GPIO port pull-up/pull-down register,  Address offset: 0x0C
GPIO_IDR       	EQU  		0x10   ;  GPIO port input data register,         Address offset: 0x10
GPIO_ODR       	EQU  		0x14   ;  GPIO port output data register,        Address offset: 0x14
GPIO_BSRRL     	EQU  		0x18   ;  GPIO port bit set/reset low register,  Address offset: 0x18
GPIO_BSRRH     	EQU  		0x1A   ;  GPIO port bit set/reset high register, Address offset: 0x1A
GPIO_LCKR      	EQU  		0x1C   ;  GPIO port configuration lock register, Address offset: 0x1C
GPIO_AFR0      	EQU  		0x20   ;  GPIO alternate function registers,     Address offset: 0x20-0x24
GPIO_AFR1      	EQU  		0x24   ;  GPIO alternate function registers,     Address offset: 0x20-0x24
GPIO_AFRL      	EQU  		0x20   ;  GPIO alternate function registers,     Address offset: 0x20-0x24
GPIO_AFRH      	EQU  		0x24   ;  GPIO alternate function registers,     Address offset: 0x20-0x24
	
			AREA |.text|,CODE,READONLY,ALIGN=2
			EXPORT	__main
			ENTRY
__main		PROC
			LDR		R0,=RCC_BASE		;SE CARGA LA DIRECCION BASE DEL REGISTRO RCC
			LDR		R1,[R0,#RCC_AHB1ENR];REGISTRO DE CONTROL DE ACTIVACION DE RELOJ DEL GPIOx
			ORR		R1,R1,#0x1			;ACTIVA EL RELOJ DEL GPIOA
			STR		R1,[R0,#RCC_AHB1ENR];se almacena el valor modificado
			;se configura la PA1 como salida
			LDR 	r0, =GPIOA_BASE					; Load GPIO Port D base address
			LDR 	r1, [r0, #GPIO_MODER]           ; r1 = GPIOD->MODER
			ORR 	r1, r1, #(1 <<1*2)				; Clear mode
			STR 	r1, [r0, #GPIO_MODER] 
			;SE CONFIGURA LA RAPIDEZ
			LDR		R1,[R0,#GPIO_OSPEEDR]
			ORR		R1,R1,#(3<<1*2)
			STR		R1,[R0,#GPIO_OSPEEDR]
			LDR		R7,[R0,#GPIO_ODR]
		
loop		EOR		R7,R7,#2						;R7 = R7^2
			LDR		R0,=GPIOA_BASE	
			STR		R7,[R0,#GPIO_ODR]
			LDR		R0,=100							;TIEMPO DE RETARDO EN MILISEGUNDOS
			BL		delay							;SE LLAMA LA FUNCION DELAY
			B 		loop
			ENDP
;ESTA SUBRUTINA SIMULA UNA FUNCION DELAY				
delay		PROC
for1		CMP		R0,#0
			BLS		endFor1							
			MOV		R1,#0
			LDR		R2,=1700
for2		CMP		R1,R2
			BHI		endFor2
			ADD		R1,R1,#1
			B		for2
endFor2		SUB		R0,R0,#1
			B		for1
endFor1		BX		LR
			ENDP
			ALIGN	
			END
				