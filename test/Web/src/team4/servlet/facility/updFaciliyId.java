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
 * Servlet implementation class updFaciliy
 */
@WebServlet("/updFaciliyId")
public class updFaciliyId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updFaciliyId() {
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
		System.out.println("编号搜索修改服务设施");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
				
				
		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		Facility f=new Facility();
		f.setSer_ID(request.getParameter("upd_ser_ID6"));
		f.setName(request.getParameter("upd_name6"));
		f.setUsable_range(request.getParameter("upd_usable_range6"));
		f.setNotes(request.getParameter("upd_notes6"));
		fd.updFacility(f,username);
		
	// if(request.getParameter("upd_ser_ID6")!=null)
	 {
			request.setAttribute("facilityById", f);
			request.getRequestDispatcher("/admin/facility/search_facility_id.jsp").forward(request, response);
		}
		
	}

}
