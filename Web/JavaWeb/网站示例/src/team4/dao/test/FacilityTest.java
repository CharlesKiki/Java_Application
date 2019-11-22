package team4.dao.test;

import java.util.ArrayList;
import java.util.Iterator;

import team4.dao.FacilityDAO;
import team4.entity.Facility;
import team4.factory.FacilityDAOFactory;

public class FacilityTest {

	public static void main(String[] args) {

		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		Facility f = new Facility("fac00003", "抢救病房床位", "住院部", "收费标准不同");

		boolean flag = fd.addFacility(f,"admin001");
		System.out.println(flag);
		System.out.println(f.getSer_ID());
		System.out.println(f.getName());
		System.out.println(f.getCharge_type());
		System.out.println(f.getUsable_range());
		System.out.println(f.getNotes());
		System.out.println("===============================");
		boolean flag2 = fd.delFacility("fac00003","admin001");
		System.out.println(flag2);
		System.out.println("===============================");
		Facility ft = new Facility();
		ft.setSer_ID("fac00004");
		ft.setName("血液病房床位");
		ft.setUsable_range("住院部");
		ft.setNotes("0000000");
		boolean flag3 = fd.updFacility(ft,"admin001");
		System.out.println(flag3);
		System.out.println("===============================");
		ArrayList<Facility> al = fd.getAllFacility();
		Iterator<Facility> it = al.iterator();
		while (it.hasNext()) {
			Facility ftest = it.next();
			System.out.println(ftest.getSer_ID());
			System.out.println(ftest.getName());
			System.out.println(ftest.getCharge_type());
			System.out.println(ftest.getUsable_range());
			System.out.println(ftest.getNotes());
		}
		System.out.println("===============================");
		System.out.println("获取2到4条记录");
		ArrayList<Facility> page = fd.getAllFacilityPage(2,2);
		Iterator<Facility> itp = page.iterator();
		while (itp.hasNext()) {
			Facility ftest2 = itp.next();
			System.out.println(ftest2.getSer_ID());
			System.out.println(ftest2.getName());
			System.out.println(ftest2.getCharge_type());
			System.out.println(ftest2.getUsable_range());
			System.out.println(ftest2.getNotes());
		}
		System.out.println("===============================getFacilityByNamePage");
		ArrayList<Facility> re = fd.getFacilityByNamePage("111",1,2);
		Iterator<Facility> i = re.iterator();
		while (i.hasNext()) {
			Facility ftes = i.next();
			System.out.println(ftes.getSer_ID());
			System.out.println(ftes.getName());
			System.out.println(ftes.getCharge_type());
			System.out.println(ftes.getUsable_range());
			System.out.println(ftes.getNotes());
		}
		System.out.println("===============================");
		Facility ft2 = fd.getFacilityById("fac00002");
		System.out.println(ft2.getSer_ID());
		System.out.println(ft2.getName());
		System.out.println(ft2.getCharge_type());
		System.out.println(ft2.getUsable_range());
		System.out.println(ft2.getNotes());		
		System.out.println("===============================");
		int count=fd.getFacilityByNameCount("111");
		System.out.println(count);
	}

}
