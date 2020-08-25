//ESTE PROGRAMA COMBINA C CON ASSEMBLER
#include "stm32f10x.h"                  // Device header

/*SE DECLARA UNA FUNCION INLINE ASSEMBLER*/
__asm int	sum(int a,int b,int c,int d,int e,int f){
	PUSH	{R4-R7,LR}
	LDRD	R5,R6,[SP,#20]
	MOV		R4,R0
	ADD		R4,R4,R1
	ADD		R4,R4,R2
	ADD		R4,R4,R5
	ADD		R4,R4,R6
	ADD		R0,R4,R3
	POP		{R4-R7,PC}
}

/*INTRUNCCION ASSEMBLER DENTRO DE UNA FUNCION C*/
int producto(int a,int b){
	int p;
	__asm{
		MUL 	p,a,b		//p->a*b
	}
	return p;
}
//variables globales  para mostrar el resultado
int s;
int pro;

int main(void){
	s = sum(1,2,3,4,5,6);			//se llama la funcion inlina assembler
	pro = producto(10,40);		// se llama la funcion c con instruccion assembler
	while(1){
		
	}
	
}
