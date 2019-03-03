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
 * Servlet implementation class searchFacility
 */
@WebServlet("/searchFacility")
public class searchFacility extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchFacility() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selected=request.getParameter("selectFacility");
		String selectedContext=request.getParameter("contextFacility");
		
		HttpSession session=request.getSession();
		
		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		Facility f=new Facility();
		if("allFacility".equals(selected)){
			response.sendRedirect("admin/facility/search_facility.jsp");
		}else if("facilityId".equals(selected)&&selectedContext!=null){			
			f=fd.getFacilityById(selectedContext);
			session.setAttribute("selectedContext", selectedContext);
			request.setAttribute("facilityById", f);
			request.getRequestDispatcher("/admin/facility/search_facility_id.jsp").forward(request, response);
		}else if("facilityName".equals(selected)&&selectedContext!=null){
			session.setAttribute("selectedContext", selectedContext);
			request.getRequestDispatcher("/admin/facility/search_facility_name.jsp").forward(request, response);
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
