package com.example.sensor01;

import java.util.List;

import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {
	private Button button = null;
	// ���ȶ���һ��SensorManager�������ڹ����ֻ��е����д�����
	private SensorManager sensorManager = null;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		button = (Button)findViewById(R.id.sensorButtonId);
		button.setOnClickListener(new ButtonListener());
		// �õ�sensorManager����ͨ����������ֵõ���Ӧ�ķ������
		sensorManager = (SensorManager)getSystemService(Context.SENSOR_SERVICE);
	}
	private class ButtonListener implements OnClickListener{

		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			// ��ȡlist������������Ӧ���͵Ĵ����������������еĴ�����
			List<Sensor> sensors = sensorManager.getSensorList(Sensor.TYPE_ALL);
			for(Sensor sensor:sensors){
				// ��������ȡ����
				System.out.println(sensor.getName());
				Toast.makeText(MainActivity.this, sensor.getName(), Toast.LENGTH_LONG).show();
			}
			// �õ�ĳһ��������  ,�õ�Ĭ�ϵĹ��ߴ�����
			Sensor sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT);
			System.out.println(sensor.getName());
		}
		
	}
}