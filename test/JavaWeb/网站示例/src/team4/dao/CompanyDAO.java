package team4.dao;

import java.util.ArrayList;

import team4.entity.Company;

public interface CompanyDAO {
	
	public boolean addCompany(Company c,String username);

	public boolean updCompany(Company c,String username);

	public boolean delCompany(String con_ID,String username);
	

	public ArrayList<Company> getAllCompany();
	
	public int getCompanyCount();
	
	public ArrayList<Company> getAllCompanyPage(int start, int length);
	
	
	public ArrayList<Company> getCompanyByName(String name);
	
	public ArrayList<Company> getCompanyByNamePage(String name,int start, int length);
	
	public int getCompanyByNameCount(String name);
	
	
	public Company getCompanyById(String con_ID);

}
