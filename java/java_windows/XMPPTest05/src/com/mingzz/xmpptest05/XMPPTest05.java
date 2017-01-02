package com.mingzz.xmpptest05;

import java.io.File;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smackx.filetransfer.*;

public class XMPPTest05 {
	/**
	 * �����ļ�
	 * �����ǡ���������Դ������ȫ��ͬ�������û��ſ��Ի����ļ���������Զ��û��Ӧ��
	 * һֱ���ܷ����ء�����������������
	 * */

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
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
		  try {
			connection.login("admin", "admin","Spark");// �����ǡ���������Դ������ȫ��ͬ�������û��ſ��Ի����ļ���������Զ��û��Ӧ��
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		  Presence pre = connection.getRoster().getPresence("test@localhost");  
		    System.out.println("pre--->" + pre);  
		    if (pre.getType() != Presence.Type.unavailable) {  
		        // �����ļ����������  
		        FileTransferManager manager = new FileTransferManager(connection);  
		        // ����������ļ�����  
		        OutgoingFileTransfer transfer = manager  
		                .createOutgoingFileTransfer(pre.getFrom());  
		        // �����ļ�  
		        try {
					transfer.sendFile(new File("1.jpg"), "ͼƬ");
				} catch (XMPPException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
		        while (!transfer.isDone()) {  
		            if (transfer.getStatus() == FileTransfer.Status.in_progress) {  
		                // ���Ե���transfer.getProgress();��ô���Ľ��ȡ�  
		                System.out.println(transfer.getStatus());  
		                System.out.println(transfer.getProgress());  
		                System.out.println(transfer.isDone());  
		            }  
		        }  
		    } 

	}

}