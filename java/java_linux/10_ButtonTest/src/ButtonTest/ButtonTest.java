package ButtonTest;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.peer.ButtonPeer;

import javax.swing.ButtonModel;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;



public class ButtonTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EventQueue.invokeLater(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				ButtonFrame frame = new ButtonFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
			}
		});

	}

}

class ButtonFrame extends JFrame{
	public ButtonFrame(){
		setTitle("ButtonFrame");
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);	// 设置尺寸
		
		JButton yellowButton = new JButton("Yellow");
		JButton blueButton = new JButton("Blue");
		JButton redButton = new JButton("Red");
		
		buttonPanel = new JPanel();
		
		buttonPanel.add(yellowButton);
		buttonPanel.add(blueButton);
		buttonPanel.add(redButton);
		
		add(buttonPanel);
		
		ColorAction yellowAction = new ColorAction(Color.YELLOW);
		ColorAction blueAction = new ColorAction(Color.BLUE);
		ColorAction redAction = new ColorAction(Color.RED);
		
		yellowButton.addActionListener(yellowAction);
		blueButton.addActionListener(blueAction);
		redButton.addActionListener(redAction);
		
		
	}
	private class ColorAction implements ActionListener{

		public ColorAction(Color c){
			backgroundColor = c;
		}
		
		
		private Color backgroundColor;


		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			buttonPanel.setBackground(backgroundColor);
			
		}
		
	} 
	private JPanel buttonPanel;
	public static final int DEFAULT_WIDTH = 400;
	public static final int DEFAULT_HEIGHT = 400;
	
}


