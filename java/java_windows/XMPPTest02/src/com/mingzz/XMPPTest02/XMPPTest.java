package com.mingzz.XMPPTest02;

import java.util.Scanner;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class XMPPTest {
	
	/**
	 * ����ѭ������ �� ������Ϣ
	 * ��һ��������**/
	public void login2(){
		XMPPConnection.DEBUG_ENABLED = true;  
		AccountManager accountManager;  
		final ConnectionConfiguration connectionConfig = new ConnectionConfiguration(  
		        "localhost", Integer.parseInt("5222"), "localhost");  
		  
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
			connection.login("admin", "admin","SmackTest3");
		} catch (XMPPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}    
		ChatManager chatmanager = connection.getChatManager();  
		Chat newChat = chatmanager.createChat("test@localhost", new MessageListener() {  
		   
			@Override
			public void processMessage(Chat arg0, Message arg1) {
				// TODO Auto-generated method stub
				if (arg1.getBody() != null) {  
		            System.out.println("Received from ��"  
		                    + arg1.getFrom() + "�� message: "  
		                    + arg1.getBody());  
		        }  
				
			}  
		});  
		Scanner input = new Scanner(System.in);  
		while (true) {  
		    String message = input.nextLine();   
		    try {
				newChat.sendMessage(message);
			} catch (XMPPException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}  
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		XMPPTest xmppTest = new XMPPTest();
		xmppTest.login2();

	}

}