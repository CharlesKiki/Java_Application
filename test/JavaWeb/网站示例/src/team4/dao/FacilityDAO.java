package team4.dao;

import java.util.ArrayList;
import team4.entity.Facility;

public interface FacilityDAO {

	public boolean addFacility(Facility f,String username);

	public boolean updFacility(Facility f,String username);

	public boolean delFacility(String ser_ID,String username);
	

	public ArrayList<Facility> getAllFacility();
	
	public int getFacilityCount();
	
	public ArrayList<Facility> getAllFacilityPage(int start, int length);
	
	
	public ArrayList<Facility> getFacilityByName(String name);
	
	public ArrayList<Facility> getFacilityByNamePage(String name,int start, int length);
	
	public int getFacilityByNameCount(String name);
	
	
	public Facility getFacilityById(String ser_ID);

}
