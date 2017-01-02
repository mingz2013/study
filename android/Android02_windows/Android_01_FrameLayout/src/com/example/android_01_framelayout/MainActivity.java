package com.example.android_01_framelayout;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.FrameLayout;

public class MainActivity extends Activity {
	FrameLayout frameLayout = null;
	private boolean flag = true;
	
	public static final int SLEEP_TIME = 200;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		frameLayout = (FrameLayout)findViewById(R.id.frame);
		
		// ����һ��Handler�������Ҫ�����䷽��
		final MyHandler myHandler = new MyHandler();// ��ϢͨѶ��
		myHandler.sleep(SLEEP_TIME);
		//Ϊframe���õ���¼������䱻����£���ֹͣ������֮��任
		frameLayout.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				flag = !flag;
				myHandler.sleep(SLEEP_TIME);
			}
		});
	}
	
	// �ɸ��������������ѭ�����ã�ʵ�ֽ��治�ϸ���
	class MyHandler extends Handler{
		int i = 0;

		@Override
		public void handleMessage(Message msg) {
			// TODO Auto-generated method stub
			super.handleMessage(msg);
			i++;
			// �ܹ�����ͼ��������ʾ
			show(i % 6);
			// �ٴε���sleep����
			sleep(SLEEP_TIME);
		}
		public void sleep(long delayMillis){
			// �ж��Ƿ��������
			if(flag){
				// ʵ�����ǵ�����һ��handleMessage
				sendMessageDelayed(obtainMessage(0), delayMillis);// �����ӳٷ���һ����Ϣ���ͻ����heandlemessage
			}
		}
		// �÷����Ǳ������Ը���֡���ֵ�ǰ��ͼƬ
		void show(int j){
			// ��ȡ����ͼƬ
			Drawable a = getResources().getDrawable(R.drawable.p1);
			Drawable b = getResources().getDrawable(R.drawable.p2);
			Drawable c = getResources().getDrawable(R.drawable.p3);
			Drawable d = getResources().getDrawable(R.drawable.p4);
			Drawable e = getResources().getDrawable(R.drawable.p5);
			Drawable f = getResources().getDrawable(R.drawable.p6);
			// ��ͬ��������ò�ͬ�ı���
			switch (j) {
			case 0:
				frameLayout.setForeground(a);
				break;
			case 1:
				frameLayout.setForeground(b);
				break;
			case 2:
				frameLayout.setForeground(c);
				break;
			case 3:
				frameLayout.setForeground(d);
				break;
			case 4:
				frameLayout.setForeground(e);
				break;
			case 5:
				frameLayout.setForeground(f);
				break;

			default:
				break;
			}
		}
	}

	

}