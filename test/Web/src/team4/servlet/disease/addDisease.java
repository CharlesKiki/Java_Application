package team4.servlet.disease;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.DiseaseDAO;
import team4.entity.Disease;
import team4.factory.DiseaseDAOFactory;

/**
 * Servlet implementation class addDisease
 */
@WebServlet("/addDisease")
public class addDisease extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDisease() {
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
		System.out.println("Ôö¼Ó²¡ÖÖ");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		Disease f=new Disease();
		f.setDis_ID(request.getParameter("dis_ID"));
		f.setName(request.getParameter("name"));
		f.setFlag(request.getParameter("flag"));
		f.setNotes(request.getParameter("notes"));
		DiseaseDAO fd = DiseaseDAOFactory.getDiseaseInstance();
		fd.addDisease(f,username);	
		response.sendRedirect("admin/disease/add_disease.jsp");
	}








}
