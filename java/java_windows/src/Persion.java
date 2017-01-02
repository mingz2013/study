class Persion{
	String name;
	int age;
	String address;
	static int i;	// 静态成员变量，可以直接用类名调用 
	Persion(){
	}
	Persion(String name, int age){
		this.name = name;	// 这里不能省略this
		this.age = age;
		System.out.println("两个参数的构造函数");
	}
	Persion(String name, int age, String address){
		this(name, age); // 用this调用其它函数时，应放在第一行
		this.address = address;
		System.out.println("三个参数的构造函数");
	}
	void talk(){
		System.out.println("My name is " + name); // this.name 省略了this
	}
}