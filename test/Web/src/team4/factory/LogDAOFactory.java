package team4.factory;

import team4.dao.LogDAO;
import team4.impl.LogDAOImpl;

public class LogDAOFactory {
	public static LogDAO getLogInstance() {
		return new LogDAOImpl();
	}
}
