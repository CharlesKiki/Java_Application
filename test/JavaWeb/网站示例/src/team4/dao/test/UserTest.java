package team4.dao.test;

import team4.dao.UserDao;
import team4.entity.User;
import team4.factory.UserDAOFactory;

public class UserTest {
	public static void main(String[] args) {
		UserDao ud=UserDAOFactory.getUserInstance();
		User u=new User("admin001","123456789abc","admin");
		boolean flag=ud.updUser(u);
		System.out.println(flag);
		System.out.println("===============================");
		User ut=ud.getUserByName("admin002");
		System.out.println(ut.getUsername());
		System.out.println(ut.getPassword());
		System.out.println(ut.getFlag());
		
	}

}
