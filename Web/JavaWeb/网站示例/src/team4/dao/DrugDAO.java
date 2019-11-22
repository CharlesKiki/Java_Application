package team4.dao;

import java.util.ArrayList;

import team4.entity.Drug;

public interface DrugDAO {
	
	public boolean addDrug(Drug c,String username);

	public boolean updDrug(Drug c,String username);

	public boolean delDrug(String drug_ID,String username);
	

	public ArrayList<Drug> getAllDrug();
	
	public int getDrugCount();
	
	public ArrayList<Drug> getAllDrugPage(int start, int length);
	
	
	public ArrayList<Drug> getDrugByNameCh(String name_ch);
	
	public ArrayList<Drug> getDrugByNameChPage(String name_ch,int start, int length);
	
	public int getDrugByNameChCount(String name_ch);
	
	
	public Drug getDrugById(String drug_ID);
	
	
	public ArrayList<Drug> getDrugByLevel(String level);
	
	public ArrayList<Drug> getDrugByLevelPage(String level,int start, int length);
	
	public int getDrugByLevelCount(String level);
	
	
	public ArrayList<Drug> getDrugByInsLevel(String ins_level);
	
	public ArrayList<Drug> getDrugByInsLevelPage(String ins_level,int start, int length);
	
	public int getDrugByInsLevelCount(String ins_level);
	
	
	public ArrayList<Drug> getDrugByDrugFactory(String drug_factory);
	
	public ArrayList<Drug> getDrugByDrugFactoryPage(String drug_factory,int start, int length);
	
	public int getDrugByDrugFactoryCount(String drug_factory);
	
	
	public ArrayList<Drug> getDrugByCoding(String coding);
	
	public ArrayList<Drug> getDrugByCodingPage(String coding,int start, int length);
	
	public int getDrugByCodingCount(String coding);
	
	

}
