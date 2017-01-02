import java.applet.*;
import java.awt.*;
import java.awt.event.*;

public class CheckboxTest extends Applet implements ItemListener
{
	// 用来容纳几个复选框的CheckboxGroup
	private CheckboxGroup cbg;
	
	// applet采用的选项
	private final String selections[] = {
			"Pepsi", "Coke", "Mountain Dew", "Tab"
	};
	
	private Checkbox createCheckbox(
			String label,	// 复选框的标签
			CheckboxGroup group,	// 所选的组
			boolean enabled		// 为真则设置这个复选框选中
			)
	{
		Checkbox cb = new Checkbox(label, group, enabled);
		cb.addItemListener(this);
		return cb;
	}
	// init
	public void init()
	{
		cbg = new CheckboxGroup();
		for(int i = 0; i < selections.length; i++)
		{
			add(createCheckbox(selections[i],  cbg,  false));
			
		}
	}
	// itemStateChanged
	public void itemStateChanged(ItemEvent e)
	{
		System.out.println("Yes, I certainly agree," + cbg.getSelectedCheckbox().getLabel() + "is vary delicious!");
	}
}
