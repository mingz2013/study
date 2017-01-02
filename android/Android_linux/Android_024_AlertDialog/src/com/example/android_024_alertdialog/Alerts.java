package com.example.android_024_alertdialog;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;

public class Alerts {
	public static void showAlert(String message, Context ctx)
	{
		// Create a builder
		AlertDialog.Builder builder = new AlertDialog.Builder(ctx);
		builder.setTitle("Alert Window");
		
		// add button and listener
		EmptyListener pl = new EmptyListener();
		builder.setPositiveButton("OK", pl);
		
		// create the dialog
		AlertDialog ad = builder.create();
		
		// show
		ad.show();
	}
	
}
class EmptyListener implements android.content.DialogInterface.OnClickListener{

	@Override
	public void onClick(DialogInterface arg0, int arg1) {
		// TODO Auto-generated method stub
		
	}
	
}
