package FontTest;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JComponent;
import javax.swing.JFrame;


public class FontTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EventQueue.invokeLater(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				FontFrame frame = new FontFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
			}
		});

	}
}

class FontFrame extends JFrame{
	public FontFrame(){
		setTitle("DrawFrame");
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);	// 设置尺寸
		
		FontComponent component = new FontComponent();
		add(component);
		
	}
	public static final int DEFAULT_WIDTH = 300;
	public static final int DEFAULT_HEIGHT = 200;
}

class FontComponent extends JComponent{

	@Override
	protected void paintComponent(Graphics g) {
		// TODO Auto-generated method stub
		Graphics2D g2 = (Graphics2D) g;
		
		String message = "Hello,World!";
		
		Font f = new Font("Serif", Font.BOLD, 36);
		g2.setFont(f);
		
		FontRenderContext context = g2.getFontRenderContext();
		Rectangle2D bounds = f.getStringBounds(message, context);
		
		double x = (getWidth() - bounds.getWidth()) / 2;
		double y = (getHeight() - bounds.getHeight()) / 2;
		
		double ascent = -bounds.getY();
		double baseY = y + ascent;
		
		g2.drawString(message, (int)x,(int) baseY);
		g2.setPaint(Color.LIGHT_GRAY);
		
		g2.draw(new Line2D.Double(x	, baseY, x + bounds.getWidth(), baseY));
		
		Rectangle2D rect = new Rectangle2D.Double(x, y, bounds.getWidth(), bounds.getHeight());
		
		g2.draw(rect);
		
		
		
		super.paintComponent(g);
	}
	
}
