package team4.factory;

import team4.dao.InstitutionDAO;
import team4.impl.InstitutionDAOImpl;

public class InstitutionDAOFactory {
	public static InstitutionDAO getInstitutionInstance() {
		return new InstitutionDAOImpl();
	}
}
