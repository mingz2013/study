package com.mingzz.XMPPTest03;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class XMPPTest {
	/**
	 * �������߹㲥
	 * Ҳ���Է������߹㲥���������� ���´��� ������**/

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		XMPPConnection.DEBUG_ENABLED = false;  
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
		try {
			connection.login("admin", "admin","SmackTest3");
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		Message newmsg = new Message();   
		newmsg.setTo("test@localhost");  
		newmsg.setSubject("��Ҫ֪ͨ");  
		newmsg.setBody("��������2��60���лᣡ");  
		newmsg.setType(Message.Type.headline);// normal֧������   
		connection.sendPacket(newmsg);  
		connection.disconnect(); 

	}

}