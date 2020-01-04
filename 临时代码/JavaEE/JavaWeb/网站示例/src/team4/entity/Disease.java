package team4.entity;

public class Disease {
	private String dis_ID;
	private String name;
	private String flag;
	private String notes;
	
	public Disease() {}

	public Disease(String dis_ID, String name, String flag, String notes) {
		this.dis_ID = dis_ID;
		this.name = name;
		this.flag = flag;
		this.notes = notes;
	}

	public String getDis_ID() {
		return dis_ID;
	}

	public void setDis_ID(String dis_ID) {
		this.dis_ID = dis_ID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
