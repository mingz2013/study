package com.mingzz.xmpp;

import java.util.Scanner;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class XMPPTest {
	public void login(){
		/**
		 * 登陆
		 * 创建会话
		 * 发送文字消息 **/
		
		XMPPConnection.DEBUG_ENABLED = true;  
		AccountManager accountManager;  
		final ConnectionConfiguration connectionConfig = new ConnectionConfiguration(  
		        "127.0.0.1", Integer.parseInt("5222"), "localhost");  
		  
		// 允许自动连接  
		connectionConfig.setReconnectionAllowed(true);  
		connectionConfig.setSendPresence(true);  
		  
		Connection connection = new XMPPConnection(connectionConfig);  
		try {  
		    connection.connect();// 开启连接  
		    accountManager = connection.getAccountManager();// 获取账户管理类  
		} catch (XMPPException e) {  
		    throw new IllegalStateException(e);  
		}  
		  
		// 登录  
		try {
			connection.login("admin", "admin","SmackTest");
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		System.out.println(connection.getUser());   
		try {
			connection.getChatManager().createChat("test@localhost",null).sendMessage("Hello word!");
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//login
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		XMPPTest xmppTest = new XMPPTest();
		xmppTest.login();
		//xmppTest.login2();
	
	}

}
