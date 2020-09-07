AHB1_BASE		EQU			0x40020000
RCC_BASE		EQU			(AHB1_BASE + 0x3800)
GPIOA_BASE		EQU			(AHB1_BASE + 0x0000)
RCC_AHB1ENR     EQU  		0x30   ;  RCC AHB1 peripheral clock register

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
	

		END