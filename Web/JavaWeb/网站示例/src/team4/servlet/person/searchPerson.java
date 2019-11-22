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
 * Servlet implementation class searchPerson
 */
@WebServlet("/searchPerson")
public class searchPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selected=request.getParameter("selectPerson");
		String selectedContext=request.getParameter("contextPerson");
		
		HttpSession session=request.getSession();
		
		PersonDAO pd = PersonDAOFactory.getPersonInstance();
		Person p=new Person();
		if("allPerson".equals(selected)){
			response.sendRedirect("admin/search_person.jsp");
		}else if("personId".equals(selected)&&selectedContext!=null){			
			p=pd.getPersonById(selectedContext);
			session.setAttribute("selectedContext", selectedContext);
			request.setAttribute("personById", p);
			request.getRequestDispatcher("/admin/person/search_person_id.jsp").forward(request, response);
		}else if("personName".equals(selected)&&selectedContext!=null){
			session.setAttribute("selectedContext", selectedContext);
			request.getRequestDispatcher("/admin/person/search_person_name.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
