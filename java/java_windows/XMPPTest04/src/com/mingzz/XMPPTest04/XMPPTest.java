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
	 * 接受离线消息 。。。
	 * 上线前接受离线消息，然后再上线
	 * 需要smackx 包
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
		  
		// 允许自动连接  
		connectionConfig.setReconnectionAllowed(true);  
		connectionConfig.setSendPresence(false);//不要告诉服务器自己的状态  
		Connection connection = new XMPPConnection(connectionConfig);  
		try {  
		    connection.connect();// 开启连接  
		    accountManager = connection.getAccountManager();// 获取账户管理类  
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
		    System.out.println("离线消息数量: " + offlineManager.getMessageCount());  
		  
		    Map<String, ArrayList<Message>> offlineMsgs = new HashMap<String, ArrayList<Message>>();  
		  
		    while (it.hasNext()) {  
		        org.jivesoftware.smack.packet.Message message = it.next();  
		        System.out  
		                .println("收到离线消息, Received from 【" + message.getFrom()  
		                        + "】 message: " + message.getBody());  
		        String fromUser = message.getFrom().split("/")[0];  
		  
		        if (offlineMsgs.containsKey(fromUser)) {  
		            offlineMsgs.get(fromUser).add(message);  
		        } else {  
		            ArrayList<Message> temp = new ArrayList<Message>();  
		            temp.add(message);  
		            offlineMsgs.put(fromUser, temp);  
		        }  
		    }  
		  
		    // 在这里进行处理离线消息集合......  
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
		}//删除所有离线消息  
		Presence presence = new Presence(Presence.Type.available);  
		connection.sendPacket(presence);//上线了  
		connection.disconnect();//关闭连接  

	}

}
