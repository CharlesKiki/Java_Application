package com.bookstore.model;

public class OrderItem {
	Book book;
	int nums;
	private float sum;
	public OrderItem(String isbn, int nums) {
		super();
		this.book = BookStore.getInstance().getBook(isbn);
		this.nums = nums;
		sum=this.nums*book.getPrice() ;
	}
	 
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public float getSum() {
		return sum;
	}
	public void setSum(float sum) {
		this.sum = sum;
	}
	 

}
