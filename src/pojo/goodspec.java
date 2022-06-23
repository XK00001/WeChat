package pojo;

public class goodspec {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpeccode() {
		return speccode;
	}
	public void setSpeccode(String speccode) {
		this.speccode = speccode;
	}
	public String getSpecname() {
		return specname;
	}
	public void setSpecname(String specname) {
		this.specname = specname;
	}
	public goodspec() {
		super();
	}
	public goodspec(int id,String speccode,String specname) {
		this.id = id;
		this.speccode = speccode;
		this.specname = specname;
	}
	private String speccode;
	private String specname;
}
