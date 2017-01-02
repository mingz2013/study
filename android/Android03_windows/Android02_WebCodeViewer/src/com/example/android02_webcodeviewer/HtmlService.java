package com.example.android02_webcodeviewer;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HtmlService {
	
	public static String getHtml(String path) throws Exception{
		HttpURLConnection connection = (HttpURLConnection)new URL(path).openConnection();
		connection.setConnectTimeout(5000);
		connection.setRequestMethod("GET");
		if(connection.getResponseCode() == 200){
			InputStream inputStream = connection.getInputStream();
			byte[] data = StreamTool.read(inputStream);
			return new String(data);
		}
		return null;
	}

}
