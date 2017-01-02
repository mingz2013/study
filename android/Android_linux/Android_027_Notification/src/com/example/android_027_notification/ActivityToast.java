package com.example.android_027_notification;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class ActivityToast extends Activity{
	private static int TOAST_ID = R.layout.activity_toast;
	private Button button1;
	private Button button2;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_toast);
		button1 = (Button)findViewById(R.id.button1);
		button2 = (Button)findViewById(R.id.button2);
		button1.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setTitle("短时提醒");
				showToast(Toast.LENGTH_SHORT);
				
			}
		});
		button2.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				setTitle("长时提醒");
				showToast(Toast.LENGTH_LONG);
				showNotification();
				
			}
		});
		
		
	}
	protected void showToast(int type){
		View view = inflateView(R.layout.toast);
		TextView tv = (TextView)view.findViewById(R.id.content);
		tv.setText("欢迎来到济南。");
		
		Toast toast = new Toast(this);
		toast.setView(view);
		toast.setDuration(type);
		toast.show();
	}
	private View inflateView(int resource){
		LayoutInflater  vi = (LayoutInflater)getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		return vi.inflate(resource, null);
	}
	
	@SuppressWarnings("deprecation")
	protected void showNotification(){
		NotificationManager notificationManager = (NotificationManager)getSystemService(NOTIFICATION_SERVICE);
		String title = "省会";
		String contents = "齐鲁大地";
		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(ActivityToast.this, MainActivity.class), 0);
		Notification notification = new Notification(R.drawable.ic_launcher, title, System.currentTimeMillis());
		notification.setLatestEventInfo(this, title, contents, contentIntent);
		// 100ms延迟后震动250ms,停止100ms后震动500ms
		notification.vibrate = new long[]{100, 250, 100, 500};
		notificationManager.notify(TOAST_ID, notification);
		
	}
	

}
