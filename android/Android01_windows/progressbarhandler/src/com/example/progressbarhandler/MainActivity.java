package com.example.progressbarhandler;


import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ProgressBar;
import android.app.Activity;


public class MainActivity extends Activity {

	private ProgressBar bar = null;
	private Button startButton = null;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		bar = (ProgressBar)findViewById(R.id.bar);
		startButton = (Button)findViewById(R.id.startButton);
		startButton.setOnClickListener(new StartButtonListener());
		
	}

	class StartButtonListener implements OnClickListener{

		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			bar.setVisibility(View.VISIBLE);// 设置为可见
			updateBarHandler.post(updateThread);// 启动线程
		}
		
	}
	// 使用匿名内部类来复写handler当中的   handleMessage   方法
	Handler updateBarHandler = new Handler(){

		@Override
		public void handleMessage(Message msg) {
			// TODO Auto-generated method stub
			//super.handleMessage(msg);
			bar.setProgress(msg.arg1);
			// 把线程压入到线程队列中去
			updateBarHandler.post(updateThread);
		}
		
	};
	//　线程类，该类使用匿名内部类的方式进行声明
	Runnable updateThread = new Runnable() {
		int i = 0;
		@Override
		public void run() {
			// TODO Auto-generated method stub
			System.out.println("Begin THread");
			i = i + 10;
			// 得到一个消息对象　Message类是由android操作系统提供的
			Message msg = updateBarHandler.obtainMessage();
			// 将msg对象的arg1参数的值设置为i，
			// 用arg1和arg2这两个变量传递消息，
			// 优点是系统性能消耗较少
			msg.arg1 = i;
			try{
				// 设置当前线程睡眠1秒
				Thread.sleep(1000);
			}catch (InterruptedException e){
				e.printStackTrace();
			}
			// 发送一个消息，消息对象msg加入到消息队列中，
			updateBarHandler.sendMessage(msg);
			if(i == 100)
			{
				// 如果当i的值为100时，就将线程对象从handler当中移除
				updateBarHandler.removeCallbacks(updateThread);
			}
		}
	};

}
