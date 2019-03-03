package team4.servlet.institution;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.InstitutionDAO;
import team4.entity.Institution;
import team4.factory.InstitutionDAOFactory;

/**
 * Servlet implementation class checkInstitutionId
 */
@WebServlet("/checkInstitutionId")
public class checkInstitutionId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkInstitutionId() {
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
		System.out.println("后台验证医疗机构编号");
		String ins_ID=request.getParameter("ins_ID");
		InstitutionDAO fd = InstitutionDAOFactory.getInstitutionInstance();
		PrintWriter output = response.getWriter();
		Institution f=new Institution();
		f=fd.getInstitutionById(ins_ID);
		if(f==null){
			output.print(true);
		}else{
			System.out.println(f.getName());
			output.print(false);
		}
		
	}

}
