package team4.servlet.facility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.FacilityDAO;
import team4.factory.FacilityDAOFactory;

/**
 * Servlet implementation class delFacility
 */
@WebServlet("/delFacility")
public class delFacility extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delFacility() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] choose=request.getParameterValues("chooseFacility");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");

		for(String c:choose){
			System.out.println(c);
			FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
			fd.delFacility(c,username);			
		}
		response.sendRedirect("admin/facility/search_facility.jsp");
		
}

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
}
