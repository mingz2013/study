package com.mingzz.smacktest05;

import java.util.Scanner;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ChatManager;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Message;

public class SmackTest05 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ConnectionConfiguration config = new ConnectionConfiguration("127.0.0.1", 5222);
		config.setCompressionEnabled(true);
		config.setSASLAuthenticationEnabled(true);

		Connection connection = new XMPPConnection(config);
		
		try {
			// Connect to the server
			connection.connect();
			// Log into the server
			connection.login("admin", "admin", "SomeResource");
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Assume we've created a Connection name "connection".
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

}