package team4.dao;

import java.util.ArrayList;

import team4.entity.AdminLog;

public interface LogDAO {
	
	public ArrayList<AdminLog> getAllLog();
	
	public int getAllLogCount();
	
	public ArrayList<AdminLog> getAllLogPage(int start,int length);
	
	
	public ArrayList<AdminLog> getAllLogDay(String time);
	
	public int getAllLogDayCount(String time);
	
	public ArrayList<AdminLog> getAllLogDayPage(String time,int start,int length);
	
	
	public ArrayList<AdminLog> getAllLogFromTo(String fromtime, String totime);
	
	public int getAllLogFromToCount(String fromtime, String totime);
	
	public ArrayList<AdminLog> getAllLogFromToPage(String fromtime, String totime,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByUser(String username);
	
	public int getLogByUserCount(String username);
	
	public ArrayList<AdminLog> getLogByUserPage(String username,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByUserDay(String username,String time);
	
	public int getLogByUserDayCount(String username,String time);
	
	public ArrayList<AdminLog> getLogByUserDayPage(String username,String time,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByUserFromTo(String username,String fromtime, String totime);
	
	public int getLogByUserFromToCount(String username,String fromtime, String totime);
	
	public ArrayList<AdminLog> getLogByUserFromToPage(String username,String fromtime, String totime,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByAction(String action);
	
	public int getLogByActionCount(String action);
	
	public ArrayList<AdminLog> getLogByActionPage(String action,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByActionDay(String action,String time);
	
	public int getLogByActionDayCount(String action,String time);
	
	public ArrayList<AdminLog> getLogByActionDayPage(String action,String time,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByActionFromTo(String action,String fromtime, String totime);
	
	public int getLogByActionFromToCount(String action,String fromtime, String totime);
	
	public ArrayList<AdminLog> getLogByActionFromToPage(String action,String fromtime, String totime,int start,int length);
	
	
	public ArrayList<AdminLog> getLogByTime(String time);
	
	public int getLogByTimeCount(String time);
	
	public ArrayList<AdminLog> getLogByTimePage(String time,int start,int length);
	
	
	public ArrayList<AdminLog> getLogFromTo(String fromtime, String totime);
	
	public int getLogFromToCount(String fromtime, String totime);
	
	public ArrayList<AdminLog> getLogFromToPage(String fromtime, String totime,int start,int length);
	

}
