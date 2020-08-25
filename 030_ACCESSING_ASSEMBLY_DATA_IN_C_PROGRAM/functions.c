//variable definida en assembler
extern int counter;
int value = 0;
//funcion para obtener el valor
int getValue(void){
	return counter;
	
}
//funcion para incrementar el valor
void increment(void){
	
	counter++;
}
//funcion para establecer el valor
void setValue(int c){
	counter = c;
}	
