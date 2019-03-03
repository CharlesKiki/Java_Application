package team4.dao.test;

import java.util.ArrayList;
import java.util.Iterator;

import team4.dao.LogDAO;
import team4.entity.AdminLog;
import team4.factory.LogDAOFactory;

public class LogTest {
	
	public static void main(String[] args) {
	LogDAO ld=LogDAOFactory.getLogInstance();
	
	/*ArrayList<Log> al = ld.getAllLog();
	Iterator<Log> it = al.iterator();
	while (it.hasNext()) {
		Log ltest = it.next();
		System.out.println(ltest.getId());
		System.out.println(ltest.getUsername());
		System.out.println(ltest.getAction());
		System.out.println(ltest.getTable_name());
		System.out.println(ltest.getRecord_ID());
		System.out.println(ltest.getRecord_name());
		System.out.println(ltest.getTime());
		System.out.println("============================");
		}*/
	
	/*ArrayList<Log> al2 = ld.getLogByUser("admin002");
	Iterator<Log> it2 = al2.iterator();
	while (it2.hasNext()) {
		Log ltest = it2.next();
		System.out.println(ltest.getId());
		System.out.println(ltest.getUsername());
		System.out.println(ltest.getAction());
		System.out.println(ltest.getTable_name());
		System.out.println(ltest.getRecord_ID());
		System.out.println(ltest.getRecord_name());
		System.out.println(ltest.getTime());
		System.out.println("============================");
		}*/
	
	/*ArrayList<Log> al3 = ld.getLogByAction("¸üÐÂ");
	Iterator<Log> it3 = al3.iterator();
	while (it3.hasNext()) {
		Log ltest = it3.next();
		System.out.println(ltest.getId());
		System.out.println(ltest.getUsername());
		System.out.println(ltest.getAction());
		System.out.println(ltest.getTable_name());
		System.out.println(ltest.getRecord_ID());
		System.out.println(ltest.getRecord_name());
		System.out.println(ltest.getTime());
		System.out.println("============================");
		}*/
	
	/*ArrayList<Log> al4 = ld.getLogByTime("2016-05-13");
	Iterator<Log> it4 = al4.iterator();
	while (it4.hasNext()) {
		Log ltest = it4.next();
		System.out.println(ltest.getId());
		System.out.println(ltest.getUsername());
		System.out.println(ltest.getAction());
		System.out.println(ltest.getTable_name());
		System.out.println(ltest.getRecord_ID());
		System.out.println(ltest.getRecord_name());
		System.out.println(ltest.getTime());
		System.out.println("============================");
		}*/
	
	ArrayList<AdminLog> al5 = ld.getLogFromTo("2016-05-10","2016-05-18");
	Iterator<AdminLog> it5 = al5.iterator();
	while (it5.hasNext()) {
		AdminLog ltest = it5.next();
		System.out.println(ltest.getId());
		System.out.println(ltest.getUsername());
		System.out.println(ltest.getAction());
		System.out.println(ltest.getTable_name());
		System.out.println(ltest.getRecord_ID());
		System.out.println(ltest.getRecord_name());
		System.out.println(ltest.getTime());
		System.out.println("============================");
		}
	}
}
