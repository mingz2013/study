package NotHelloWorld;

import java.awt.EventQueue;
import java.awt.Graphics;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class NotHelloWorld {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EventQueue.invokeLater(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				NotHelloWorldFrame frame = new NotHelloWorldFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	// 设置关闭事件 退出程序，关闭窗口程序并不一定是退出的，所以要这一句
				frame.setVisible(true);	// 设置显示
				
			}
		});

	}

}

class NotHelloWorldFrame extends JFrame{
	public NotHelloWorldFrame() {
		setTitle("NotHelloWorld");
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);	// 设置尺寸
		
		NotHelloWorldPanel panel = new NotHelloWorldPanel();
		add(panel);// 将一个组件添加到这个框架中
		
	}
	public static final int DEFAULT_WIDTH = 300;
	public static final int DEFAULT_HEIGHT = 200;
}

class NotHelloWorldPanel extends JPanel{// 创建一个能够进行绘制的组建

	public void paintComponent(Graphics g) {// 覆盖这个方法来描述如何绘制自己的组建
		g.drawString("Not a Hello World Program", MESSAGE_X	, MESSAGE_Y);
	}
	public static final int MESSAGE_X = 75;
	public static final int MESSAGE_Y = 100;
	
}
