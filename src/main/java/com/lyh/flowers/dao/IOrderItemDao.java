package com.lyh.flowers.dao;


import java.util.List;

import com.lyh.flowers.pojo.OrderItem;


public interface IOrderItemDao {
	
	public List<OrderItem> loadOrderItem(String oid);
	public void addOrderItem(String orderItemId,int quantity,double subtotal,String fid,
							String fname,double currPrice,String image_b,String oid);
}