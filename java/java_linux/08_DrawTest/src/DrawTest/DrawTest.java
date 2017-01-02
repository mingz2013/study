package DrawTest;

import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JComponent;
import javax.swing.JFrame;

public class DrawTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EventQueue.invokeLater(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				DrawFrame frame = new DrawFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
			}
		});

	}

}

@SuppressWarnings("serial")
class DrawFrame extends JFrame{
	public DrawFrame() {
		// TODO Auto-generated constructor stub
		setTitle("DrawFrame");
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);	// 设置尺寸
		
		DrawComponent component = new DrawComponent();
		add(component);// 将一个组件添加到这个框架中
		
	}
	public static final int DEFAULT_WIDTH = 400;
	public static final int DEFAULT_HEIGHT = 400;
}

@SuppressWarnings("serial")
class DrawComponent extends JComponent{

	@Override
	protected void paintComponent(Graphics g) {
		// TODO Auto-generated method stub
		
		Graphics2D g2 = (Graphics2D)g;
		
		double leftX = 100;
		double topY = 100;
		double width = 200;
		double height = 150;
		
		Rectangle2D rect = new Rectangle2D.Double(leftX, topY, width, height);
		g2.draw(rect);// 正方形
		
		Ellipse2D ellipse = new Ellipse2D.Double();
		ellipse.setFrame(rect);
		g2.draw(ellipse);// 小圆
		// 线
		g2.draw(new Line2D.Double(leftX, topY, leftX + width, topY + height));
		
		double centerX = rect.getCenterX();
		double centerY = rect.getCenterY();
		double radius = 150;
		
		Ellipse2D circle = new Ellipse2D.Double();
		circle.setFrameFromCenter(centerX, centerY, centerX + radius, centerY + radius);
		g2.draw(circle);// 大圆
		
		
		
		
		super.paintComponent(g);
	}
	
}
