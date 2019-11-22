package team4.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.dao.UserDao;
import team4.entity.User;
import team4.factory.UserDAOFactory;

/**
 * Servlet implementation class checkPassword
 */
@WebServlet("/checkPassword")
public class checkPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkPassword() {
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
		// TODO Auto-generated method stub
				System.out.println("后台验证登录密码");
				String name=request.getParameter("username");
				String pass=request.getParameter("password");
				String flag=request.getParameter("radiobutton");
				System.out.println(flag);
				UserDao ud=UserDAOFactory.getUserInstance();
				PrintWriter output = response.getWriter();
				User u=new User();
				u=ud.getUserByName(name);
				if(u==null){
					output.print(false);
				}else if(u.getPassword().equals(pass)&&u.getFlag().equals(flag)){	
					System.out.println("验证成功");
					output.print(true);
				}else{
					output.print(false);
				}
	}

}
