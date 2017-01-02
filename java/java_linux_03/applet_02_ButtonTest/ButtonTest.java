import java.applet.*;
import java.awt.*;
import java.awt.event.*;

public class ButtonTest extends Applet implements ActionListener
{
	// 单一一个按钮
	private Button button;
	// applet 所使用的背景色
	private final Color bgColors[] = new Color[]{
			Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW
	};
	
	// 当前背景色的索引
	private int currentColor;
	
	// 覆盖applet类的init()方法
	public void init()
	{
		// 创建一个新的Button对象，注册，然后添加
		// it to the applet
		button = new Button("Press me");
		button.addActionListener(this);;
		add(button);
		
		// 初始化背景色的索引
		currentColor = -1;
		changeWindowColor();
	}	// init
	// 覆盖applet类的paint方法
	public void paint(Graphics g)
	{
		// 根据当前的索引设置窗体的背景色
		setBackground(bgColors[currentColor]);
		
		// 设置按钮的前景色为窗体背景色
		button.setForeground(bgColors[currentColor]);
	}	// paint
	// 当前背景色索引递增
	private void changeWindowColor()
	{
		currentColor++;
		if(currentColor == bgColors.length)
		{
			currentColor = 0;
			
		}
	}// changeWindowColor
	
	// 实现ActionListener接口的actionperformed方法
	public void actionPerformed(ActionEvent e)
	{
		// 如果按钮产生事件，改变窗口的背景色
		if(button == e.getSource())
		{
			changeWindowColor();
			repaint();
		}
	}
	
	
}	// ButtonTest