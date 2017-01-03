package letpackage;

public class ChineseStudent implements Student {

	int age;
	String name;
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChineseStudent other = (ChineseStudent) obj;
		if (age != other.age)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ChineseStudent [age=" + age + ", name=" + name + "]";
	}
	
	public ChineseStudent(int age, String name) {
		super();
		this.age = age;
		this.name = name;
	}
	@Override
	public void study() {
		// TODO Auto-generated method stub
		System.out.println("study");

	}

	public ChineseStudent() {
		super();
	}

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("eat");

	}

}
