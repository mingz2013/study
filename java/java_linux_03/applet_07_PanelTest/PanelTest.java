import java.applet.*;
import java.awt.*;

public class PanelTest extends Applet
{
	public void init()
	{
		// 设置applet的布局为默认的flowlayout
		setLayout(new FlowLayout());
		
		// 创建一个2*2 GridLayout 的Panel。并添加4个按钮
		// 然后把这个pannel放到applet上
		Panel p1 = new Panel();
		p1.setLayout(new GridLayout(2, 2));
		p1.add(new Button("B1"));
		p1.add(new Button("B2"));
		p1.add(new Button("B3"));
		p1.add(new Button("B4"));
		add(p1);
		
		// 创建第2个panel，布局为borderlayout，并添加5个按钮
		// 然后把这个panel放到applet上
		Panel p2 = new Panel();
		p2.setLayout(new BorderLayout());
		p2.add(new Button("North"), BorderLayout.NORTH);
		p2.add(new Button("South"), BorderLayout.SOUTH);
		p2.add(new Button("East"), BorderLayout.EAST);
		p2.add(new Button("West"), BorderLayout.WEST);
		p2.add(new Button("Center"), BorderLayout.CENTER);
		add(p2);
		
	}
}