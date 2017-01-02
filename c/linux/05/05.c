#include <stdio.h>
int main()
{
	int i = 117;// 定义整型变量i=117
	char a = 'm';	// 定义字符型变量a
	float m = 123.1234567;	// 定义浮点型变量
	printf("%d\n", i);	// 以整型输出
	printf("%c\n", i);	// 以字符型输出i
	printf("%o\n", i);	// 以八进制形式输出i
	printf("%x\n", i);	// 以十六进制小写形式输出i
	printf("%X\n", i);	// 以十六进制大写形式输出
	printf("%c\n", a);	// 以字符型输出a
	printf("%d\n", a);	// 以整型输出a
	printf("%o\n", a); // 以八进制形式输出a
	printf("%x\n", a);	// 以十六进制小写形式输出a
	printf("%X\n", a);	// 以十六进制大写形式输出a
	printf("%f\n", m);	// 以浮点型输出f
	printf("%e\n", m);	// 以科学计数法输出m
	return 0;
}

