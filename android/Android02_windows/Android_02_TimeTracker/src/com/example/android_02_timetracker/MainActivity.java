package com.example.android_02_timetracker;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.text.format.DateUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends FragmentActivity implements OnClickListener{

	TextView counter;
	ListView list;
	TimeListAdapter mTimeListAdapter;
	long mTime, mStart;
	Button startButton , resetButton;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		counter = (TextView)findViewById(R.id.counter);
		list = (ListView)findViewById(R.id.time_list);
		startButton = (Button)findViewById(R.id.start_stop);
		resetButton = (Button)findViewById(R.id.reset);
		startButton.setOnClickListener(this);
		resetButton.setOnClickListener(this);
		
		counter.setText(DateUtils.formatElapsedTime(0));
		if(mTimeListAdapter == null){
			mTimeListAdapter = new TimeListAdapter(this, 0);
		}
		list.setAdapter(mTimeListAdapter);
		
		IntentFilter filter = new IntentFilter();
		filter.addAction(ACTION_TIME_UPDATE);
		filter.addAction(ACTION_TIMER_FINISHED);
		registerReceiver(mTimeReceiver, filter);
		
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// TODO Auto-generated method stub
		switch (item.getItemId()) {
		case R.id.clear_all:
			FragmentManager fm = getSupportFragmentManager();
			if(fm.findFragmentByTag("dialog") == null){
				ConfirmClearDialogFragment frag = ConfirmClearDialogFragment.newInstance(mTimeListAdapter);
				frag.show(fm, "dialog");
			}
			return true;
		default:
			return super.onOptionsItemSelected(item);
		}

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override//�������� ������ٲ����ܻᱻ���½����Ǳ�����
	protected void onSaveInstanceState(Bundle outState) {
		// TODO Auto-generated method stub
		// ���浱ǰ�б��Ĺ���λ��
		int pos = list.getFirstVisiblePosition();
		outState.putInt("first_position", pos);
		super.onSaveInstanceState(outState);
	}
	
	private Handler mHandler = new Handler(){

		@SuppressLint("HandlerLeak")
		@Override
		public void handleMessage(Message msg) {
			// TODO Auto-generated method stub
			long current = System.currentTimeMillis();
			mTime += current - mStart;
			mStart = current;
			counter.setText(DateUtils.formatElapsedTime(mTime/1000));
			mHandler.sendEmptyMessageDelayed(0, 250);
		}
		
	};
	
	private void startTimer(){
		// ��¼��ǰ��ϵͳʱ�䲢����һ����Ϣ��Handler������һ����ʱ����
		// Ϊ�˱��⿪����ʱ�����Σ��ڷ�����һ����Ϣʱ�Ƴ��κδ��ڵ���Ϣ
		mStart = System.currentTimeMillis();
		mHandler.removeMessages(0);
		mHandler.sendEmptyMessage(0);
	}
	
	private void stopTimer(){
		// ��Handler��Ϣ�������Ƴ�������Ϣ
		mHandler.removeMessages(0);
	}
	
	private void resetTimer(){
		// �ȵ���stopTimer��Ȼ���������������ӵ�ǰʱ��
		stopTimer();
		if(mTimeListAdapter != null){
			mTimeListAdapter.add(mTime/1000);
		}
		mTime = 0;
		
	}
	
	private boolean isTimerRunning(){
		// ����һ�������Ϣ��������Ϣ�ķ���
		return mHandler.hasMessages(0);
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub

		if(v.getId() == R.id.start_stop){
			if(isTimerRunning()){
				stopTimer();
				startButton.setText(R.string.start);
			}else{
				startTimer();
				startButton.setText(R.string.stop);
			}
		}else if(v.getId() == R.id.reset){
			resetTimer();
			counter.setText(DateUtils.formatElapsedTime(0));
			startButton.setText(R.string.start);
		}
		
	}
	

}