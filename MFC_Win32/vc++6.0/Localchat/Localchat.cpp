// Localchat.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <winsock2.h>
#include <stdio.h>
#include <windows.h>

#pragma comment(lib,"WS2_32.lib")

#define BUF_SIZE 1024   // 缓冲区大小
#define PORT 27015     // 监听端口
#define GROUPADDR "224.0.0.1" // 组播地址
#define MARK "lc" // 数据起始两个字符



char GroupAddr[] = GROUPADDR;

SOCKET Socket;  // 监听套接字
sockaddr_in RecvAddr; // 远端服务器地址，用于接收数据
int RecvAddrSize; // 返回的大小，
sockaddr_in SendAddr; // 远端服务器地址，用于发送数据
//int RecvAddrSize = sizeof(RecvAddr);
sockaddr_in ServAddr; // 本地服务器地址,用于绑定本地ip
char LocalIP[15]; // 本机ip
char hostname[256]; // 本机名字
char SendIP[15]; // 发送ip
char buf[BUF_SIZE]; // 缓冲区
int iResult; // 错误代码
char AddrList[100][32]; // 主机列表
char localstate[4] ;// 主机状态 lgin(在线) lout(离线) chat(聊天中)  
HANDLE hThreadRecv; // 接收线程 



// 定义数据格式
// "lc"+命令四个字节+数据部分
// 命令四个字节：asks(请求聊天),  agre(同意聊天)，deny(拒绝聊天)，quit(退出聊天)，msgs(聊天数据)，
// lgin(主机上线)，lout(主机下线)，olin(主机在线);
// 数据部分




void sendmsg(char ip[],char buf[BUF_SIZE])
{
	char buf2[BUF_SIZE] = MARK;
	strcat(buf2,buf);
	printf("发送的信息：%s\n",buf2);
	
	SendAddr.sin_addr.S_un.S_addr = inet_addr(ip);
	
	sendto(Socket,buf2,sizeof(buf2),0,(SOCKADDR*)&SendAddr,sizeof(SendAddr));
	
}


void chat(char ip[])
{//开始聊天
	void quitchat(char ip[]);
	// 初始化
	strcpy(localstate,"chat");
	//localstate = "chat";
	system("cls");
	system("color 34");
	system("mode con:cols=50 lines=30");
	char title[50];
	sprintf(title,"%s %s","title chating with",ip);
	system(title);
	
	char msg[BUF_SIZE];
	
	
	while(true)
	{
		ZeroMemory(msg,BUF_SIZE);
		printf("\n**<@>:");
		gets(msg);
		
		char msgs[BUF_SIZE];
		sprintf(msgs,"%s%s","msgs",msg);
		
		if(strcmp(msg,"quit") == 0)
		{
			quitchat(ip);
			break;
		}
		else if(strcmp(msg,"") == 0)
		{
			// 输入为空
			continue;
		}
		else
		{
			char msgs[BUF_SIZE];
			sprintf(msgs,"%s%s","msgs",msg);
			sendmsg(ip,msgs);
			continue;
			
		}
		
		
		
	}
	return;
	
	
}
void denychat(char ip[])
{// 拒绝聊天
	char msg[] = "deny"; 
	sendmsg(ip,msg);
	return;
	
}
void agrechat(char ip[])
{//同意聊天
	char msg[BUF_SIZE] = "agre";
	sendmsg(ip,msg);
	chat(ip);
}

void doasks(char ip[])
{//处理聊天请求
	void doasks(char ip[]);
	
	
	printf("%s 想要和你聊天，同意回复y/Y,不同意回复n/N\r\n",ip);
	char yesno ;
	scanf("%c",&yesno);
	switch(yesno)
	{
	case'n':
	case'N':denychat(ip);break;
	case'y':
	case'Y':agrechat(ip);break;
	default:
		printf("输入有误，请重新输入\n");
		doasks(ip);
	}
	return;
	
	
}
void doquit(char ip[])
{// 被动退出聊天
	//void help();
	//closesocket();
	//char msg[] = "quit";
	//	sendmsg(SendIP,msg);
	//localstate = "login";
	strcpy(localstate,"lgin");
	ZeroMemory(SendIP,15);
	printf("%s已退出，任意键返回\n",ip);
	char ch;
	getchar(ch);
	/*
	system("mode con:cols=80 lines=40"); 
	system("cls");
	printf("{{{{{{{{{{{{{{{{{局域网聊天}}}}}}}}}}}}}}}}}\n\n");
	help();
	*/
	return ;
	
}






