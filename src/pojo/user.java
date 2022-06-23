package pojo;

public class user {
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getUserrole() {
		return userrole;
	}
	public void setUserrole(int userrole) {
		this.userrole = userrole;
	}
	public user() {
		super();
	}
	public user(int id,String usercode,String username,String password,String gender,String birthday,int userrole) {
		this.id = id;
		this.usercode = usercode;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.userrole = userrole;
	}
	private int id;
	private String usercode;
	private String username;
	private String password;
	private String gender;
	private String birthday;
	private int userrole;

}
