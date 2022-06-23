package pojo;

public class store {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpeccode() {
		return speccode;
	}
	public void setSpeccode(String speccode) {
		this.speccode = speccode;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	public store() {
		super();
	}
	public store(int id,String scode,String sname,String speccode,String saddress) {
		this.id = id;
		this.scode = scode;
		this.sname = sname;
		this.speccode = speccode;
		this.saddress = saddress;
	}
	private String scode;
	private String sname;
	private String speccode;
	private String saddress;
}
