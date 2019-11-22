package com.bookstore.model;

public class Book {
	String isbn;
	String catalogid;
	String title;
	String pubDate;
	String author;
	float price;

	public Book(String isbn, String catalogid, String title, String pubDate,
			String author, float price) {
		super();
		this.isbn = isbn;
		this.catalogid = catalogid;
		this.title = title;
		this.pubDate = pubDate;
		this.author = author;
		this.price = price;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(String catalogid) {
		this.catalogid = catalogid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
}
