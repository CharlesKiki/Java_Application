package team4.entity;

public class Person {
	private String ID_number;//身份证编号
	private String name;//姓名
	private String birthday;//出生日期
	private String sex;//性别
	private String nation;//民族
	private String reg_cha;//户口性质
	private String reg_pla;//户口所在地
	private String cul_stan;//文化程度
	private String pol_sta;//政治面貌
	private String mar_sta;//婚姻状况
	private String resident_f;//居民类别
	private String dep_number;//单位编号
	private String state;//离退休状态
	private String per_category;//医疗人员类别
	private String ins_number;//医疗机构编号
	
	public Person(){}
	public Person(String ID_number,String name,String birthday,String sex,String nation,String reg_cha,
			String reg_pla, String cul_stan,String pol_sta,String mar_sta,String resident_f,String dep_number,
			String state,String per_category,String ins_number){
		this.ID_number=ID_number;
		this.name=name;
		this.birthday=birthday;
		this.sex=sex;
		this.nation=nation;
		this.reg_cha=reg_cha;
		this.reg_pla=reg_pla;
		this.cul_stan=cul_stan;
		this.pol_sta=pol_sta;
		this.mar_sta=mar_sta;
		this.resident_f=resident_f;
		this.setDep_number(dep_number);
		this.state=state;
		this.per_category=per_category;
		this.ins_number=ins_number;
	}
	
	public String getID_number() {
		return ID_number;
	}
	public void setID_number(String iD_number) {
		ID_number = iD_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getReg_cha() {
		return reg_cha;
	}
	public void setReg_cha(String reg_cha) {
		this.reg_cha = reg_cha;
	}
	public String getReg_pla() {
		return reg_pla;
	}
	public void setReg_pla(String reg_pla) {
		this.reg_pla = reg_pla;
	}
	public String getCul_stan() {
		return cul_stan;
	}
	public void setCul_stan(String cul_stan) {
		this.cul_stan = cul_stan;
	}
	public String getPol_sta() {
		return pol_sta;
	}
	public void setPol_sta(String pol_sta) {
		this.pol_sta = pol_sta;
	}
	public String getMar_sta() {
		return mar_sta;
	}
	public void setMar_sta(String mar_sta) {
		this.mar_sta = mar_sta;
	}
	public String getResident_f() {
		return resident_f;
	}
	public void setResident_f(String resident_f) {
		this.resident_f = resident_f;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPer_category() {
		return per_category;
	}
	public void setPer_category(String per_category) {
		this.per_category = per_category;
	}
	public String getIns_number() {
		return ins_number;
	}
	public void setIns_number(String ins_number) {
		this.ins_number = ins_number;
	}
	public String getDep_number() {
		return dep_number;
	}
	public void setDep_number(String dep_number) {
		this.dep_number = dep_number;
	}
	
	
	
	
	
	
	

}
