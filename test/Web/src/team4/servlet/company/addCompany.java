package team4.servlet.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.CompanyDAO;
import team4.entity.Company;
import team4.factory.CompanyDAOFactory;

/**
 * Servlet implementation class addCompany
 */
@WebServlet("/addCompany")
public class addCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCompany() {
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
		System.out.println("增加单位信息");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		Company c=new Company();
		c.setCon_ID(request.getParameter("con_ID"));
		c.setName(request.getParameter("name"));
		c.setAddress(request.getParameter("address"));
		c.setContact(request.getParameter("contact"));
		c.setPostcode(request.getParameter("postcode"));
		
		CompanyDAO cd = CompanyDAOFactory.getCompanyInstance();
		cd.addCompany(c,username);	
		response.sendRedirect("admin/company/add_company.jsp");
	}

}
