package com.example.testbroadcastreceiver;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity {
	private Button sendButton = null;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		sendButton = (Button)findViewById(R.id.send);
		sendButton.setOnClickListener(new sendButtonListener());
	}
	class sendButtonListener implements OnClickListener{

		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			System.out.println("---------------");
			TestReceiver tr = new TestReceiver();
			Intent intent = new Intent();
			intent.setAction(Intent.ACTION_EDIT);
			MainActivity.this.sendBroadcast(intent);
			
		}
		
	}


}
