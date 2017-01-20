package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.CartItem;


public interface ICartItemDao {
	public CartItem loadCartItem(String cartItemId);
	public CartItem findByCartItemId(String cartItemId);
	public void delete(String cartItemId);//删除
	public CartItem findByUidAndFid(String uid, String fid);//查询某个用户的某束花的购物车条目是否存在
	public void updateQuantity(String cartItemId, String quantity);
	public List<CartItem> findByUser(String uid);
	public void addCartItem(String cartItemId,String quantity,String fid,String uid );
}