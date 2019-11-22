package team4.factory;

import team4.dao.DrugDAO;
import team4.impl.DrugDAOImpl;

public class DrugDAOFactory {
	public static DrugDAO getDrugInstance() {
		return new DrugDAOImpl();
	}
}
