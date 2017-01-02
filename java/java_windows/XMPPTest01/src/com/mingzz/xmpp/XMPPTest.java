package com.mingzz.xmpp;

import java.util.Scanner;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class XMPPTest {
	public void login(){
		/**
		 * ��½
		 * �����Ự
		 * ����������Ϣ **/
		
		XMPPConnection.DEBUG_ENABLED = true;  
		AccountManager accountManager;  
		final ConnectionConfiguration connectionConfig = new ConnectionConfiguration(  
		        "127.0.0.1", Integer.parseInt("5222"), "localhost");  
		  
		// �����Զ�����  
		connectionConfig.setReconnectionAllowed(true);  
		connectionConfig.setSendPresence(true);  
		  
		Connection connection = new XMPPConnection(connectionConfig);  
		try {  
		    connection.connect();// ��������  
		    accountManager = connection.getAccountManager();// ��ȡ�˻�������  
		} catch (XMPPException e) {  
		    throw new IllegalStateException(e);  
		}  
		  
		// ��¼  
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