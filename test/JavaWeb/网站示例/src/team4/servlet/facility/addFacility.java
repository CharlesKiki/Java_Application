package team4.servlet.facility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.FacilityDAO;
import team4.entity.Facility;
import team4.factory.FacilityDAOFactory;

/**
 * Servlet implementation class addFacility
 */
@WebServlet("/addFacility")
public class addFacility extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFacility() {
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
		System.out.println("增加服务设施");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		Facility f=new Facility();
		f.setSer_ID(request.getParameter("ser_ID"));
		f.setName(request.getParameter("name"));
		f.setUsable_range(request.getParameter("usable_range"));
		f.setNotes(request.getParameter("notes"));
		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		fd.addFacility(f,username);	
		response.sendRedirect("admin/facility/add_facility.jsp");
	}

}
