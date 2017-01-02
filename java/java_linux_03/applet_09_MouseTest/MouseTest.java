import java.applet.*;
import java.awt.*;
import java.awt.event.*;

// 把获得的鼠标事件输出到TextArea中
public class MouseTest extends Applet implements MouseListener
{
	// 接受mouseevent的textarea
	private TextArea textArea;
	
	public void init()
	{
		setLayout(new GridLayout(2, 1));
		
		// 创建一个新的Panel对象来产生鼠标事件
		Panel p = new Panel();
		p.setBackground(new Color(0, 127, 255));
		p.add(new Label("I Love Mouse Events"));
		p.addMouseListener(this);
		add(p);
		
		textArea = new TextArea();
		add(textArea);
	}// init
	
	// 把发送的字符串，鼠标事件产生的组建，事件产生点的位置追加到textarea中
	private void reportMouseEvent(String s, MouseEvent e)
	{
		String point = "(" + e.getX() + ", " + e.getY() + ")";
		textArea.append(s + e.getSource().getClass() + "at" + point + "\n");
	}
	// 实现MouseListener接口的方法，其用途应该是自明的
	public void mouseClicked(MouseEvent e)
	{
		// 对于这个方法，鼠标左键单击和右键单击是不同的
		if(e.getModifiers() == MouseEvent.BUTTON1_MASK)
		{
			reportMouseEvent("MOuse left-clicked on ", e);
		}
		if(e.getModifiers() == MouseEvent.BUTTON3_MASK)
		{
			reportMouseEvent("Mouse right-clicked on ", e);
		}
	}// mouseClicked
	
	public void mouseEntered(MouseEvent e)
	{
		reportMouseEvent("Mouse entered ", e);
	}
	public void mouseExited(MouseEvent e)
	{
		reportMouseEvent("Mouse exited ", e);
	}
	public void mousePressed(MouseEvent e)
	{
		reportMouseEvent("Mouse Pressed over ", e);
	}
	public void mouseReleased(MouseEvent e)
	{
		reportMouseEvent("Mouse Released over ", e);
	}
}// MouseTest