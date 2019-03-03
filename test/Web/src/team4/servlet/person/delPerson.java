package team4.servlet.person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.PersonDAO;
import team4.factory.PersonDAOFactory;

/**
 * Servlet implementation class delPerson
 */
@WebServlet("/delPerson")
public class delPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] choose=request.getParameterValues("choosePerson");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");

		for(String c:choose){
			System.out.println(c);
			PersonDAO pd = PersonDAOFactory.getPersonInstance();
			pd.delPerson(c,username);			
		}
		response.sendRedirect("admin/person/search_person.jsp");
		
}

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
}
