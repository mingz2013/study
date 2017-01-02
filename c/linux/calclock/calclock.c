#include <stdio.h>

int main(void)
{
	int time;
	int i, m, n, k;
	time = 24 * 60 * 60;
	for(i = 0; i < time; i ++){
		m = (i * 720) % 360;
		n = (i * 12) % 360;
		k = i % 360;
		if(m == n && m == k && n == k){
			printf("%d点，时针、分针、秒针重合。\n", i / 60 / 60);
		}
		if(n == k){
			printf("%d点%d分，分针和时针重合。\n", i / 60 / 60, i % 60);
		}
	}
	return 0;
}
