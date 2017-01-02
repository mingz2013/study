public class Facade{

	ServiceA sa;
	
	ServiceB sb;
	
	ServiceC sc;
	
	public Facade(){
		sa = new ServiceAImp1();
		sb = new ServiceBImp1();
		sc = new ServiceCImp1();
	}
	
	public void methodA(){
		sa.methodA();
		sb.methodB();
	}
	
	public void methodB(){
		sa.methodB();
		sc.methodC();
	}
	
	public void methodC(){
		sc.methodC();
		sa.methodA();
	}
	
}