// 处理接收到的数据
void dobuf(char buf[BUF_SIZE],sockaddr_in RecvAddr)
{
	
	//处理接收到的数据
	char str1[30];
	
	ZeroMemory(str1,30);
	strncpy(str1,buf,2);
	if(strcmp(str1,MARK) == 0)
	{  // 是有效数据
		char TempIP[15];
		strcpy(TempIP,inet_ntoa(RecvAddr.sin_addr));
		if(RecvAddr.sin_addr.S_un.S_addr == inet_addr(GroupAddr))
		{ // 是专用广播地址
			ZeroMemory(str1,30);
			strncpy(str1,buf+2,4); // 将buf4个命令字符复制到str1中
			if(strcmp(str1,"lgin") == 0)
			{// 有用户加入join.....,,,取得其ip，加入在线主机列表，并广播自己在线
				ZeroMemory(str1,30);
				strncpy(str1,buf+6,24); // 取出第6个字符以后的，从第五个开始
				strcpy(AddrList[sizeof(AddrList)],str1);// 将主机加入列表
				// 打开服务器，广播进入
				printf("在线声明。。。。。..\n");
				char olin[30] = "olin";
				strcat(olin,LocalIP);  
				//sendto(Socket,ipjoin,14,0,(SOCKADDR*)&RecvAddr,RecvAddrSize);
				sendmsg(GroupAddr,olin);
				return;
			}
			else if(strcmp(str1,"lout") == 0)
			{// 有主机退出.........，在列表中寻找该ip，若找到，删除，找不到，不作处理
				ZeroMemory(str1,30);
				strncpy(str1,buf+6,24); // 取出第四个字符以后的，从第五个开始
				int j = -1;
				for(int i = 0;i < sizeof(AddrList) ;i++)
				{
					if(strcmp(str1,AddrList[i]) == 0)// 找到主机
					{
						j = i;
						break;
						
					}
					
				}
				if(j > -1)
				{
					for(i = j + 1;i < sizeof(AddrList) + 1;i++)
					{
						ZeroMemory(AddrList[i - 1],30);
						strcpy(AddrList[i - 1],AddrList[i]);
						
					}
					
				}
				return;
				
				
				
			}
			else if(strcmp(str1,"olin") == 0)
			{// 有主机在线，查找列表，如果没有，则添加
				ZeroMemory(str1,30);
				strncpy(str1,buf+6,24); // 取出第6个字符以后的，从第五个开始
				int j = -1;
				for(int i = 0;i < sizeof(AddrList) ;i++)
				{
					if(strcmp(str1,AddrList[i]) == 0)// 找到主机
					{
						j = i;
						break;
						
					}
					
				}
				if(j = -1) // 没找到
				{
					strcpy(AddrList[sizeof(AddrList)],str1);// 将主机加入列表
					return;
				}
				return;
			}
			else
			{ // 不是有效命令，不作处理
				return;
			}
			return;
			
		}
		else
		{// 不是专用广播地址，是用户数据
			strcmp(SendIP,TempIP);
			
			ZeroMemory(str1,30);
			strncpy(str1,buf+2,4); // 将buf4个命令字符复制到str1中
			if(strcmp(str1,"asks") == 0)
			{// 聊天请求
				doasks(TempIP);
				return;
			}
			else if(strcmp(str1,"agre") == 0)
			{//对方 同意聊天
				chat(TempIP);
				return;
			}
			else if(strcmp(str1,"deny") == 0)
			{// 对方拒绝聊天
				printf("--%s 拒绝了您的聊天请求 \n",TempIP);
				return;
			}
			else if(strcmp(str1,"quit") == 0)
			{// 对方退出聊天聊天
				doquit(TempIP);
				return;
			}
			else if(strcmp(str1,"msgs") == 0)
			{// 聊天数据
				printf("接收到的聊天数据---%s---\n",buf);
				char buf3[BUF_SIZE] ;
				ZeroMemory(buf3,BUF_SIZE);
				strncpy(buf3,buf+6,BUF_SIZE - 6); 
				printf("接到来自%s的信息：%s\n",TempIP,buf3);
				return;
			}
			else
			{// 错误命令，不作处理
				return;
				
			}
			return ;
		}
		return;
	}
	else
	{// 不是有效数据,不做处理
		return ;
	}
	return;
}

