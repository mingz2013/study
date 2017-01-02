package com.mingzz.smacktest01;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Presence;

public class SmackTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
		Connection connection = new XMPPConnection("127.0.0.1");
		connection.connect();
		connection.login("admin", "admin");
		Chat chat = connection.getChatManager().createChat("test@localhost", new MessageListener() {
			@Override
			public void processMessage(Chat arg0, Message arg1) {
				// TODO Auto-generated method stub
				System.out.println("Received message: " + arg1);
				
			}
		});
		chat.sendMessage("Howdy!");
		
		// Create a new presence. Pass in false to indicate we're unavailable.
		Presence presence = new Presence(Presence.Type.unavailable);
		presence.setStatus("Gone fishing");
		// Send the packet (assume we have a Connection instance called "con").
		connection.sendPacket(presence);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
