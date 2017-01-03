package com.example.crackme0201;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


public class MainActivity extends ActionBarActivity {
	private EditText edit_username = null;
	private EditText edit_sn = null;
	private Button btn_register = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle(R.string.unregister);	// 模拟程序未注册
        edit_username = (EditText)findViewById(R.id.edit_username);
        edit_sn = (EditText) findViewById(R.id.edit_sn);
        btn_register = (Button) findViewById(R.id.button_register);
        btn_register.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				if(!checkSN(edit_username.getText().toString().trim(), edit_sn.getText().toString().trim())){
					Toast.makeText(MainActivity.this, R.string.unsuccessed, Toast.LENGTH_SHORT).show();
				}else{
					Toast.makeText(MainActivity.this, R.string.successed, Toast.LENGTH_SHORT).show();
					btn_register.setEnabled(false);
					setTitle(R.string.registered);	// 模拟注册
				}
			}
		});
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
    
    
    private boolean checkSN(String userName, String sn) {
		try{
			if((userName == null) || userName.length() == 0)
				return false;
			if(sn == null || sn.length() != 16)
				return false;
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.reset();
			digest.update(userName.getBytes());
			byte[] bytes = digest.digest();	// 采用MD5对用户名进行hash
			String hexstr = bytes.toString();// 将计算结果转化为字符串
			StringBuilder sb = new StringBuilder();
			for(int i = 0; i < hexstr.length(); i+= 2){
				sb.append(hexstr.charAt(i));
			}
			
			String userSN = sb.toString();	// 计算出的SN
			if(!userSN.equalsIgnoreCase(sn))	// 比较注册码是否正确
				return false;
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
			return false;
		}
    	return true;
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
