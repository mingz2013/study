import java.applet.*;;
import java.awt.*;
import java.awt.event.*;

public class ChoiceTest extends Applet implements ItemListener
{
	// 我们的几种骨骼的技术名字
	public final String BONES[] = {
			"foot", "leg", "knee", "hip", "rib", "shoulder", "neck"
	};
	
	// 包含上面这个字幅串数组的下拉列表框
	private Choice choice;
	
	public void init() {
		setBackground(new Color(125, 0, 225));;
		
		// 创建Choice并注册item listener
		choice = new Choice();
		for(int i = 0; i < BONES.length; i++)
		{
			// 添加一个字符串来描述每一种选择
			choice.add(BONES[i]);
		}
		choice.addItemListener(this);
		add(choice);
	}
	
	public void itemStateChanged(ItemEvent e) {
		
			// 产生一个与当前所选的项不同的额索引
			int index;
			do {
				index = (int)(Math.random() * BONES.length);
			} while (index == choice.getSelectedIndex());;
			
			// 打印一条重要的人体解剖学事实
			System.out.println("The " + choice.getSelectedItem() + "bone is connected to the " + BONES[index] + "bone,,,");
			
		
		
	}
}