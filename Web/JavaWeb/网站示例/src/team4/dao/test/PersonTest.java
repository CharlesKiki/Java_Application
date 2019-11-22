package team4.dao.test;

import java.util.ArrayList;
import java.util.Iterator;

import team4.dao.PersonDAO;
import team4.entity.Person;
import team4.factory.PersonDAOFactory;

public class PersonTest {
	
	public static void main(String[] args) {
	PersonDAO pd=PersonDAOFactory.getPersonInstance();
	
	Person p=new Person("14","2","5","4","2","3","1","2","3","1","2","3","1","2","3");

	boolean flag=pd.addPerson(p,"admin001");
	System.out.println(flag);	
	System.out.println("===============================");
	boolean flag2 = pd.delPerson("13","admin001");
	System.out.println(flag2);
	System.out.println("===============================");
	Person p2=new Person("8","hahahah","5","4","2","3","1","2","3","1","2","3","1","2","3");
	boolean flag3=pd.updPerson(p2,"admin001");
	System.out.println(flag3);
	System.out.println("===============================");
	ArrayList<Person> al = pd.getAllPerson();
	Iterator<Person> it = al.iterator();
	while (it.hasNext()) {
		Person ftest = it.next();
		System.out.println(ftest.getID_number());
		System.out.println(ftest.getName());
	}
	System.out.println("===============================");
	ArrayList<Person> re = pd.getPersonByName("3333");
	Iterator<Person> i = re.iterator();
	while (i.hasNext()) {
		Person ftes = i.next();
		System.out.println(ftes.getID_number());
		System.out.println(ftes.getName());
	}
	System.out.println("===============================");
	Person ft2 = pd.getPersonById("7");
	System.out.println(ft2.getID_number());
	System.out.println(ft2.getName());


	}
}
