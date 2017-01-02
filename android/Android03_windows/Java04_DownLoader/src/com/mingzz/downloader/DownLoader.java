package com.mingzz.downloader;

import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;

public class DownLoader {
	String filename ;
	String path ;
	int threadsize ;		// �߳���
	
	public DownLoader(String filename, String urlpath, int threadsize){
		this.filename = filename;
		this.path = urlpath;
		this.threadsize = threadsize;
	}
	
	public void download() throws Exception{
		URL url = new URL(path);
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		connection.setConnectTimeout(5 * 1000);
		connection.setRequestMethod("GET");
		
		int filelength = connection.getContentLength();	// ��ȡ�����ļ�����
		System.out.println("file length : " + filelength);
		
		RandomAccessFile file = new RandomAccessFile(filename, "rw");
		file.setLength(filelength);		// ���ñ����ļ�����
		file.close();
		connection.disconnect();
		
		
		int threadlength = filelength % threadsize == 0 ? filelength / threadsize : filelength / threadsize + 1;// ÿ���߳����صĳ���
		
		for(int i = 0; i < threadsize; i++ ){
			int startposition = i * threadlength; // ����ÿ���߳�Ӧ�ô�ʲôλ�ÿ�ʼ����
			RandomAccessFile threadfile = new RandomAccessFile(filename, "rw");
			threadfile.seek(startposition);		// ���ļ���ʲôλ�ÿ�ʼд������
			// ���������߳� �ֱ�� ��ͬλ�� �����ļ�
			new DownLoadThread(i, path, startposition, threadfile, threadlength).start();
		}
		
		int quit = System.in.read();
		while('q' != quit){
			Thread.sleep(2 * 1000);
		}
		
		
	}
	
	private class DownLoadThread extends Thread{
		private int threadId;
		private int startposition;
		private RandomAccessFile threadfile;
		private int threadlength;
		private String path;
		
		public DownLoadThread(int threadId, String path, int startposition, RandomAccessFile threadfile, int threadlength){
			this.threadId = threadId;
			this.startposition = startposition;
			this.threadfile = threadfile;
			this.threadlength = threadlength;
			this.path = path;
		}

		@Override
		public void run() {
			// TODO Auto-generated method stub
			try {
				URL url = new URL(path);
				HttpURLConnection connection = (HttpURLConnection)url.openConnection();
				connection.setConnectTimeout(5 * 1000);
				connection.setRequestMethod("GET");
				connection.setRequestProperty("Range", "bytes=" + startposition + "-"); // ָ�����ļ�ʲôλ�ÿ�ʼ����
				InputStream inputStream = connection.getInputStream();
				byte[] buffer = new byte[1024];
				int len = -1;
				int length = 0;
				while(length < threadlength && (len = inputStream.read(buffer)) != -1){
					threadfile.write(buffer, 0, len);
					length += len;	// �ۼ����س���
				}
				
				threadfile.close();
				inputStream.close();
				System.out.println("�߳�" + (threadId + 1) + "�Ѿ��������");
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("�߳�" + (threadId + 1) + "���س���" + e);
			}
		}
		
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			new DownLoader("000.zip", "http://localhost/phptest/000.zip", 5).download();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����������������������");
		}
	}

}