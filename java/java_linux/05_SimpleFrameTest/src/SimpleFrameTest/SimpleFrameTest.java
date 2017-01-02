package SimpleFrameTest;

import javax.swing.JFrame;

public class SimpleFrameTest {
	
	static class SimpleFrame extends JFrame{
		
		public SimpleFrame(){
			setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);	// 设置尺寸
		}
		public static final int DEFAULT_WIDTH = 300;
		public static final int DEFAULT_HEIGHT = 200;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleFrame frame = new SimpleFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	// 设置关闭事件 退出程序，关闭窗口程序并不一定是退出的，所以要这一句
		frame.setVisible(true);	// 设置显示
		
		//frame.setLocation(200, 200);// 重定位组建
		frame.setBounds(200, 200, 700, 700);// 重定位组建位置和大小
		frame.setTitle("example frame");
		//frame.getTitle();
	}
	
	

}
