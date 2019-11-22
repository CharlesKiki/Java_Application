package team4.servlet.facility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.FacilityDAO;
import team4.entity.Facility;
import team4.factory.FacilityDAOFactory;

/**
 * Servlet implementation class checkFacilityId
 */
@WebServlet("/checkFacilityId")
public class checkFacilityId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkFacilityId() {
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
		System.out.println("后台验证服务设施编号");
		String ser_ID=request.getParameter("ser_ID");
		FacilityDAO fd = FacilityDAOFactory.getFacilityInstance();
		PrintWriter output = response.getWriter();
		Facility f=new Facility();
		f=fd.getFacilityById(ser_ID);
		if(f==null){
			output.print(true);
		}else{
			System.out.println(f.getName());
			output.print(false);
		}
		
	}

}
