package pojo;

public class goods {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getSpeccode() {
		return speccode;
	}
	public void setSpeccode(String speccode) {
		this.speccode = speccode;
	}
	public String getGunit() {
		return gunit;
	}
	public void setGunit(String gunit) {
		this.gunit = gunit;
	}
	public String getProcode() {
		return procode;
	}
	public void setProcode(String procode) {
		this.procode = procode;
	}
	public goods() {
		super();
	}
	public goods(int id,String gcode,String gname,String speccode,String gunit,String procode) {
		this.id = id;
		this.gcode = gcode;
		this.gname = gname;
		this.speccode = speccode;
		this.gunit = gunit;
		this.procode = procode;
	}
	private String gcode;
	private String gname;
	private String speccode;
	private String gunit;
	private String procode;
}
