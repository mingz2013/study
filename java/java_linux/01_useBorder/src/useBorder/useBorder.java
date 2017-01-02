package useBorder;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.BevelBorder;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EtchedBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.MatteBorder;
import javax.swing.border.TitledBorder;

public class useBorder {

	private JFrame jf = new JFrame("边框");
	public void init()
	{
		jf.setLayout(new GridLayout(2, 4));
		// 使用静态工厂方法创建BevelBorder
		Border bb = BorderFactory.createBevelBorder(BevelBorder.RAISED, Color.RED, Color.GREEN, Color.BLUE, Color.GRAY);
		jf.add(getPanelWithBorder(bb, "BevelBorder"));
		// 使用静态工厂方法创建LineBorder
		Border lb = BorderFactory.createLineBorder(Color.ORANGE, 10);
		jf.add(getPanelWithBorder(lb, "LineBorder"));
		// 用静态工厂方法创建EmptyBorder,目的是在组建四周留空
		Border eb = BorderFactory.createEmptyBorder(20, 5, 10, 30);
		jf.add(getPanelWithBorder(eb, "EmptyBorder"));
		// 使用静态工厂方式创建EtchedBorder
		Border etb = BorderFactory.createEtchedBorder(EtchedBorder.RAISED, Color.RED, Color.GREEN);
		jf.add(getPanelWithBorder(etb, "EtchedBorder"));
		// 创建TitledBorder TitledBorder边框为原有的边框增加标题
		TitledBorder tb = new TitledBorder(lb, "测试文字", TitledBorder.LEFT, TitledBorder.ABOVE_BOTTOM, new Font("StSong", Font.BOLD, 18), Color.BLUE);
		jf.add(getPanelWithBorder(tb, "TitledBorder"));
		// 创建MatteBorder,这是EmptyBorder的子类
		// 它可以指定留空区域的颜色背景，此处是指定颜色
		MatteBorder mb = new MatteBorder(20, 5, 10, 30, Color.GREEN);
		jf.add(getPanelWithBorder(mb, "MatteBorder"));
		// 创建CompoundBorder将两个边框组合成新边框
		CompoundBorder cb = new CompoundBorder(new LineBorder(Color.RED, 8), tb);
		jf.add(getPanelWithBorder(cb, "CompoundBorder"));
		
		jf.pack();
		jf.setVisible(true);
		
	}
	public JPanel getPanelWithBorder(Border b, String BorderName) {
		// TODO Auto-generated method stub
		JPanel p = new JPanel();
		p.add(new JLabel(BorderName));
		// 为Panel组建设置边框
		p.setBorder(b);
		return p;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.print("hello world");
		new useBorder().init();
	}

}
