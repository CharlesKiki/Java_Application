package team4.servlet.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.CompanyDAO;
import team4.factory.CompanyDAOFactory;

/**
 * Servlet implementation class delCompany
 */
@WebServlet("/delCompany")
public class delCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String[] choose=request.getParameterValues("chooseCompany");
        System.out.println(request.getParameterValues("chooseCompany"));
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");

		for(String c:choose){
			System.out.println(c);
			CompanyDAO cd = CompanyDAOFactory.getCompanyInstance();
			cd.delCompany(c,username);			
		}
		response.sendRedirect("admin/company/search_company.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
