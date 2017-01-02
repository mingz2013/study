import java.applet.*;
import java.awt.*;
import java.awt.event.*;


// 允许改变角色的一个属性
class AttributePanel extends Panel
{
	// 属性的文本描述
	private String attribute;
	
	// 显示这个属性所分配点值的Label
	private Label pointsAllocated;
	
	public AttributePanel(String attr, ActionListener l)
	{
		attribute = attr;
		pointsAllocated = new Label("0", Label.CENTER);
		// 设置Panel的布局为3*1的网络
		setLayout(new GridLayout(3, 1));
		
		setBackground(Color.GREEN);
		
		// 添加描述属性的标签
		add(new Label(attr, Label.CENTER));
		add(pointsAllocated);
		
		// 把+/-按钮添加到父actionlistener上
		Button incr = new AttributeButton("+", this);
		incr.addActionListener(l);
		Button decr = new AttributeButton("-", this);
		decr.addActionListener(l);
		
		// 添加另一个有加。减按钮的panel
		Panel p = new Panel();
		p.add(incr);
		p.add(decr);
		add(p);
		
	}
	
	// 更新pointsAllocated label
	public void allocatePoints(int n)
	{
		int value = getPointsAllocated() + n;
		pointsAllocated.setText("" + value);
	}
	
	// 返回给这个属性分配的点值
	public int getPointsAllocated()
	{
		return Integer.parseInt(pointsAllocated.getText());
	}
	public String toString()
	{
		// 返回这个属性的详细描述
		return attribute + ":  " + getPointsAllocated();
	}
}	//AttributePanel

// 允许改变属性
class AttributeButton extends Button
{
	// 放这个按钮的Panel
	private AttributePanel parent;
	public AttributeButton(String label, AttributePanel ap)
	{
		super(label);
		parent = ap;
	}
	
	// 更新父控件的属性
	public int updatePanel(
			int pointsRemaining	// 还未分配的点值
			)
	{
		// 为plus按钮分配一个点值
		if(getLabel().equals("+"))
		{
			// 尽在还有点值剩余式分配，
			if(pointsRemaining > 0)
			{
				parent.allocatePoints(1);
				return -1;
			}else return 0;
		// 否则不分陪
		}else{
			// 不允许分配负数
			if(parent.getPointsAllocated() > 0)
			{
				parent.allocatePoints(-1);
				return 1;
			}else return 0;
		}
	}
	
	
}	// AttributeButton

public class AttributeTest extends Applet implements ActionListener
{
	// 所有剩余的点数
	Label pointsRemaining;
	
	// 这个applet的属性
	private final String ATTRS[] = {
			"Strength", "Wisdom", "Agility", "Magic"
	};
	public void init()
	{
		pointsRemaining = new Label("Points remaining: 10", Label.CENTER);
		
		// 设置applet的布局为flowlayout
		setLayout(new FlowLayout(FlowLayout.CENTER, 5, 10));
		
		// 添加组建
		for(int i = 0; i < ATTRS.length; i++)
		{
			add(new AttributePanel(ATTRS[i], this));
		}
		add(pointsRemaining);
	}// init
	public void actionPerformed(ActionEvent e)
	{
		// 得到剩余的点数
		int n = Integer.parseInt(pointsRemaining.getText().substring(18));
		
		// 更新按钮Panel的标签和主标签
		n += ((AttributeButton)e.getSource()).updatePanel(n);
		pointsRemaining.setText("Points remaining: " + n);
	}
}	// AttributeTest