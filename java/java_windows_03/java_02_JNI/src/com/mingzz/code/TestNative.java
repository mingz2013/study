package com.mingzz.code;

public class TestNative {
	// ������java��������һ��native����
	public native void sayHello();
	// Ȼ��ʹ��javah��������һ������native���������c/c++ͷ�ļ� javah com.mingzz.code.TestNative
	// �������ɵ�c/c++ͷ�ļ�����дc/c+=����
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.loadLibrary("JNI_SayHello");
		TestNative tn = new TestNative();
		tn.sayHello();
	}

}