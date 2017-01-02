import java.applet.*;
import java.awt.*;
import java.util.StringTokenizer;

public class GridTest extends Applet
{
	public void init()
	{
		// 创建一个字符串和一个解析字符串的StringTokenizer
		String string = "My head is my only house unless it rains";
		java.util.StringTokenizer st = new StringTokenizer(string);
		
		// 创建一个3*3的网格布局，组建之间的间隙为5像素
		setLayout(new GridLayout(3, 3, 5, 5));
		
		// 为每一个标志字符串创建一个背景颜色为绿色的标签，并把它加到panel上
		while(st.hasMoreTokens())
		{
			Label label = new Label(st.nextToken(), Label.CENTER);
			label.setBackground(Color.green);
			add(label);
		}
	}
}