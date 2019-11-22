package com.bookstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.model.ShopCart;

public class NewOrderServlet extends HttpServlet {

 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
 
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] isbns = request.getParameterValues("isbn");
		int nums = 1;
		HttpSession session = request.getSession();
		ShopCart cart = (ShopCart)session.getAttribute("ShopCart");
		if(cart == null){
			cart = new ShopCart();
			System.out.println("======creat a shopcart:");
			session.setAttribute("shopCart", cart);
		}
		if(isbns != null){
			for(String isbn:isbns){
				System.out.println("=======add to shopcart:");
				cart.add(isbn, nums);
			}
		}
		response.sendRedirect(this.getServletContext().getContextPath()+"/cart.jsp");
 
	
 
		 
	}

}
