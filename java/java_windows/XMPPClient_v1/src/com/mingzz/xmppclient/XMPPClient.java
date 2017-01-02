package com.mingzz.xmppclient;

import java.awt.Image;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.*;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.ReportedData.Row;
import org.jivesoftware.smackx.packet.VCard;
import org.jivesoftware.smackx.search.UserSearchManager;

public class XMPPClient {
	// ����
	public static XMPPConnection getConnection(String domain) throws XMPPException {  
	      
	     XMPPConnection connection = new XMPPConnection(domain);  
	     connection.connect();  
	     return connection;  
	}  //getConnection
	public static XMPPConnection getConnection(String domain,int port) throws XMPPException {  
	     ConnectionConfiguration config = new ConnectionConfiguration(domain,port);  
	     XMPPConnection connection = new XMPPConnection(config);  
	     connection.connect();  
	     return connection;  
	}  //getConnection
	/**
	 * Login
	 * **/
	public static boolean Login(XMPPConnection connection, /*String domain,*/ String username, String password){
		try {
			connection.login(username + "@localhost", password);
			return true;
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * ��MessageListener
	 * @return 
	 *  */
	public static void addChatManagerListener(XMPPConnection connection, ChatManagerListener chatManagerListener){
		connection.getChatManager().addChatListener(chatManagerListener);
	}
	
	/** 
     * ע���û� 
     * @param connection 
     * @param regUserName 
     * @param regUserPwd 
     * @return 
     */  
    public static boolean createAccount(XMPPConnection connection,String regUserName,String regUserPwd)  
    {  
        try {  
            connection.getAccountManager().createAccount(regUserName, regUserPwd);  
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  //createAccount
    
    /** 
     * ɾ����ǰ�û� 
     * @param connection 
     * @return 
     */  
    public static boolean deleteAccount(XMPPConnection connection)  
    {  
        try {  
            connection.getAccountManager().deleteAccount();  
          
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  //deleteAccount
     
    /** 
     * ɾ���޸����� 
     * @param connection 
     * @return 
     */  
    public static boolean changePassword(XMPPConnection connection,String pwd)  
    {  
        try {  
            connection.getAccountManager().changePassword(pwd);  
          
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  //changePassword
    /**
     * createChat
     * **/
    public static Chat ceateChat(XMPPConnection connection, String userName, MessageListener msgListener){
    	return connection.getChatManager().createChat(userName, msgListener); 
    }
    
    /**
     * ������Ϣ**/
    public static void sendMessage(Chat chat,String message) throws XMPPException {  
        chat.sendMessage(message);  
    }  //sendMessage
      
    public static void sendMessage(Chat chat,Message message) throws XMPPException {  
        chat.sendMessage(message);  
    }  //sendMessage
    
    /**
     * ��ȡroster
     * */
    public static Roster getRoster(XMPPConnection connection){
    	return connection.getRoster();
    }
    
    /** 
     * ������������Ϣ <RosterGroup> 
     *  
     * @return List(RosterGroup) 
     */  
    public static List<RosterGroup> getGroups(Roster roster) {  
        List<RosterGroup> groupsList = new ArrayList<RosterGroup>();  
        Collection<RosterGroup> rosterGroup = roster.getGroups();  
        Iterator<RosterGroup> i = rosterGroup.iterator();  
        while (i.hasNext())  
            groupsList.add(i.next());  
        return groupsList;  
    }  //getGroups
  
    /** 
     * ������Ӧ(groupName)����������û�<RosterEntry> 
     *  
     * @return List(RosterEntry) 
     */  
    public static List<RosterEntry> getEntriesByGroup(Roster roster,  String groupName) {  
        List<RosterEntry> EntriesList = new ArrayList<RosterEntry>();  
        RosterGroup rosterGroup = roster.getGroup(groupName);  
        Collection<RosterEntry> rosterEntry = rosterGroup.getEntries();  
        Iterator<RosterEntry> i = rosterEntry.iterator();  
        while (i.hasNext())  
            EntriesList.add(i.next());  
        return EntriesList;  
    }  //getEntriesByGroup
  
    /** 
     * ���������û���Ϣ <RosterEntry> 
     *  
     * @return List(RosterEntry) 
     */  
    public static List<RosterEntry> getAllEntries(Roster roster) {  
        List<RosterEntry> EntriesList = new ArrayList<RosterEntry>();  
        Collection<RosterEntry> rosterEntry = roster.getEntries();  
        Iterator<RosterEntry> i = rosterEntry.iterator();  
        while (i.hasNext())  
            EntriesList.add(i.next());  
        return EntriesList;  
    }  //getAllEntries
    
    /** 
     * ��ȡ�û���vcard��Ϣ 
     * @param connection 
     * @param user 
     * @return 
     * @throws XMPPException 
     */  
    public static VCard getUserVCard(XMPPConnection connection, String user) throws XMPPException  
    {  
        VCard vcard = new VCard();  
        vcard.load(connection, user);  
          
        return vcard;  
    }  //getUserVCard
  
    /** 
     * ��ȡ�û�ͷ����Ϣ 
     */  
    public static ImageIcon getUserImage(XMPPConnection connection, String user) {  
        ImageIcon ic = null;  
        try {  
            System.out.println("��ȡ�û�ͷ����Ϣ: "+user);  
            VCard vcard = new VCard();  
            vcard.load(connection, user);  
              
            if(vcard == null || vcard.getAvatar() == null)  
            {  
                return null;  
            }  
            ByteArrayInputStream bais = new ByteArrayInputStream(  
                    vcard.getAvatar());  
            Image image = ImageIO.read(bais);  
      
              
            ic = new ImageIcon(image);  
            System.out.println("ͼƬ��С:"+ic.getIconHeight()+" "+ic.getIconWidth());  
          
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return ic;  
    }  // getUserImage
    
    
    /** 
     * ����һ���� 
     */  
    public static boolean addGroup(Roster roster,String groupName)  
    {  
        try {  
            roster.createGroup(groupName);  
            return true;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;  
        }  
    }  //addGroup
      
    /** 
     * ɾ��һ���� 
     */  
    public static boolean removeGroup(Roster roster,String groupName)  
    {  
        return false;  
    }  //removeGroup
      
    /** 
     * ����һ������  �޷��� 
     */  
    public static boolean addUser(Roster roster,String userName,String name)  
    {  
        try {  
            roster.createEntry(userName, name, null);  
            return true;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;  
        }  
    }  //addUser
    /** 
     * ����һ�����ѵ����� 
     * @param roster 
     * @param userName 
     * @param name 
     * @return 
     */  
    public static boolean addUser(Roster roster,String userName,String name,String groupName)  
    {  
        try {  
            roster.createEntry(userName, name,new String[]{ groupName});  
            return true;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;  
        }  
    }  //addUser
      
    /** 
     * ɾ��һ������ 
     * @param roster 
     * @param userName 
     * @return 
     */  
    public static boolean removeUser(Roster roster,String userName)  
    {  
        try {  
              
            if(userName.contains("@"))  
            {  
                userName = userName.split("@")[0];  
            }  
            RosterEntry entry = roster.getEntry(userName);  
            System.out.println("ɾ������:"+userName);  
            System.out.println("User: "+(roster.getEntry(userName) == null));  
            roster.removeEntry(entry);  
              
            return true;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;  
        }  
          
    }  //removeUser
    
    /*
    public static List<UserBean> searchUsers(XMPPConnection connection,String serverDomain,String userName) throws XMPPException  
    {  
        List<UserBean> results = new ArrayList<UserBean>();  
        System.out.println("��ѯ��ʼ..............."+connection.getHost()+connection.getServiceName());  
          
        UserSearchManager usm = new UserSearchManager(connection);  
          
          
        Form searchForm = usm.getSearchForm(serverDomain);  
        Form answerForm = searchForm.createAnswerForm();  
        answerForm.setAnswer("Username", true);  
        answerForm.setAnswer("search", userName);  
        ReportedData data = usm.getSearchResults(answerForm, serverDomain);  
           
         Iterator<Row> it = data.getRows();  
         Row row = null;  
         UserBean user = null;  
         while(it.hasNext())  
         {  
             user = new UserBean();  
             row = it.next();  
             user.setUserName(row.getValues("Username").next().toString());  
             user.setName(row.getValues("Name").next().toString());  
             user.setEmail(row.getValues("Email").next().toString());  
             System.out.println(row.getValues("Username").next());  
             System.out.println(row.getValues("Name").next());  
             System.out.println(row.getValues("Email").next());  
             results.add(user);  
             //�����ڣ����з���,UserNameһ���ǿգ����������������裬һ���ǿ�  
         }  
           
         return results;  
    }  //searchUsers
    */
    
    
    
    /**
     * 1.       �޸�����״̬
     * �������ߣ���������ĳ����������ĳ������
     * **/
    public static void updateStateToAvailable(XMPPConnection connection)  
    {  
        Presence presence = new Presence(Presence.Type.available);  
        connection.sendPacket(presence);  
     }  
      
    public static void updateStateToUnAvailable(XMPPConnection connection)  
    {  
        Presence presence = new Presence(Presence.Type.unavailable);  
        connection.sendPacket(presence);  
        }  
      
    public static void updateStateToUnAvailableToSomeone(XMPPConnection connection,String userName)  
    {  
        Presence presence = new Presence(Presence.Type.unavailable);  
        presence.setTo(userName);  
        connection.sendPacket(presence);  
    }  
    public static void updateStateToAvailableToSomeone(XMPPConnection connection,String userName)  
    {  
        Presence presence = new Presence(Presence.Type.available);  
        presence.setTo(userName);  
        connection.sendPacket(presence);  
  
    }  
    
    /** 
     * �޸����� 
     * @param connection 
     * @param status 
     */  
    public static void changeStateMessage(XMPPConnection connection,String status)  
    {  
        Presence presence = new Presence(Presence.Type.available);  
        presence.setStatus(status);  
        connection.sendPacket(presence);  
      
    }  
    
    
    /**
     * ����ͷ��
     * */
    @SuppressWarnings("deprecation")
	public static void changeImage(XMPPConnection connection,File f) throws XMPPException, IOException  
    {  
      
        VCard vcard = new VCard();  
        vcard.load(connection);  
          
            byte[] bytes;  
            
                bytes = getFileBytes(f);  
                String encodedImage = StringUtils.encodeBase64(bytes);  
                vcard.setAvatar(bytes, encodedImage);  
                vcard.setEncodedImage(encodedImage);  
                vcard.setField("PHOTO", "<TYPE>image/jpg</TYPE><BINVAL>"  
                        + encodedImage + "</BINVAL>", true);  
                  
                  
                ByteArrayInputStream bais = new ByteArrayInputStream(  
                        vcard.getAvatar());  
                Image image = ImageIO.read(bais);  
                ImageIcon ic = new ImageIcon(image);  
                   
             
            
            vcard.save(connection);  
             
    }  
      
    private static byte[] getFileBytes(File file) throws IOException {  
        BufferedInputStream bis = null;  
        try {  
            bis = new BufferedInputStream(new FileInputStream(file));  
            int bytes = (int) file.length();  
            byte[] buffer = new byte[bytes];  
            int readBytes = bis.read(buffer);  
            if (readBytes != buffer.length) {  
                throw new IOException("Entire file not read");  
            }  
            return buffer;  
        } finally {  
            if (bis != null) {  
                bis.close();  
            }  
        }  
    }  
 
  
  
 
 
	

}//XMPPClient