public class ProjectAssistant extends Employer{

	public ProjectAssistant(String name){
		setName(name);
		employers = null;	// 项目经理，表示没有下属了
	}
	
	public void add(Employer employer){
	}
	
	public void delete(Employer emlpoyer){
	}
}