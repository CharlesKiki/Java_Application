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
 * Servlet implementation class updFacilityName
 */
@WebServlet("/updFacilityName")
public class updFacilityName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updFacilityName() {
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
		System.out.println("修改服务设施");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();

		String username=(String) session.getAttribute("adminname");	
		
		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		Facility f=new Facility();

		if(request.getParameter("upd_ser_ID0")!=null){
		f.setSer_ID(request.getParameter("upd_ser_ID0"));
		f.setName(request.getParameter("upd_name0"));
		f.setUsable_range(request.getParameter("upd_usable_range0"));
		f.setNotes(request.getParameter("upd_notes0"));
		fd.updFacility(f,username);	}
		
		if(request.getParameter("upd_ser_ID1")!=null){
		f.setSer_ID(request.getParameter("upd_ser_ID1"));
		f.setName(request.getParameter("upd_name1"));
		f.setUsable_range(request.getParameter("upd_usable_range1"));
		f.setNotes(request.getParameter("upd_notes1"));
		fd.updFacility(f,username);	}
		
		if(request.getParameter("upd_ser_ID2")!=null){
		f.setSer_ID(request.getParameter("upd_ser_ID2"));
		f.setName(request.getParameter("upd_name2"));
		f.setUsable_range(request.getParameter("upd_usable_range2"));
		f.setNotes(request.getParameter("upd_notes2"));
		fd.updFacility(f,username);}
		
		if(request.getParameter("upd_ser_ID3")!=null){
		f.setSer_ID(request.getParameter("upd_ser_ID3"));
		f.setName(request.getParameter("upd_name3"));
		f.setUsable_range(request.getParameter("upd_usable_range3"));
		f.setNotes(request.getParameter("upd_notes3"));
		fd.updFacility(f,username);}
		
		if(request.getParameter("upd_ser_ID4")!=null){
		f.setSer_ID(request.getParameter("upd_ser_ID4"));
		f.setName(request.getParameter("upd_name4"));
		f.setUsable_range(request.getParameter("upd_usable_range4"));
		f.setNotes(request.getParameter("upd_notes4"));
		fd.updFacility(f,username);}

		request.getRequestDispatcher("/admin/facility/search_facility_name.jsp").forward(request, response);	
	}

}

