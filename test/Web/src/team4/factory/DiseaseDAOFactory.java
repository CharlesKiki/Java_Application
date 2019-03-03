package team4.factory;

import team4.dao.DiseaseDAO;
import team4.impl.DiseaseDAOImpl;

public class DiseaseDAOFactory {
	public static DiseaseDAO getDiseaseInstance() {
		return new DiseaseDAOImpl();
	}
}
