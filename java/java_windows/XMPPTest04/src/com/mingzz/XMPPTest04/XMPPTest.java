package com.mingzz.XMPPTest04;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.*;
import org.jivesoftware.smackx.OfflineMessageManager;

public class XMPPTest {
	/***
	 * 
	 * ����������Ϣ ������
	 * ����ǰ����������Ϣ��Ȼ��������
	 * ��Ҫsmackx ��
	 * 
	 * */

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
		connectionConfig.setSendPresence(false);//��Ҫ���߷������Լ���״̬  
		Connection connection = new XMPPConnection(connectionConfig);  
		try {  
		    connection.connect();// ��������  
		    accountManager = connection.getAccountManager();// ��ȡ�˻�������  
		} catch (XMPPException e) {  
		    throw new IllegalStateException(e);  
		}   
		try {
			connection.login("admin", "admin","SmackTest");
		} catch (XMPPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}   
		
		OfflineMessageManager offlineManager = new OfflineMessageManager(connection);  
		try {  
		    Iterator<org.jivesoftware.smack.packet.Message> it = offlineManager.getMessages();  
		  
		    System.out.println(offlineManager.supportsFlexibleRetrieval());  
		    System.out.println("������Ϣ����: " + offlineManager.getMessageCount());  
		  
		    Map<String, ArrayList<Message>> offlineMsgs = new HashMap<String, ArrayList<Message>>();  
		  
		    while (it.hasNext()) {  
		        org.jivesoftware.smack.packet.Message message = it.next();  
		        System.out  
		                .println("�յ�������Ϣ, Received from ��" + message.getFrom()  
		                        + "�� message: " + message.getBody());  
		        String fromUser = message.getFrom().split("/")[0];  
		  
		        if (offlineMsgs.containsKey(fromUser)) {  
		            offlineMsgs.get(fromUser).add(message);  
		        } else {  
		            ArrayList<Message> temp = new ArrayList<Message>();  
		            temp.add(message);  
		            offlineMsgs.put(fromUser, temp);  
		        }  
		    }  
		  
		    // ��������д���������Ϣ����......  
		    Set<String> keys = offlineMsgs.keySet();  
		    Iterator<String> offIt = keys.iterator();  
		    while (offIt.hasNext()) {  
		        String key = offIt.next();  
		        ArrayList<Message> ms = offlineMsgs.get(key);  
		  
		        for (int i = 0; i < ms.size(); i++) {  
		            System.out.println("-->" + ms.get(i));  
		        }  
		    }  
		  
		    offlineManager.deleteMessages();  
		} catch (Exception e) {  
		    e.printStackTrace();  
		}  
		try {
			offlineManager.deleteMessages();
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//ɾ������������Ϣ  
		Presence presence = new Presence(Presence.Type.available);  
		connection.sendPacket(presence);//������  
		connection.disconnect();//�ر�����  

	}

}