DWORD WINAPI receive(LPVOID lpParameter)
{// 接收数据
	DWORD WINAPI receive(LPVOID lpParameter);
	// 调用recvfrom() 函数在绑定的Socket上接收数据
	printf("进入接收数据函数.....\n");
	
	RecvAddr.sin_addr.S_un.S_addr = inet_addr("");; // 远端服务器地址，用于接收数据
	RecvAddrSize = sizeof(RecvAddr); // 返回的大小，
	printf("清零地址等待接收数据.....\n");
	
	recvfrom(Socket,buf,BUF_SIZE,0,(SOCKADDR*)&RecvAddr,&RecvAddrSize);//MSG_WAITALL 设置阻塞操作，就是接收不到数据就等待
	printf("等待接收数据....接受到的数据：-----%s----.\n",buf);
	
	// 处理数据
	dobuf(buf,RecvAddr);
	printf("处理完数据，.....\r\n");
	receive(lpParameter);
	return 0;
	
}

int login()
{
	// 初始化WS2_32.dll
	WSADATA wsaData; // WSADATA变量，用于初始化Windows Socket
	WORD sockVersion = MAKEWORD(2,2);
	iResult = ::WSAStartup(sockVersion,&wsaData);
	if(iResult != NO_ERROR)
	{
		printf("Error at WSAStartup \n");
	}
	
	
	
	// 创建UDP Socket
	Socket = ::socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
	if(Socket == INVALID_SOCKET)
	{
		printf("Failed socket() \n");
		::WSACleanup();
		return -1;
	}
	
        // 得到主机名----------------------------------------测试
	printf("获取主机名。。。。。。\n");
	
	int res = gethostname(hostname, sizeof(hostname));
	if (res != 0) {
		printf("Error: %u\n", WSAGetLastError());
		return -1;
	}
	printf("hostname=%s\n", hostname);
	/*/ 获得本地ip
	hostent* pHostent = gethostbyname(hostname);
	if (pHostent==NULL) {
	printf("Error: %u\n", WSAGetLastError());
	return -1;
	}
	hostent& he = *pHostent;
	printf("name=%s\naliases=%s\naddrtype=%d\nlength=%d\n",
	he.h_name, he.h_aliases, he.h_addrtype, he.h_length);
	sockaddr_in sa;
	for (int nAdapter=0; he.h_addr_list[nAdapter]; nAdapter++) {
	memcpy ( &sa.sin_addr.s_addr, he.h_addr_list[nAdapter],he.h_length);
	
	  printf("Address: %s\n", inet_ntoa(sa.sin_addr)); 
	  }
	*/
	//----------------------------------------------------------------;;;;	
	// 获得本地ip
	
	hostent* host = gethostbyname("");
	char* IP = inet_ntoa(*(struct in_addr*)*(host->h_addr_list)); 
	sprintf(LocalIP,"%s",IP); // 合并字符串到 ip 中
	printf("-----%s-------\n",LocalIP);
	
	
	
	
	// 绑定本地端口
	
	ServAddr.sin_family = AF_INET;
	ServAddr.sin_port = htons(PORT);
	ServAddr.sin_addr.S_un.S_addr = inet_addr(LocalIP);
	iResult = bind(Socket,(SOCKADDR*)&ServAddr,sizeof(ServAddr));
	if(iResult == SOCKET_ERROR)
	{
		printf("bind failed \n");
		closesocket(Socket);
		return -1;
	}
	printf("绑定本地端口成功\n");
	
	// 设置用于接收的地址  
	RecvAddr.sin_family = AF_INET;
	RecvAddr.sin_port = htons(PORT);
	//RecvAddr.sin_addr.S_un.S_addr = inet_addr(GroupAddr);
	
	// 设置用于发送的地址  
	SendAddr.sin_family = AF_INET;
	SendAddr.sin_port = htons(PORT);
	// 打开服务器，广播进入
	printf("Sending 'localchat.join' to GroupAddr.....\n");
	char join[30] = "lgin";
	
	strcat(join,LocalIP);  // 死掉的原因所在,未设置缓冲区大小 ，设为30
	printf("广播的信息：%s\n",join);
	//sendto(Socket,ipjoin,14,0,(SOCKADDR*)&RecvAddr,RecvAddrSize);
	sendmsg(GroupAddr,join);  
	
	//localstate = "login";
	strcpy(localstate,"lgin");
	printf("初始化完成....... \n");
	
	
	
	return 0;
	
}


