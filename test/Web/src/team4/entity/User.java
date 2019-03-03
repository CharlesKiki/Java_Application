package team4.entity;

public class User {
	private String username;
	private String password;
	private String flag;
	
	public User(){
		
	}
	public User(String name, String pass, String flag){
		this.username=name;
		this.password=pass;
		this.flag=flag;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFlag() {
		return flag;
	}

}
