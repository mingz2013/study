package tuo;

import java.awt.BorderLayout;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class tuo {

	JFrame jf = new JFrame("托放功能");
	JTextArea srcTxt = new JTextArea(8, 30);
	JTextField jtf = new JTextField(34);
	
	public void init()
	{
		srcTxt.append("托放成功\n");
		srcTxt.append("可以将这段文本域的内容拖入其他程序\n");
		// 启动文本域和单行文本框的拖放支持
		srcTxt.setDragEnabled(true);
		jtf.setDragEnabled(true);
		jf.add(new JScrollPane(srcTxt));
		jf.add(jtf, BorderLayout.SOUTH);
		jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jf.pack();
		jf.setVisible(true);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new tuo().init();
	}

}
