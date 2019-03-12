package com.bookstore.servlet;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.bookstore.model.BookCatalog;
import com.bookstore.model.BookStore;

public class InitServlet extends HttpServlet {
	
    private BookStore bookStore;
    private List<BookCatalog> catalogs;
    

	public void init() throws ServletException {
		bookStore = BookStore.getInstance();
		this.getServletContext().setAttribute("bookStore", bookStore);
		catalogs = BookStore.getInstance().getBookCatalog();
		this.getServletContext().setAttribute("catalogs",catalogs);

	 
	
	 
	}

}
