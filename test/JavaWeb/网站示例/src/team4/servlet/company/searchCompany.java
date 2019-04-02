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
 * Servlet implementation class searchCompany
 */
@WebServlet("/searchCompany")
public class searchCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selected=request.getParameter("selectCompany");
		String selectedContext=request.getParameter("contextCompany");
		
		HttpSession session=request.getSession();
		
		CompanyDAO cd = CompanyDAOFactory.getCompanyInstance();
		Company c=new Company();
		if("allCompany".equals(selected)){
			response.sendRedirect("admin/company/search_company.jsp");
		}else if("companyId".equals(selected)&&selectedContext!=null){			
			c=cd.getCompanyById(selectedContext);
			session.setAttribute("selectedContext", selectedContext);
			request.setAttribute("companyById", c);
			request.getRequestDispatcher("/admin/company/search_company_id.jsp").forward(request, response);
		}else if("companyName".equals(selected)&&selectedContext!=null){
			session.setAttribute("selectedContext", selectedContext);
			request.getRequestDispatcher("/admin/company/search_company_name.jsp").forward(request, response);
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
