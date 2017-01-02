public class Test{


	public static void main(String[] args){
		ServiceA sa = new ServiceAImp1();
		ServiceB sb = new ServiceBImp1();
		
		sa.methodA();
		sb.methodB();
		
		System.out.println("===========");
		
		Facade facade = new Facade();
		facade.methodA();
		facade.methodB();
	}
}