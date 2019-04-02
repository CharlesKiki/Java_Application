package team4.servlet.log;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class searchLog
 */
@WebServlet("/searchLog")
public class searchLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selected = request.getParameter("selectLog");
		String from = request.getParameter("fromtime");
		String to = request.getParameter("totime");
		String selectedContext = request.getParameter("contextLog");

		HttpSession session = request.getSession();

		if ("allLog".equals(selected) && from == "" && to == "") {
			session.setAttribute("from", from);
			session.setAttribute("to", to);
			response.sendRedirect("admin/log/log.jsp");
		} else {			
			if ("allLog".equals(selected) && from != "" && to == "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", "");
				session.setAttribute("condition", from);
				request.getRequestDispatcher("admin/log/search_log_day.jsp").forward(
						request, response);	
				
			} else if ("allLog".equals(selected) && from == "" && to != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", "");
				session.setAttribute("condition", to);
				request.getRequestDispatcher("admin/log/search_log_day.jsp").forward(
						request, response);
				
			} else if ("allLog".equals(selected) && from != "" && to != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", "");
				request.getRequestDispatcher("admin/log/search_log_fromto.jsp").forward(
						request, response);	
				
			} else if ("LogUser".equals(selected) && from == "" && to == ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				request.getRequestDispatcher("admin/log/search_log_user.jsp").forward(
						request, response);	
				
			} else if ("LogUser".equals(selected) && from != "" && to == ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				session.setAttribute("time", from);
				request.getRequestDispatcher("admin/log/search_log_user_day.jsp").forward(
						request, response);	
				
			} else if ("LogUser".equals(selected) && from == "" && to != ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				session.setAttribute("time", to);
				request.getRequestDispatcher("admin/log/search_log_user_day.jsp").forward(
						request, response);	
				
				
			} else if ("LogUser".equals(selected) && from != "" && to != ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				request.getRequestDispatcher("admin/log/search_log_user_fromto.jsp").forward(
						request, response);	
				
				
			} else if ("LogAction".equals(selected) && from == "" && to == ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				request.getRequestDispatcher("admin/log/search_log_action.jsp").forward(
						request, response);
				
				
			} else if ("LogAction".equals(selected) && from != "" && to == ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				session.setAttribute("time", from);
				request.getRequestDispatcher("admin/log/search_log_action_day.jsp").forward(
						request, response);
				
				
			}else if ("LogAction".equals(selected) && from == "" && to != ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				session.setAttribute("time", to);
				request.getRequestDispatcher("admin/log/search_log_action_day.jsp").forward(
						request, response);
				
				
			}else if ("LogAction".equals(selected) && from != "" && to != ""
					&& selectedContext != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("selectedContext", selectedContext);
				session.setAttribute("condition", selectedContext);
				request.getRequestDispatcher("admin/log/search_log_action_fromto.jsp").forward(
						request, response);	
				
				
			}else if ("LogTime".equals(selected) && from == "" && to != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("condition", to);
				request.getRequestDispatcher("admin/log/log_day.jsp").forward(
						request, response);	
				
			} else if ("LogTime".equals(selected) && from != "" && to == "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				session.setAttribute("condition", from);
				request.getRequestDispatcher("admin/log/log_day.jsp").forward(
						request, response);	
				
				
			} else if ("LogTime".equals(selected) && from != "" && to != "") {
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				request.getRequestDispatcher("admin/log/log_fromto.jsp").forward(
						request, response);	
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
