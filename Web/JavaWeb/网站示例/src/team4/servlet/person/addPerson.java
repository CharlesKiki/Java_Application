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
 * Servlet implementation class addPerson
 */
@WebServlet("/addPerson")
public class addPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addPerson() {
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
		System.out.println("增加人员信息");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		PersonDAO pd=PersonDAOFactory.getPersonInstance();
		Person person=new Person();
		
		person.setID_number(request.getParameter("ID_number"));
		person.setName(request.getParameter("per_name"));		
		person.setBirthday(request.getParameter("birthday"));	
		person.setSex(request.getParameter("sex"));
		person.setNation(request.getParameter("nation"));
		person.setReg_cha(request.getParameter("reg_cha"));
		person.setReg_pla(request.getParameter("reg_pla"));
		person.setCul_stan(request.getParameter("cul_stan"));
		person.setPol_sta(request.getParameter("pol_sta"));
		person.setMar_sta(request.getParameter("mar_sta"));
		person.setResident_f(request.getParameter("resident_f"));
		person.setDep_number(request.getParameter("dep_number"));
		person.setState(request.getParameter("state"));
		person.setPer_category(request.getParameter("per_category"));
		person.setIns_number(request.getParameter("ins_number"));
		
		pd.addPerson(person,username);
		response.sendRedirect("admin/person/add_person.jsp");
	}

}
