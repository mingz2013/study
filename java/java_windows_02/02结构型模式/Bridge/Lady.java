public class Lady extends Person{
	public Lady(){
		setType("≈Æ»À");
	}
	
	public void dress(){
		Clothing clothing = getClothing();
		clothing.personDressCloth(this);
	}
}