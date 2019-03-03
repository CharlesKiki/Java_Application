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
 * Servlet implementation class updCcompanyId
 */
@WebServlet("/updCompanyId")
public class updCompanyId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updCompanyId() {
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
		
		System.out.println("修改单位信息");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();

		String username=(String) session.getAttribute("adminname");
		
		CompanyDAO cd=CompanyDAOFactory.getCompanyInstance();
		Company c=new Company();
		
		if(request.getParameter("upd_con_ID6")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID6"));
			c.setName(request.getParameter("upd_name6"));
			c.setAddress(request.getParameter("upd_address6"));
			c.setContact(request.getParameter("upd_contact6"));
			c.setPostcode(request.getParameter("upd_postcode6"));
			cd.updCompany(c, username);
		}
		
		if(request.getParameter("upd_con_ID6")!=null){
			request.setAttribute("companyById", c);
			request.getRequestDispatcher("/admin/company/search_company_id.jsp").forward(request, response);
		}
	}

}
