package team4.factory;

import team4.dao.FacilityDAO;
import team4.impl.FacilityDAOImpl;

public class FacilityDAOFactory {
	public static FacilityDAO getFacilityInstance() {
		return new FacilityDAOImpl();
	}

}
