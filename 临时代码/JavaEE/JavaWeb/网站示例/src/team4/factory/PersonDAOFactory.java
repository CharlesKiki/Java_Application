package team4.factory;

import team4.dao.PersonDAO;
import team4.impl.PersonDAOImpl;

public class PersonDAOFactory {
	public static PersonDAO getPersonInstance() {
		return new PersonDAOImpl();
	}

}
