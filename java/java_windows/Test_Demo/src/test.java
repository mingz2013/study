import java.awt.*;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
public class test extends Frame{

	public static void main(String[]args){
		Frame f=new Frame();
		f.setSize(200,300);
		Panel p=new Panel(new GridLayout(2,2));
		Label l=new Label("������" );
		p.add(l);
	
		TextArea text=new TextArea();
		text.setText("let");
		p.add(text);
		//f.add(text);
		Button b=new Button("queding");
		p.add(b);
		f.add(p);
		f.setVisible(true);
		f.addWindowListener(new WindowListener() {
			
			@Override
			public void windowOpened(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowIconified(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
				@Override
			public void windowDeiconified(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowDeactivated(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowClosing(WindowEvent arg0) {
				// TODO Auto-generated method stub
		System.exit(0);
			}
			
			@Override
			public void windowClosed(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowActivated(WindowEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
	}
	
}
