package team4.dao;

import java.util.ArrayList;

import team4.entity.Person;

public interface PersonDAO {
	public boolean addPerson(Person p,String username);

	public boolean updPerson(Person p,String username);

	public boolean delPerson(String ID_number,String username);
	

	public ArrayList<Person> getAllPerson();
	
	public int getPersonCount();
	
	public ArrayList<Person> getAllPersonPage(int start, int length);
	
	
	public ArrayList<Person> getPersonByName(String name);
	
	public int getPersonByNameCount(String name);

	public ArrayList<Person> getPersonByNamePage(String name,int start, int length);
	
	
	public Person getPersonById(String ID_number);

}
