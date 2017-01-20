package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.CartItem;


public interface ICartService {
	public List<CartItem> myCart(String uid);
	public void delete(String cartItem);
	public CartItem updateQuantity(String cartItemId, String quantity);//修改数量
	public CartItem loadCartItem(String cartItemId);
	public void addCartItem(CartItem cartItem);
	
}
