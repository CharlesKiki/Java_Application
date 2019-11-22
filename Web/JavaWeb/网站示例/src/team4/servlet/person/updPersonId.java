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
 * Servlet implementation class updPersonId
 */
@WebServlet("/updPersonId")
public class updPersonId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updPersonId() {
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
		
		person.setID_number(request.getParameter("upd_ID_number"));
		person.setName(request.getParameter("upd_per_name"));		
		person.setBirthday(request.getParameter("upd_birthday"));	
		person.setSex(request.getParameter("upd_sex"));
		person.setNation(request.getParameter("upd_nation"));
		person.setReg_cha(request.getParameter("upd_reg_cha"));
		person.setReg_pla(request.getParameter("upd_reg_pla"));
		person.setCul_stan(request.getParameter("upd_cul_stan"));
		person.setPol_sta(request.getParameter("upd_pol_sta"));
		person.setMar_sta(request.getParameter("upd_mar_sta"));
		person.setResident_f(request.getParameter("upd_resident_f"));
		person.setDep_number(request.getParameter("upd_dep_number"));
		person.setState(request.getParameter("upd_state"));
		person.setPer_category(request.getParameter("upd_per_category"));
		person.setIns_number(request.getParameter("upd_ins_number"));
		pd.updPerson(person,username);
				
		 if(request.getParameter("upd_ID_number")!=null){
				request.setAttribute("personById", person);
				request.getRequestDispatcher("/admin/person/search_person_id.jsp").forward(request, response);
			}
	}


}
