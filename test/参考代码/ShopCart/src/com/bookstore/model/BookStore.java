package com.bookstore.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class BookStore {

	private static Map<String, List<Book>> books = new HashMap();
	private static List<BookCatalog> catalogs = new ArrayList();
	private static Map<String, Book> bookCache = new HashMap();
	private static BookStore bookStore;
	static {
		catalogs.add(new BookCatalog("image", "图形图像处理"));
		books.put("image", new ArrayList());
		catalogs.add(new BookCatalog("programme", "程序设计"));
		books.put("programme", new ArrayList());
		catalogs.add(new BookCatalog("se", "软件工程"));
		books.put("se", new ArrayList());
		catalogs.add(new BookCatalog("network", "网络与互联网"));
		books.put("network", new ArrayList());

	}

	private BookStore(String bookfileName) {
		super();
		Scanner sc = new Scanner(BookStore.class.getResourceAsStream(bookfileName));
		while (sc.hasNextLine()) {
			String info = sc.nextLine();
			String[] bookInfo = info.split(",");
			Book book = new Book(bookInfo[0], bookInfo[1], bookInfo[2],bookInfo[3], bookInfo[4], Float.parseFloat(bookInfo[5]));
			List<Book> bookList = books.get(book.getCatalogid());
			bookCache.put(book.getIsbn(),book);
			bookList.add(book);
		}
	}
	public static BookStore getInstance(){
		if(bookStore == null){
			bookStore = new BookStore ("book.txt");
		}
		return bookStore;
	}
	public List<BookCatalog> getBookCatalog(){
		return catalogs;
	}
	public List<Book> getBooks(String catalogid){
		return books.get(catalogid);
	}
	public Book getBook(String isbn){
		return bookCache.get(isbn);
	}
	public static void main(String[] args){
		BookStore bs = BookStore.getInstance();
	}
}
