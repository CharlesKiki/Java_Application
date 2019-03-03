package team4.servlet.institution;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.InstitutionDAO;
import team4.entity.Institution;
import team4.factory.InstitutionDAOFactory;

/**
 * Servlet implementation class addInstitution
 */
@WebServlet("/addInstitution")
public class addInstitution extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addInstitution() {
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
		System.out.println("增加医疗机构");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		Institution f=new Institution();
		f.setIns_ID(request.getParameter("ins_ID"));
		f.setName(request.getParameter("name"));
		f.setLevel(request.getParameter("level"));
		f.setPostcode(request.getParameter("postcode"));
		f.setLegal_person_name(request.getParameter("legal_person_name"));
		f.setLegal_person_contact(request.getParameter("legal_person_contact"));
		f.setContact_name(request.getParameter("contact_name"));
		f.setContact(request.getParameter("contact"));
		f.setAddress(request.getParameter("address"));
		f.setNotes(request.getParameter("notes"));
		InstitutionDAO fd = InstitutionDAOFactory.getInstitutionInstance();
		fd.addInstitution(f,username);	
		response.sendRedirect("admin/institution/add_institution.jsp");
	}

}
