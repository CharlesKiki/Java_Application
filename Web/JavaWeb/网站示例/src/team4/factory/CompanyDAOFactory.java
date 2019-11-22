package team4.factory;

import team4.dao.CompanyDAO;
import team4.impl.CompanyDAOImpl;

public class CompanyDAOFactory {
	public static CompanyDAO getCompanyInstance() {
		return new CompanyDAOImpl();
	}

}
