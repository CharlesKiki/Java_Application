package team4.dao.test;

import team4.dao.CompanyDAO;
import team4.entity.Company;
import team4.factory.CompanyDAOFactory;

public class CompanyTest {
	
	public static void main(String[] args) {
	CompanyDAO cd=CompanyDAOFactory.getCompanyInstance();
	Company c=new Company("1","2","3","4","5");
	
	boolean flag=cd.addCompany(c,"admin002");
	System.out.println(flag);
	System.out.println("=========================");
	
	}
	
}
