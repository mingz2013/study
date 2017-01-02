package com.example.android02_webcodeviewer;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	private EditText editText;
	private TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        editText = (EditText)findViewById(R.id.path);
        textView = (TextView)findViewById(R.id.textView);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    
    public void showhtml(View v){
    	String path = editText.getText().toString();
    	try{
    		String html = HtmlService.getHtml(path);
    		textView.setText(html);
    	}catch(Exception e){
    		e.printStackTrace();
    		Toast.makeText(MainActivity.this, R.string.error, Toast.LENGTH_LONG).show();
    		
    	}
    }
    
}
