package team4.servlet.person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.PersonDAO;
import team4.entity.Person;
import team4.factory.PersonDAOFactory;

/**
 * Servlet implementation class updPerson
 */
@WebServlet("/updPerson")
public class updPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("修改人员信息");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		PersonDAO pd=PersonDAOFactory.getPersonInstance();
		Person person=new Person();
		
		if(request.getParameter("upd_ID_number0")!=null){
			person.setID_number(request.getParameter("upd_ID_number0"));
			person.setName(request.getParameter("upd_per_name0"));		
			person.setBirthday(request.getParameter("upd_birthday0"));	
			person.setSex(request.getParameter("upd_sex0"));
			person.setNation(request.getParameter("upd_nation0"));
			person.setReg_cha(request.getParameter("upd_reg_cha0"));
			person.setReg_pla(request.getParameter("upd_reg_pla0"));
			person.setCul_stan(request.getParameter("upd_cul_stan0"));
			person.setPol_sta(request.getParameter("upd_pol_sta0"));
			person.setMar_sta(request.getParameter("upd_mar_sta0"));
			person.setResident_f(request.getParameter("upd_resident_f0"));
			person.setDep_number(request.getParameter("upd_dep_number0"));
			person.setState(request.getParameter("upd_state0"));
			person.setPer_category(request.getParameter("upd_per_category0"));
			person.setIns_number(request.getParameter("upd_ins_number0"));
			pd.updPerson(person,username);}
			
			if(request.getParameter("upd_ID_number1")!=null){
			person.setID_number(request.getParameter("upd_ID_number1"));
			person.setName(request.getParameter("upd_per_name1"));		
			person.setBirthday(request.getParameter("upd_birthday1"));	
			person.setSex(request.getParameter("upd_sex1"));
			person.setNation(request.getParameter("upd_nation1"));
			person.setReg_cha(request.getParameter("upd_reg_cha1"));
			person.setReg_pla(request.getParameter("upd_reg_pla1"));
			person.setCul_stan(request.getParameter("upd_cul_stan1"));
			person.setPol_sta(request.getParameter("upd_pol_sta1"));
			person.setMar_sta(request.getParameter("upd_mar_sta1"));
			person.setResident_f(request.getParameter("upd_resident_f1"));
			person.setDep_number(request.getParameter("upd_dep_number1"));
			person.setState(request.getParameter("upd_state1"));
			person.setPer_category(request.getParameter("upd_per_category1"));
			person.setIns_number(request.getParameter("upd_ins_number1"));
			pd.updPerson(person,username);}		
			
			if(request.getParameter("upd_ID_number2")!=null){
			person.setID_number(request.getParameter("upd_ID_number2"));
			person.setName(request.getParameter("upd_per_name2"));		
			person.setBirthday(request.getParameter("upd_birthday2"));	
			person.setSex(request.getParameter("upd_sex2"));
			person.setNation(request.getParameter("upd_nation2"));
			person.setReg_cha(request.getParameter("upd_reg_cha2"));
			person.setReg_pla(request.getParameter("upd_reg_pla2"));
			person.setCul_stan(request.getParameter("upd_cul_stan2"));
			person.setPol_sta(request.getParameter("upd_pol_sta2"));
			person.setMar_sta(request.getParameter("upd_mar_sta2"));
			person.setResident_f(request.getParameter("upd_resident_f2"));
			person.setDep_number(request.getParameter("upd_dep_number2"));
			person.setState(request.getParameter("upd_state2"));
			person.setPer_category(request.getParameter("upd_per_category2"));
			person.setIns_number(request.getParameter("upd_ins_number2"));
			pd.updPerson(person,username);}
			
			if(request.getParameter("upd_ID_number3")!=null){		
			person.setID_number(request.getParameter("upd_ID_number3"));
			person.setName(request.getParameter("upd_per_name3"));		
			person.setBirthday(request.getParameter("upd_birthday3"));	
			person.setSex(request.getParameter("upd_sex3"));
			person.setNation(request.getParameter("upd_nation3"));
			person.setReg_cha(request.getParameter("upd_reg_cha3"));
			person.setReg_pla(request.getParameter("upd_reg_pla3"));
			person.setCul_stan(request.getParameter("upd_cul_stan3"));
			person.setPol_sta(request.getParameter("upd_pol_sta3"));
			person.setMar_sta(request.getParameter("upd_mar_sta3"));
			person.setResident_f(request.getParameter("upd_resident_f3"));
			person.setDep_number(request.getParameter("upd_dep_number3"));
			person.setState(request.getParameter("upd_state3"));
			person.setPer_category(request.getParameter("upd_per_category3"));
			person.setIns_number(request.getParameter("upd_ins_number3"));
			pd.updPerson(person,username);}
			
			if(request.getParameter("upd_ID_number4")!=null){
			person.setID_number(request.getParameter("upd_ID_number4"));
			person.setName(request.getParameter("upd_per_name4"));		
			person.setBirthday(request.getParameter("upd_birthday4"));	
			person.setSex(request.getParameter("upd_sex4"));
			person.setNation(request.getParameter("upd_nation4"));
			person.setReg_cha(request.getParameter("upd_reg_cha4"));
			person.setReg_pla(request.getParameter("upd_reg_pla4"));
			person.setCul_stan(request.getParameter("upd_cul_stan4"));
			person.setPol_sta(request.getParameter("upd_pol_sta4"));
			person.setMar_sta(request.getParameter("upd_mar_sta4"));
			person.setResident_f(request.getParameter("upd_resident_f4"));
			person.setDep_number(request.getParameter("upd_dep_number4"));
			person.setState(request.getParameter("upd_state4"));
			person.setPer_category(request.getParameter("upd_per_category4"));
			person.setIns_number(request.getParameter("upd_ins_number4"));
			pd.updPerson(person,username);}
				
		response.sendRedirect("admin/person/search_person.jsp");
	}

}
