package team4.entity;

public class Facility {
	private String ser_ID;
	private String name;
	private String charge_type = "facility";
	private String usable_range;
	private String notes;

	public Facility() {
	}

	public Facility(String ser_ID, String name, String usable_range,
			String notes) {
		this.ser_ID = ser_ID;
		this.name = name;
		this.usable_range = usable_range;
		this.notes = notes;
	}

	public String getSer_ID() {
		return ser_ID;
	}

	public void setSer_ID(String ser_ID) {
		this.ser_ID = ser_ID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public String getUsable_range() {
		return usable_range;
	}

	public void setUsable_range(String usable_range) {
		this.usable_range = usable_range;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

}
