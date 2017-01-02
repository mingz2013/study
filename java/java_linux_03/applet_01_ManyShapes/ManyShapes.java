import java.applet.*;
import java.awt.*;
import java.util.*;
public class ManyShapes extends Applet
{
	// 覆盖Applet类的paint方法
	public void paint(Graphics g) //g 用来绘制的图形环境
	{
		// 创建一个新的数字产生器
		Random r = new Random();
		
		// 绘制10000幅图形
		for(int i = 0; i < 10000; i++)
		{
			// 为图形产生随机数
			int x = r.nextInt() % 300;
			int y = r.nextInt() % 300;
			int width = r.nextInt() % 300;
			int height = r.nextInt() % 300;
			// 设置随机颜色
			g.setColor(new Color(r.nextInt()));
			// 产生一个在0与4之间的正数
			int n = Math.abs(r.nextInt() % 5);
			
			// 根据n的值绘制一副图形
			switch (n) {
			case 0:
				g.draw3DRect(x, y, width, height, true);
				break;
			case 1:
				g.drawRect(x, y, width, height);
				break;
			case 2:
				g.drawRect(x, y, width, height);
				break;
			case 3:
				g.drawRect(x, y, width, height);
				break;
			case 4:
				g.drawRect(x, y, width, height);
				break;
			default:
				System.out.println("Invalid case:" + n);
				break;
			}	// switch
		}	// for
	}	// paint
}	// ManyShapes