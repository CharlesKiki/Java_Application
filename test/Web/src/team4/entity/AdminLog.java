package team4.entity;

public class AdminLog {
	private int id;
	private String username;
	private String action;
	private String table_name;
	private String record_ID;
	private String record_name;
	private String time;
	
	public AdminLog(){}
	public AdminLog(int id,String username,String action,String table_name,String record_ID,String record_name,String time){
		this.id=id;
		this.username=username;this.action=action;
		this.table_name=table_name;
		this.record_ID=record_ID;
		this.record_name=record_name;
		this.time=time;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getRecord_ID() {
		return record_ID;
	}
	public void setRecord_ID(String record_ID) {
		this.record_ID = record_ID;
	}
	public String getRecord_name() {
		return record_name;
	}
	public void setRecord_name(String record_name) {
		this.record_name = record_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
