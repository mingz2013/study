package SizedFrameTest;

import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Image;
import java.awt.Toolkit;

import javax.swing.JFrame;

public class SizedFrameTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EventQueue.invokeLater(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				SizedFrame frame = new SizedFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
				
			}
		});

	}
	
	@SuppressWarnings("serial")
	static class SizedFrame extends JFrame{
		
		public SizedFrame() {
			// TODO Auto-generated constructor stub
			Toolkit kit = Toolkit.getDefaultToolkit();// 返回默认的工具箱
			Dimension screenSize = kit.getScreenSize();
			int screenHeight = screenSize.height;
			int screenWidth = screenSize.width;
			
			setSize(screenWidth/2, screenHeight/2);
			setLocationByPlatform(true);// 定位框架
			
			Image img = kit.getImage("01.png");
			setIconImage(img);
			
			setTitle("SizedFrame");
		}
		
	}

}
