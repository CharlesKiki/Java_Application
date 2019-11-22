package com.bookstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.model.Book;
import com.bookstore.model.BookStore;

public class ShowBooksServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        String catalogid = request.getParameter("catalogid");
        HttpSession session = request.getSession();
        if(catalogid != null){
        	List<Book> books= BookStore.getInstance().getBooks(catalogid);
        	session.setAttribute("books", books);
        	session.setAttribute("catalogid",catalogid);
    }else{
    	session.removeAttribute("books");
    	}
        RequestDispatcher rd = request.getRequestDispatcher("/bookList.jsp");
        rd.forward(request, response);
        return;
    }

	
}
