package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Order;
import com.lyh.flowers.pojo.OrderItem;
import com.lyh.flowers.pojo.PageBean;



public interface IOrderService {

	public PageBean<Order> myOrders(String uid, int pc);
	
	public PageBean<Order> findAll(int pc);
	
	public Order load(String oid);
	public void createOrder(Order order);
	public void addOrderItem(List<OrderItem> orderItems);
	public int findStatus(String oid);
	
	public PageBean<Order> findByStatus(int status,int pc);
	
	public void updateStatus(String oid, int status);
	
	public void updatStatusByItem(String orderItemId,String status);
}