void help()
{
	printf("|****************帮助菜单****************8|\n");
	printf("|.help--显示帮助菜单                     8|\n");
	printf("|.list--显示在线列表                     8|\n");
	printf("|.chat--进入聊天                         8|\n");
	printf("|.quit--退出聊天                         8|\n");
	printf("|.exit--退出程序                         8|\n");
	printf("|.login--登录                            8|\n");
	printf("|.logout--退出                           8|\n");
	printf("|.mkroon--创建聊天室                     8|\n");
	printf("|.localip--查看本机信息                  8|\n");
	printf("|.login--登录                            8|\n");
	printf("|.login--登录                            8|\n");
	printf("|****************************************8|\n");
	return;
	
}
void showlist()
{
	int j;
	printf("|**************在线主机列表：************8|\n");
	for(int i = 0;i < strlen(AddrList[100]) ;i++)
	{
		j = i - 1;
		printf("|%d.%s                           8|\n",i,AddrList[i]);
	}
	if(j < 0)
	{
		j = 0;
	}
	printf("|----------在线主机数目：%d -------------8|\n",j);
	printf("|****************************************8|\n");
	
	return;
}




void logout()
{
	
	sendmsg(GroupAddr,"lout");
	CloseHandle(hThreadRecv); // 销毁接收数据进程
	closesocket(Socket);
	WSACleanup();
	//localstate = "logout";
	strcpy(localstate,"lout");
	printf("已退出登录\n");
	return;
	
}

void dochat()
{// 请求聊天
	char ip[15];
	printf("请输入对方ip : ");
	//scanf("%s",&ip);
	gets(ip);
	char msg[] = "asks";
	sendmsg(ip,msg);
	printf("聊天请求已发出，等待对方回应。。。\n");
	return;
}

void quitchat(char ip[])
{// 主动退出聊天
	//closesocket();
	char msg[] = "quit";
	sendmsg(ip,msg);
	//localstate = "login";
	strcpy(localstate,"lgin");
	ZeroMemory(SendIP,15);
	printf("聊天已退出\n");
	/*
	system("mode con:cols=80 lines=40"); 
	system("cls");
	printf("{{{{{{{{{{{{{{{{{局域网聊天}}}}}}}}}}}}}}}}}\n\n");
	help();
	*/
	return ;
	
}
/*
void exitsy()
{
logout();
return;

  }	
*/

