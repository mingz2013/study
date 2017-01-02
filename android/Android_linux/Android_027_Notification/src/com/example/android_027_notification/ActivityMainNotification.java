package com.example.android_027_notification;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ActivityMainNotification extends Activity{
	private static int NOTIFICATIONS_ID = R.layout.activity_notification;
	private NotificationManager mNotificationManager;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_notification);
		Button button;
		// 获得实例
		mNotificationManager = (NotificationManager)getSystemService(NOTIFICATION_SERVICE);
		button = (Button)findViewById(R.id.sun_1);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setWeather("好", "天气", "好", R.drawable.ic_launcher);
			}
		});
		button = (Button)findViewById(R.id.cloudy_1);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setWeather("还行", "天气", "还行", R.drawable.ic_launcher);
			}
		});
		button = (Button)findViewById(R.id.rain_1);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setWeather("不好", "天气", "不好", R.drawable.ic_launcher);
			}
		});
		button = (Button)findViewById(R.id.defaultSound);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setDefault(Notification.DEFAULT_SOUND);//伴随音乐
			}
		});
		button = (Button)findViewById(R.id.defaultVibrate);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setDefault(Notification.DEFAULT_VIBRATE);// 伴随震动
			}
		});
		button = (Button)findViewById(R.id.defaultAll);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setDefault(Notification.DEFAULT_ALL);// 伴随音乐和栈动
			}
		});
		button = (Button)findViewById(R.id.clear);
		button.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				mNotificationManager.cancel(NOTIFICATIONS_ID);
			}
		});
	}
	private void setWeather(String tickerText, String title, String content, int drawable){
		// 实例化Notifition，并显示
		Notification notification = new Notification(
				drawable,	// 显示的图片ID 
				tickerText, // 显示的文字
				System.currentTimeMillis()	// 显示的时间  立即显示
				);
		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(ActivityMainNotification.this, MainActivity.class), 0);
		notification.setLatestEventInfo(this, title, content, contentIntent);
		mNotificationManager.notify(NOTIFICATIONS_ID, notification);
	}
	private void setDefault(int defaults){
		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(ActivityMainNotification.this, MainActivity.class), 0);
		String title = "天气预报";
		String content = "晴";
		final Notification notification = new Notification(R.drawable.ic_launcher, content, System.currentTimeMillis());
		notification.setLatestEventInfo(this, title, content, contentIntent);
		notification.defaults = defaults;
		mNotificationManager.notify(NOTIFICATIONS_ID, notification);
		
	}
	
}
