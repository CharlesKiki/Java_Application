package team4.dao;

import team4.entity.User;

public interface UserDao {
	
	public boolean updUser(User u);
	
	public User getUserByName(String name);
	

}
