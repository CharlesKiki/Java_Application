package com.bookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.model.ShopCart;

public class ShowCartServlet extends HttpServlet {

	 
	

	  
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request,response);
		
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		HttpSession session = request.getSession();
		ShopCart cart = (ShopCart)session.getAttribute("ShopCart");
		RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
		rd.forward(request,response);
		return;
	
	 
	
	}

}
