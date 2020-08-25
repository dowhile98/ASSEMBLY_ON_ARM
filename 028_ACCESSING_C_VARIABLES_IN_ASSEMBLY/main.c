

int counter;				//variable global que se modificará mediante las funciones de assembler


//funciones definidas en assembler
int getValue(void);		
void setValue(int num);
void increment(void);
//funcion principal

int main(void){
	
	int c = 0;
	setValue(1);
	increment();
	c = getValue();
	while(1);
}
