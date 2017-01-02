package WebServer;
/**
 * webServer
 * **/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class WebServer {
	protected void start(){
		ServerSocket socket;
		System.out.println("WebServer start on port 80");
		System.out.println("press ctrl+c to exit");
		try {
			socket = new ServerSocket(80);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error:" + e);
			return;
		}
		System.out.println("waiting for connect");
		for(;;){
			try {
				Socket remote = socket.accept();
				System.out.println("Connection sending data");
				
				BufferedReader in = new BufferedReader(new InputStreamReader(remote.getInputStream()));
				PrintWriter out = new PrintWriter(remote.getOutputStream());
				
				String str = ".";
				while(!str.equals("")){
					str = in.readLine();
					out.println("HTTP/1.0 200 ok");
					out.println("Content-Type: text/html");
					out.println("Server: Bot");
					out.println("");
					out.println("<h2>welcome to the miniWebServer</h2>");
					out.flush();
					remote.close();
					
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		WebServer ws = new WebServer();
		ws.start();
	}

}