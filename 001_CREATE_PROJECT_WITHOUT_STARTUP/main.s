Stack 		EQU		0x00000100		;Define staxk size of 256 bytes
	
			AREA STACK,NOINIT,READWRITE,ALIGN=3

StackMem 	SPACE	Stack
	
			AREA RESET,DATA, READONLY
			EXPORT __Vectors
		
	
__Vectors
			DCD	StackMem +Stack
			DCD	Reset_Handler
			ALIGN
		
			AREA SimpleProject,CODE,READONLY,ALIGN=2
			ENTRY
			EXPORT	Reset_Handler
		
Reset_Handler
		    MOV  R0,#0x1234
			MOV  R1,#0x1234
			
			ADD  R2,R0,R1

STOP		B		STOP
			
			END