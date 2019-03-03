package team4.factory;

import team4.dao.UserDao;
import team4.impl.UserDAOImpl;

public class UserDAOFactory {
	public static UserDao getUserInstance() {
		return new UserDAOImpl();
	}
}
