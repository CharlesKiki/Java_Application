package team4.servlet.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.PersonDAO;
import team4.entity.Person;
import team4.factory.PersonDAOFactory;

/**
 * Servlet implementation class checkPersonId
 */
@WebServlet("/checkPersonId")
public class checkPersonId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkPersonId() {
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
		System.out.println("后台验证身份证编号");
		String ser_ID=request.getParameter("ID_number");
		PersonDAO fd = PersonDAOFactory.getPersonInstance();
		PrintWriter output = response.getWriter();
		Person p=new Person();
		p=fd.getPersonById(ser_ID);
		if(p==null){
			output.print(true);
		}else{
			System.out.println(p.getName());
			output.print(false);
		}
	}

}
