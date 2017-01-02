package com.mingzz.chat.server;

import java.net.Socket;

import com.mingzz.chat.AbstractConnection;
import com.mingzz.chat.MessageFactory;
import com.mingzz.chat.message.ChatMessage;
import com.mingzz.chat.message.LoginMessage;
import com.mingzz.chat.message.RegisterMessage;
import com.mingzz.chat.message.UserMessage;

public class ChatService extends AbstractConnection implements Runnable{
	// 服务执行线程
	private Thread exec;
	// 用指定的Socket创建一个新的ChatService对象
	public ChatService(Socket s)
	{
		super(s);
		exec = new Thread(this);
		
	}
	// 启动执行线程
	public void start()
	{
		exec.start();
	}
	@Override// 运行执行线程
	public void run() {
		// TODO Auto-generated method stub
		// 打开联接
		if(!open())
		{
			System.err.println("Could not open connection。");
			return;
		}
		// 获取当前线程
		Thread t = Thread.currentThread();
		while(exec == t)
		{
			// 等待下一个消息
			recv();
			// 或qu消息头
			int transmissionFlag = parseTransmissionFlag();
			
			// 如果客户端终止传送则退出
			switch (transmissionFlag) {
			case MessageFactory.TRANS_OF_END:
				close(false);
				System.out.println("\n" + socket.getInetAddress() + " closed connected\n");
				return;
			case MessageFactory.TRANS_OF_USERMESSAGE:
				doUserMessage(transmissionData.userMessage);
				break;
			default:
				System.err.println("Unrecognized transmissionFlag: " + transmissionFlag);
				break;
			}
			try{
				Thread.sleep(25);
			}catch(InterruptedException e){}
		}
	}//run
	
	// do usermessage
	private void doUserMessage(UserMessage userMessage){
		int userMessageType = userMessage.MessageType;
		switch (userMessageType) {
		case MessageFactory.USERMSGTYPE_OF_REGISTER:
			RegisterMessage registerMessage = (RegisterMessage)userMessage.MsgObject;
			System.out.println("register username: " + registerMessage.registerName);
			System.out.println("register password: " + registerMessage.registerPassword);
			break;
		case MessageFactory.USERMSGTYPE_OF_LOGIN:
			LoginMessage loginMessage = (LoginMessage)userMessage.MsgObject;
			System.out.println("login username: " + loginMessage.username);
			System.out.println("login password: " + loginMessage.password);
			break;
		case MessageFactory.USERMSGTYPE_OF_CHAT:
			ChatMessage chatMessage = (ChatMessage)userMessage.MsgObject;
			String message = chatMessage.message;
			System.out.println("\nClient: " +message +"\n");
			send(transmissionData);
			System.out.println("\nServer: " +message +"\n");
			break;
		default:
			System.err.println("Unrecognized userMessageType: " + userMessageType);
			break;
		}
	}

	

}
