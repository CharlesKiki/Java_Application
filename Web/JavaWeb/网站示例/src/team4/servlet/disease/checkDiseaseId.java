package team4.servlet.disease;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.DiseaseDAO;
import team4.entity.Disease;
import team4.factory.DiseaseDAOFactory;

/**
 * Servlet implementation class checkDiseaseId
 */
@WebServlet("/checkDiseaseId")
public class checkDiseaseId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkDiseaseId() {
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
		System.out.println("后台验证病种编号");
		String dis_ID=request.getParameter("dis_ID");
		DiseaseDAO fd = DiseaseDAOFactory.getDiseaseInstance();
		PrintWriter output = response.getWriter();
		Disease f=new Disease();
		f=fd.getDiseaseById(dis_ID);
		if(f==null){
			output.print(true);
		}else{
			System.out.println(f.getName());
			output.print(false);
		}
		
	}

}
