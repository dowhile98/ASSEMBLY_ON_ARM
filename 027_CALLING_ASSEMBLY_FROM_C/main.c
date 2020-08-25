#include "stm32f10x.h"                  // Device header

int strLen(char *p);										//se pasa un puntero->R0					

int len;																//para almacenar el valor de retorno de la funcion
char str[]="jeffry";										//se define una cadena para la prueba
int main(void){
	len = strLen(str);										//se llama la funcion
	
	while(1){
		
		
	}
	
}
