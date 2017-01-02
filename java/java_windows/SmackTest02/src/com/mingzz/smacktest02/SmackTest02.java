package com.mingzz.smacktest02;

import org.jivesoftware.smack.*;

public class SmackTest02 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Create a connection to the jabber.org server on a specific port.
		// Create the configuration for this new connection
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
		
		
		// Disconnect from the server
		connection.disconnect();
		
		
		

	}

}
