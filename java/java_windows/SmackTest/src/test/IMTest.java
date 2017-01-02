package test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import org.jivesoftware.smack.AccountManager;
import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ChatManager;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smackx.OfflineMessageManager;
import org.jivesoftware.smackx.filetransfer.FileTransfer;
import org.jivesoftware.smackx.filetransfer.FileTransferManager;
import org.jivesoftware.smackx.filetransfer.OutgoingFileTransfer;
import org.jivesoftware.smackx.packet.VCard;

public class IMTest {
	public static void main(String[] args) throws Exception {
		XMPPConnection.DEBUG_ENABLED = false;
		AccountManager accountManager;
		final ConnectionConfiguration connectionConfig = new ConnectionConfiguration(
				"192.168.1.78", Integer.parseInt("5222"), "csdn.shimiso.com");

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
		  connection.login("admin", "admin","Rooyee"); 
		  Presence pre = connection.getRoster().getPresence("shimiso@csdn.shimiso.com");
			System.out.println(pre);
			if (pre.getType() != Presence.Type.unavailable) {
				// 创建文件传输管理器
				FileTransferManager manager = new FileTransferManager(connection);
				// 创建输出的文件传输
				OutgoingFileTransfer transfer = manager
						.createOutgoingFileTransfer(pre.getFrom());
				// 发送文件
				transfer.sendFile(new File("E:\\Chrysanthemum.jpg"), "图片");
				while (!transfer.isDone()) {
					if (transfer.getStatus() == FileTransfer.Status.in_progress) {
						// 可以调用transfer.getProgress();获得传输的进度　
						System.out.println(transfer.getStatus());
						System.out.println(transfer.getProgress());
						System.out.println(transfer.isDone());
					}
				}
			}
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*VCard vcard = new VCard();
		try {
			vcard.load(connection, "admin@ahic.com.cn");
		} catch (XMPPException e) {
			e.printStackTrace();
		}
		System.out.println(vcard.getField("DESC"));*/
		/*
		 * //获取所有离线消息 //getOfflineMsg(connection); connection.sendPacket(new
		 * Presence(Presence.Type.available)); //获取当前登录用户完整JID String
		 * a=connection.getUser(); System.out.println("user: "+a);
		 * 
		 * //来消息监听 PacketListener pListener=new PacketListener() {
		 * 
		 * @Override public void processPacket(Packet packetz) { Message
		 * message=(Message)packetz; System.out.println(message.getBody());
		 * 
		 * } }; connection.addPacketListener(pListener,new
		 * MessageTypeFilter(Message.Type.normal));
		 */

		// 给某人发送消息
		/*
		 * Message newmsg = new Message(); newmsg.setTo("admin@ahic.com.cn");
		 * newmsg.setBody("3333333333333333333333333333333333333333333333");
		 * newmsg.setType(Message.Type.normal);// normal支持离线
		 * newmsg.setProperty("broadcast", "sysMsg");
		 * newmsg.setProperty("summary","213123"); newmsg.setProperty("dlyh",
		 * "11"); newmsg.setProperty("rmtext","12323"); newmsg.setSubject("11");
		 * connection.sendPacket(newmsg);
		 */

		// 获取所有好友列表
		// getFrends(connection);

		// 创建一个聊天室
		// createChat(connection, "beijingsocial@gmail.com");

		// 发送一个文件
		// sendFile(connection, "gyq@zkgj.com");

		// connection.disconnect();//关闭连接
	}

	/**
	 * 
	 * 获取所有离线消息.
	 * 
	 * @param connection
	 * @author 史明松
	 * @update 2012-6-6 上午11:42:16
	 */
	public static void getOfflineMsg(Connection connection) {
		OfflineMessageManager offlineManager = new OfflineMessageManager(
				connection);
		try {
			Iterator<org.jivesoftware.smack.packet.Message> it = offlineManager
					.getMessages();

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

	}

	/**
	 * 获取好友列表
	 * 
	 * @param connection
	 * @return
	 */
	public static void getFrends(Connection connection) {
		// 获取好友列表
		Collection<RosterEntry> rosters = connection.getRoster().getEntries();
		for (RosterEntry rosterEntry : rosters) {
			System.out.println("name: " + rosterEntry.getName() + ",jid: "
					+ rosterEntry.getUser());
		}
	}

	/**
	 * 创建聊天
	 * 
	 * @param connection
	 * @param user
	 * @throws Exception
	 */
	public static void createChat(Connection connection, String user)
			throws Exception {
		Chat newChat = null;
		try {
			ChatManager chatmanager = connection.getChatManager();
			newChat = chatmanager.createChat(user, new MessageListener() {
				public void processMessage(Chat chat, Message message) {
					if (message.getBody() != null) {
						System.out.println("Received from 【"
								+ message.getFrom() + "】 message: "
								+ message.getBody());
					}

				}
			});
			Scanner input = new Scanner(System.in);
			while (true) {
				String message = input.nextLine();
				if (message.equals("s")) {
					sendFile(connection, user);
				} else {
					newChat.sendMessage(message);
				}

			}
		} catch (XMPPException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 发送文件
	 * 
	 * 必须是好友,知道对方完整精确的JID串才可发送文件 ,否则会出异常
	 * 
	 * @param connection
	 * @param user
	 * @throws Exception
	 */
	public static void sendFile(Connection connection, String user)
			throws Exception {
		Presence pre = connection.getRoster().getPresence(user);
		System.out.println(pre);
		if (pre.getType() != Presence.Type.unavailable) {
			// 创建文件传输管理器
			FileTransferManager manager = new FileTransferManager(connection);
			// 创建输出的文件传输
			OutgoingFileTransfer transfer = manager
					.createOutgoingFileTransfer(pre.getFrom());
			// 发送文件
			transfer.sendFile(new File("E:\\Chrysanthemum.jpg"), "图片");
			while (!transfer.isDone()) {
				if (transfer.getStatus() == FileTransfer.Status.in_progress) {
					// 可以调用transfer.getProgress();获得传输的进度　
					System.out.println(transfer.getStatus());
					System.out.println(transfer.getProgress());
					System.out.println(transfer.isDone());
				}
			}
		}

	}
}
