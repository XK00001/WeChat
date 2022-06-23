package pojo;

public class provider {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProcode() {
		return procode;
	}
	public void setProcode(String procode) {
		this.procode = procode;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProdesc() {
		return prodesc;
	}
	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}
	public String getProcontact() {
		return procontact;
	}
	public void setProcontact(String procontact) {
		this.procontact = procontact;
	}
	public String getProphone() {
		return prophone;
	}
	public void setProphone(String prophone) {
		this.prophone = prophone;
	}
	public String getProaddress() {
		return proaddress;
	}
	public void setProaddress(String proaddress) {
		this.proaddress = proaddress;
	}
	public provider() {
		super();
	}
	public provider(int id,String procode,String proname,String prodesc,String procontact,String prophone,String proaddress) {
		this.id = id;
		this.procode = procode;
		this.prodesc = prodesc;
		this.proname = proname;
		this.procontact = procontact;
		this.prophone = prophone;
		this.proaddress = proaddress;
	}
	private String procode;
	private String proname;
	private String prodesc;
	private String procontact;
	private String prophone;
	private String proaddress;
}
