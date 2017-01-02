package com.example.android09_;

import android.os.Bundle;
import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.view.Menu;

@SuppressLint("NewApi")
public class MainActivity extends Activity implements ActionBar.TabListener{

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		// ���ò������ĵ���ģʽ
		final  ActionBar bar = getActionBar();
		bar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
		
		// Ȼ��ֻ��Ҫ�������������ӱ�ǩ�����ǵ�listener�Ϳ�����
		Tab t = bar.newTab();
		t.setText("Tab1");
		t.setTabListener(this);
		bar.addTab(t);
		
		Tab t2 = bar.newTab();
		t2.setText("Tab2");
		t2.setTabListener(this);
		bar.addTab(t2);
		
		Tab t3 = bar.newTab();
		t3.setText("Tab3");
		t3.setTabListener(this);
		bar.addTab(t3);
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onTabSelected(Tab tab, FragmentTransaction ft) {
		// TODO Auto-generated method stub
		//ft.replace(R.id.content, fragment, null);
	}

	@Override
	public void onTabUnselected(Tab tab, FragmentTransaction ft) {
		// TODO Auto-generated method stub
		//ft.remove(fragment);
		
	}

}