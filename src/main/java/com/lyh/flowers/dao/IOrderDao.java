package com.lyh.flowers.dao;


import java.util.List;

import com.lyh.flowers.pojo.Order;

public interface IOrderDao {
	public int findStatus(String oid);
	public void updateStatus(String oid, int status);
	public Order load(String oid);
	public void add(Order order);
	public int findCount(String uid);
	public List<Order> findByUser(String uid, int start,int limit);
	public int findAllCount();
	
	public int findCountByStatus(int status);
	
	public List<Order> findByStatus(int status,int start,int limit);
	public List<Order> findAll(int start,int limit);
}