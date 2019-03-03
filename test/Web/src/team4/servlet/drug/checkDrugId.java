package team4.servlet.drug;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.DrugDAO;
import team4.entity.Drug;
import team4.factory.DrugDAOFactory;

/**
 * Servlet implementation class checkDrugId
 */
@WebServlet("/checkDrugId")
public class checkDrugId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkDrugId() {
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
		System.out.println("后台验证服务设施编号");
		String drug_ID=request.getParameter("drug_ID");
		DrugDAO fd = DrugDAOFactory.getDrugInstance();
		PrintWriter output = response.getWriter();
		Drug f=new Drug();
		f=fd.getDrugById(drug_ID);
		if(f==null){
			output.print(true);
		}else{
			System.out.println(f.getName_ch());
			output.print(false);
		}
		
	}

}
