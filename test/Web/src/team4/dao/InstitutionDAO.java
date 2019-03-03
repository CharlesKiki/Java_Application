package team4.dao;

import java.util.ArrayList;

import team4.entity.Institution;

public interface InstitutionDAO {
	
	public boolean addInstitution(Institution c,String username);

	public boolean updInstitution(Institution c,String username);

	public boolean delInstitution(String ins_ID,String username);
	

	public ArrayList<Institution> getAllInstitution();
	
	public int getInstitutionCount();
	
	public ArrayList<Institution> getAllInstitutionPage(int start, int length);
	
	
	public ArrayList<Institution> getInstitutionByName(String name);
	
	public ArrayList<Institution> getInstitutionByNamePage(String name,int start, int length);
	
	public int getInstitutionByNameCount(String name);
	
	
	public Institution getInstitutionById(String ins_ID);
	
	
	public ArrayList<Institution> getInstitutionByLevel(String level);
	
	public ArrayList<Institution> getInstitutionByLevelPage(String level,int start, int length);
	
	public int getInstitutionByLevelCount(String level);

}
