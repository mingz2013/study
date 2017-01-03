// 逐字符匹配密码
//


# include <stdio.h>
# include <string.h>

# define PASSWORD_SIZE	100
# define PASSWORD		"myGOODpassword\n"
// 上面定义中的回车符CR是必要的，因为这样可以省略裁掉用户输入的步骤
//

int main ()
{
	// 记录鉴定失败次数的计数器
	
	int count = 0;

	// 用于存放用户输入的密码符的缓冲区
	
	char buff[PASSWORD_SIZE];

	// 鉴定操作主循环
	
	for(;;){
		// 提示用户输入密码并读取它

		printf("Enter password:");
		fgets(&buff[0], PASSWORD_SIZE, stdin);

		// 针对参照值匹配输入的密码
		if(strcmp(&buff[0], PASSWORD)){
			// 申诉 密码不匹配

			printf("Wrong password\n");

		}else{
			// 否则（密码与参照值一样），退出鉴定循环

			break;
		}

		// 鉴定失败计数值加1 并且在密码试输入三次后终止程序的运行

		if(++count >= 3) return -1;


	}

	// 程序执行到这里，意味着用户输入的密码是正确
	 printf("Password OK \n");
}
