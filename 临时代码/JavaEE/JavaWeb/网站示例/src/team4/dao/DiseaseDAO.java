package team4.dao;

import java.util.ArrayList;

import team4.entity.Disease;

public interface DiseaseDAO {
	
	public boolean addDisease(Disease c,String username);

	public boolean updDisease(Disease c,String username);

	public boolean delDisease(String dis_ID,String username);
	

	public ArrayList<Disease> getAllDisease();
	
	public int getDiseaseCount();
	
	public ArrayList<Disease> getAllDiseasePage(int start, int length);
	
	
	public ArrayList<Disease> getDiseaseByName(String name);
	
	public ArrayList<Disease> getDiseaseByNamePage(String name,int start, int length);
	
	public int getDiseaseByNameCount(String name);
	
	
	public Disease getDiseaseById(String dis_ID);

}
