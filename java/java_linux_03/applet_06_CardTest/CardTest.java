import java.applet.*;
import java.awt.*;

public class CardTest extends Applet implements Runnable
{
	// 一个充当定时器的线程
	private Thread timer;
	
	public void init()
	{
		// 创建一个新的CardLayout
		setLayout(new CardLayout());
		
		// 在cardlayout中创建10个按钮
		for(int i = 0; i <= 10; i++)
		{
			// 第二个参数是按钮上显示的字符串
			add(new Button("Card " + i), "Card " + i);
		}
		
		// 把这个applet注册为thread
		timer = new Thread(this);
	}
	
	public void start()
	{
		timer.start();
	}
	public void stop()
	{
		timer = null;
	}
	// 按照runable接口的规定，定义run方法
	public void run()
	{
		CardLayout layout = (CardLayout)getLayout();
		
		// 得到这个县城的一个引用
		Thread t = Thread.currentThread();
		// 当县城active时循环
		while(t == timer)
		{
			layout.next(this);
			// 在更新前等待1秒
			try {
				timer.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
				return;
			}
		}
	}
}