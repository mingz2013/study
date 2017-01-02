public class FlyweightFactory{

	private static Map flyweights = new HashMap();
	
	public FlyweightFactory(String arg){
		flyweights.put(arg, new FlyweightImp1());
	}
	
	public static Flyweight getFlyweight(String key){
		if(flyweights.get(key) == null){
			flyweights.put(key, new FlyweightImp1());
		}
		return flyweights.get(key);
	}
	
	public static int getSize(){
		return flyweights.size();
	}
}