void docmd()
{
	while(true)
	{
		char cmd[10];
		printf(">>");
		//scanf("%s",&cmd);
		gets(cmd);
		//	printf("|--%s--|\n",cmd);
		
		if(strlen(cmd) == 0)
		{
			//printf(">>");
			continue;
		}
		else if(strcmp(cmd,"help") == 0)
		{
			help();
			continue;
		}
		else if(strcmp(cmd,"list") == 0)
		{
			if(strcmp(localstate,"lout") == 0)
			{
				printf("请先登录--\n");
			}
			else
			{
				showlist();
			}
			continue;
		}
		else if(strcmp(cmd,"chat") == 0)
		{
			if(strcmp(localstate,"lout") == 0)
			{
				printf("请先登录--\n");
			}
			else
			{
				dochat();
			}
			
			continue;
		}
		
		else if(strcmp(cmd,"quit") == 0)
		{
			if(strcpy(localstate,"chat") == 0)
			{
				quitchat(SendIP);// 退出聊天
			}
			else
			{
				printf("您未处于聊天状态\n");
			}
			continue;
		}
		
		else if(strcmp(cmd,"exit") == 0)
		{
			logout();
			break;
		}
		else if(strcmp(cmd,"login") == 0)
		{
			if(strcmp(localstate,"lout") == 0)
			{
				printf("进入login命令。。。。\n");
				int i ;
				i = login();
				printf("login() 返回。。。。。\n");
				if(i == -1)
				{
					printf("login()失败。。。\n");
					continue;
				}
				else if(i == 0)
				{
					printf("初始化成功,login()返回0\n");
				}
				
				printf("开始创建线程....... \n");
				
				
				DWORD dwThreadId;
				// 接收数据
				// receive();
				
				
				// 创建一个线程
				hThreadRecv = ::CreateThread(
					NULL,// 默认安全属性
					NULL,// 默认堆栈大小
					receive,// 线程入口地址（执行线程的函数）
					NULL,// 传递给函数的参数
					0,// 指定线程立即运行
					&dwThreadId);// 返回线程的ID号
				printf("Now another thread has been created. ID = %d \n",dwThreadId);
				/*/ 等待新线程运行结束
				::WaitForSingleObject(hThread,INFINITE);
				::CloseHandle(hThreadRecv);
				*/
			}
			else
			{
				printf("您已登录，不能重复登录");
			}
			continue;
			
		}
		else if(strcmp(cmd,"logout") == 0)
		{
			if(strcmp(localstate,"lout") == 0)
			{
				printf("您已离线 ，不能重复离线\n");
			}
			else
			{
				logout();
			}
			continue;
		}
		else if(strcmp(cmd,"mkroom") == 0)
		{
			printf("此功能尚未完成，请体验其它功能\n");
			help();
			continue;
		}
		else if(strcmp(cmd,"localip") == 0)
		{
			if(strcmp(localstate,"lout") == 0)
			{
				printf("您已离线，请先登录\n");
			}
			else
			{
				printf("localip:%s \n",LocalIP);
			}
			continue;
		}
		else
		{
			printf("error cmd,you can take 'help'\n");
			help();
			continue;
			
		}
		
		
		
		}
		return;
}

void init()
{
	printf("正在初始化....... \n");
	
	
	// 设置窗体显示
	//system();// 执行dos命令
	system("title 局域网聊天----明子制作--QQ：305603665");
	system("color 5f");
	//	char setting[30]; 
	//	sprintf(setting,"mode con:cols=%d lines=%d",x,y); 
	system("mode con:cols=80 lines=40"); 
	system("cls");
	//localstate = "logout";
	strcpy(localstate,"lout");
	printf("{{{{{{{{{{{{{{{{{局域网聊天}}}}}}}}}}}}}}}}}\n\n");
	help();
	
	
	
	return ;
}

int main(int argc, char* argv[])
{
/*
void dobuf(char buf[BUF_SIZE],sockaddr_in RecvAddr);// 处理buf
void help();       // 帮助命令
void login();      // 登录
void init()；// 初始化
void docmd();  // 处理命令
void showlist(); // 显示在线主机
void logout(); // 退出登录
viod exitsy();

  void dowantchat(char ip[]);// 处理聊天请求
  void nochat(char ip[]); // 拒绝聊天
  void yeschat(char ip[]); // 同意聊天
  void chat(char ip[]); // 开始聊天，处理聊天
  void dochat();// 发起聊天
  void quitchat();// 退出聊天
  
    void sendmsg(char ip[],char buf[BUF_SIZE]); // 发送消息
    void receive(); // 接收数据
    
      
	*/
	
	
	init();// 初始化
	//login();
	docmd();
	
	return 0;
	
}









