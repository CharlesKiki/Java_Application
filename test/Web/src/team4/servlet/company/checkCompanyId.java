package team4.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.CompanyDAO;
import team4.entity.Company;
import team4.factory.CompanyDAOFactory;

/**
 * Servlet implementation class checkCompanyId
 */
@WebServlet("/checkCompanyId")
public class checkCompanyId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkCompanyId() {
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
		System.out.println("后台验证单位编号");
		String con_ID=request.getParameter("con_ID");
		CompanyDAO cd = CompanyDAOFactory.getCompanyInstance();
		PrintWriter output = response.getWriter();
		Company c=new Company();
		c=cd.getCompanyById(con_ID);
		if(c==null){
			output.print(true);
		}else{
			System.out.println(c.getName());
			output.print(false);
		}
		
	}

}
