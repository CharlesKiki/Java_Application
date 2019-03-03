package team4.servlet.drug;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.dao.DrugDAO;
import team4.entity.Drug;
import team4.factory.DrugDAOFactory;

/**
 * Servlet implementation class addDrug
 */
@WebServlet("/addDrug")
public class addDrug extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDrug() {
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
		System.out.println("Ôö¼ÓÒ©Æ·");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("adminname");
		
		Drug f=new Drug();
		f.setDrug_ID(request.getParameter("drug_ID"));
		f.setName_ch(request.getParameter("name_ch"));
		f.setName_en(request.getParameter("name_en"));
		f.setFlag(request.getParameter("flag"));
		f.setLevel(request.getParameter("level"));
		f.setIns_level(request.getParameter("ins_level"));
		f.setHos_level(request.getParameter("hos_level"));
		f.setApp_flag(request.getParameter("app_flag"));
		f.setMax_price(request.getParameter("max_price"));
		f.setForm(request.getParameter("form"));
		f.setMeasure(request.getParameter("measure"));
		f.setUsage(request.getParameter("usage"));
		f.setTimes(request.getParameter("times"));
		f.setStandard(request.getParameter("standard"));
		f.setDays(request.getParameter("days"));
		f.setDrug_factory(request.getParameter("drug_factory"));
		f.setState(request.getParameter("state"));
		f.setUsable_range(request.getParameter("usable_range"));
		f.setNational_coding(request.getParameter("national_coding"));
		f.setOrigin(request.getParameter("origin"));
		f.setNotes(request.getParameter("notes"));
		
		DrugDAO fd = DrugDAOFactory.getDrugInstance();
		fd.addDrug(f,username);	
		response.sendRedirect("admin/drug/add_drug.jsp");
	}
}