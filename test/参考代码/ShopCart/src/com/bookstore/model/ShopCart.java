package com.bookstore.model;

import java.util.ArrayList;
import java.util.List;

public class ShopCart {
	private List<OrderItem> cart = new ArrayList();
	public void add(String isbn,int nums){
		OrderItem item = new OrderItem(isbn,nums);
		cart.add(item);
	}
	public List<OrderItem> getCart(){
		return  cart;
	}
	
}
 