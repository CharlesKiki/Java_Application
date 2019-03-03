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
 * Servlet implementation class updCompany
 */
@WebServlet("/updCompany")
public class updCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updCompany() {
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
		
		
		
		System.out.println(request.getParameter("upd_con_ID0"));
		System.out.println(request.getParameter("upd_con_ID1"));
		System.out.println(request.getParameter("upd_con_ID2"));
		System.out.println(request.getParameter("upd_con_ID3"));
		System.out.println(request.getParameter("upd_con_ID4"));
		System.out.println(request.getParameter("upd_con_ID5"));
		
		if(request.getParameter("upd_con_ID0")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID0"));
			c.setName(request.getParameter("upd_name0"));
			c.setAddress(request.getParameter("upd_address0"));
			c.setContact(request.getParameter("upd_contact0"));
			c.setPostcode(request.getParameter("upd_postcode0"));
			cd.updCompany(c, username);
		}
		
		if(request.getParameter("upd_con_ID1")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID1"));
			c.setName(request.getParameter("upd_name1"));
			c.setAddress(request.getParameter("upd_address1"));
			c.setContact(request.getParameter("upd_contact1"));
			c.setPostcode(request.getParameter("upd_postcode1"));
			cd.updCompany(c, username);
		}
		
		if(request.getParameter("upd_con_ID2")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID2"));
			c.setName(request.getParameter("upd_name2"));
			c.setAddress(request.getParameter("upd_address2"));
			c.setContact(request.getParameter("upd_contact2"));
			c.setPostcode(request.getParameter("upd_postcode2"));
			cd.updCompany(c, username);
		}
		
		if(request.getParameter("upd_con_ID3")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID3"));
			c.setName(request.getParameter("upd_name3"));
			c.setAddress(request.getParameter("upd_address3"));
			c.setContact(request.getParameter("upd_contact3"));
			c.setPostcode(request.getParameter("upd_postcode3"));
			cd.updCompany(c, username);
		}
		
		if(request.getParameter("upd_con_ID4")!=null){
			c.setCon_ID(request.getParameter("upd_con_ID4"));
			c.setName(request.getParameter("upd_name4"));
			c.setAddress(request.getParameter("upd_address4"));
			c.setContact(request.getParameter("upd_contact4"));
			c.setPostcode(request.getParameter("upd_postcode5"));
			cd.updCompany(c, username);
		}
		
		response.sendRedirect("admin/company/search_company.jsp");
	}

}
