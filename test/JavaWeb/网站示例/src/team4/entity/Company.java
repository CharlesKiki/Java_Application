package team4.entity;

public class Company {
	private String con_ID;
	private String name;
	private String address;
	private String contact;
	private String postcode;
	
	public Company(){}
	public Company(String con_ID,String name,String address,String contact,String postcode){
		this.con_ID=con_ID;
		this.name=name;
		this.address=address;
		this.contact=contact;
		this.postcode=postcode;
	}
	public String getCon_ID() {
		return con_ID;
	}
	public void setCon_ID(String con_ID) {
		this.con_ID = con_ID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	

}
