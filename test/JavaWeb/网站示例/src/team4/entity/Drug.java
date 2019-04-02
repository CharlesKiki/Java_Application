package team4.entity;

public class Drug {
	private String drug_ID;
	private String name_ch;
	private String name_en;
	private String type;
	private String flag;
	private String level;
	private String ins_level;
	private String hos_level;
	private String app_flag;
	private String max_price;
	private String form;
	private String measure;
	private String usage;
	private String times;
	private String standard;
	private String days;
	private String drug_factory;
	private String state;
	private String usable_range;
	private String national_coding;
	private String origin;
	private String notes;
	
	public Drug() {}
	
	public Drug(String drug_ID, String name_ch, String name_en, String type,
			String flag, String level, String ins_level, String hos_level,
			String app_flag, String max_price, String form, String measure,
			String usage, String times, String standard, String days,
			String drug_factory, String state, String usable_range,
			String national_coding, String origin, String notes) {
		super();
		this.drug_ID = drug_ID;
		this.name_ch = name_ch;
		this.name_en = name_en;
		this.type = type;
		this.flag = flag;
		this.level = level;
		this.ins_level = ins_level;
		this.hos_level = hos_level;
		this.app_flag = app_flag;
		this.max_price = max_price;
		this.form = form;
		this.measure = measure;
		this.usage = usage;
		this.times = times;
		this.standard = standard;
		this.days = days;
		this.drug_factory = drug_factory;
		this.state = state;
		this.usable_range = usable_range;
		this.national_coding = national_coding;
		this.origin = origin;
		this.notes = notes;
	}

	public String getDrug_ID() {
		return drug_ID;
	}

	public void setDrug_ID(String drug_ID) {
		this.drug_ID = drug_ID;
	}

	public String getName_ch() {
		return name_ch;
	}

	public void setName_ch(String name_ch) {
		this.name_ch = name_ch;
	}

	public String getName_en() {
		return name_en;
	}

	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getIns_level() {
		return ins_level;
	}

	public void setIns_level(String ins_level) {
		this.ins_level = ins_level;
	}

	public String getHos_level() {
		return hos_level;
	}

	public void setHos_level(String hos_level) {
		this.hos_level = hos_level;
	}

	public String getApp_flag() {
		return app_flag;
	}

	public void setApp_flag(String app_flag) {
		this.app_flag = app_flag;
	}

	public String getMax_price() {
		return max_price;
	}

	public void setMax_price(String max_price) {
		this.max_price = max_price;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getMeasure() {
		return measure;
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getDrug_factory() {
		return drug_factory;
	}

	public void setDrug_factory(String drug_factory) {
		this.drug_factory = drug_factory;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUsable_range() {
		return usable_range;
	}

	public void setUsable_range(String usable_range) {
		this.usable_range = usable_range;
	}

	public String getNational_coding() {
		return national_coding;
	}

	public void setNational_coding(String national_coding) {
		this.national_coding = national_coding;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
