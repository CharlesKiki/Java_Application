package com.bookstore.model;

public class BookCatalog {
	String id;
	String title;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BookCatalog(String id, String title) {
		super();
		this.id = id;
		this.title = title;
	}

}
