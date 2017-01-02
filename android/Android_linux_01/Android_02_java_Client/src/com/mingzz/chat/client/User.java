package com.mingzz.chat.client;

import com.mingzz.chat.MessageFactory;
import com.mingzz.chat.message.ChatMessage;
import com.mingzz.chat.message.LoginMessage;
import com.mingzz.chat.message.RegisterMessage;
import com.mingzz.chat.message.UserMessage;



public class User{
	private ChatClient chatClient;
	private String username;
	private String password;
	private long userID;
	public User(){
		this.chatClient = null;
	}
	
	public User(ChatClient chatClient) {
		this.chatClient = chatClient;
		this.chatClient.start();
	}
	public User(ChatClient chatClient, String username, String password){
		this.chatClient = chatClient;
		this.username = username;
		this.password = password;
		chatClient.start();
	}
	public void setUserName(String username){
		this.username = username;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public void setChatClient(ChatClient chatClient){
		this.chatClient = chatClient;
	}
	public String getUserName(){
		return this.username;
	}
	public String getPassword(){
		return this.password;
	}
	public ChatClient getChatClient(){
		return this.chatClient;
	}
	
	public boolean Register(String registerName, String registerPassword){
		RegisterMessage registerMessage = MessageFactory.createRegisterMessage(registerName, registerPassword);
		UserMessage userMessage = MessageFactory.createUserMessage(MessageFactory.USERMSGTYPE_OF_REGISTER, registerMessage);
		chatClient.sendMessage(userMessage);
		return true;
	}
	
	public boolean Login(){
		LoginMessage loginMessage = MessageFactory.createLoginMessage(username, password);
		UserMessage userMessage = MessageFactory.createUserMessage(MessageFactory.USERMSGTYPE_OF_LOGIN, loginMessage);
		chatClient.sendMessage(userMessage);
		return true;
	}
	
	public boolean Logout(){
		chatClient.stop();
		return true;
	}
	
	public boolean sendMessage(long fromID, long toID, String message){
		ChatMessage chatMessage = MessageFactory.createChatMessage(fromID, toID, message);
		UserMessage userMessage = MessageFactory.createUserMessage(MessageFactory.USERMSGTYPE_OF_CHAT, chatMessage);
		chatClient.sendMessage(userMessage);
		
		return true;
	}
	
	
	
	
	

}
