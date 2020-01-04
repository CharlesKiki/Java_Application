package team4.entity;

public class Institution {
	
	private String ins_ID;
	private String name;
	private String level;
	private String postcode;
	private String legal_person_name;
	private String legal_person_contact;
	private String contact_name;
	private String contact;
	private String address;
	private String notes;
	
	public Institution(){}
	
	public Institution(String ins_ID,String name,String level,String postcode,String legal_person_name,String legal_person_contact,String contact_name,String contact,String address,String notes){
		this.ins_ID=ins_ID;
		this.name=name;
		this.level=level;
		this.postcode=postcode;
		this.legal_person_name=legal_person_name;
		this.legal_person_contact=legal_person_contact;
		this.contact_name=contact_name;
		this.contact=contact;
		this.address=address;
		this.notes=notes;
	}

	public String getIns_ID() {
		return ins_ID;
	}

	public void setIns_ID(String ins_ID) {
		this.ins_ID = ins_ID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getLegal_person_name() {
		return legal_person_name;
	}

	public void setLegal_person_name(String legal_person_name) {
		this.legal_person_name = legal_person_name;
	}

	public String getLegal_person_contact() {
		return legal_person_contact;
	}

	public void setLegal_person_contact(String legal_person_contact) {
		this.legal_person_contact = legal_person_contact;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

}
