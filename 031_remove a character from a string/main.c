
//DEFINCICION DE UNA CADENA
char str[] = "STM32F103C8";
//DEFICION DE PROTOTIPO DE FUNCIOENS
void removeChar(char *s,char c);
int main(void){
	//se llama de funcion definida en c
	removeChar(str,'8');
	removeChar(str,'S');
	while(1);
}
