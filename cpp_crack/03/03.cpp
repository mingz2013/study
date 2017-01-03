#include<stdio.h>

int func(int a){
	return a + 1;
}
int getA(){
	return 20;
}
int getB(){
	return 10;
}

int getAB(int a, int b){
	return a + b;
}

int main()
{
	int a = getA();
	int b = getB();
	int ab = getAB(a, b);
	for(int i = 0; i < 10; i++){
		ab = func(ab);
		printf("%d\n", ab);
	}
	return 0;
}
