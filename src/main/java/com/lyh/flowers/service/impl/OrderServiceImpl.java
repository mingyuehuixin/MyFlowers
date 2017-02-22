package com.lyh.flowers.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IOrderDao;
import com.lyh.flowers.dao.IOrderItemDao;
import com.lyh.flowers.pojo.Order;
import com.lyh.flowers.pojo.OrderItem;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.IOrderService;


@Service("orderService")
public class OrderServiceImpl implements IOrderService {
	@Resource
	private IOrderDao orderDao;
	@Resource
	private IOrderItemDao orderItemDao;
	
	@Override
	public PageBean<Order> myOrders(String uid, int pc) {
		
		int count=orderDao.findCount(uid);//鲜花总记录数
		int ps=5;
		List<Order> orders = orderDao.findByUser(uid, (pc-1)*ps,ps);
		
		for(Order order:orders){
			List<OrderItem> orderItems=orderItemDao.loadOrderItem(order.getOid());
			order.setOrderItemList(orderItems);
		}
		
		PageBean<Order> pb = new PageBean<Order>();
		
		pb.setBeanList(orders);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		return pb;
	}

	@Override
	public Order load(String oid) {
		Order order=orderDao.load(oid);
		List<OrderItem> orderItem=orderItemDao.loadOrderItem(oid);
		order.setOrderItemList(orderItem);
		return order;
	}
	
	/**
	 * 返回一个不重复的字符串
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

	@Override
	public void createOrder(Order order) {
		
//		orderDao.add(order.getOid(), order.getOrdertime(), order.getTotal(), order.getStatus(), order.getAddress(), order.getOwner().getUid());
		orderDao.add(order);
	}

	@Override
	public void addOrderItem(List<OrderItem> orderItems) {
		for(OrderItem orderItem:orderItems){
		orderItemDao.addOrderItem(orderItem.getOrderItemId(), orderItem.getQuantity(), orderItem.getSubtotal(),
				orderItem.getFlower().getFid(), orderItem.getFlower().getFname(), orderItem.getFlower().getCurrPrice(),
				orderItem.getFlower().getImage_b(), orderItem.getOrder().getOid());
		}
	}

	@Override
	public int findStatus(String oid) {
		return orderDao.findStatus(oid);
	}

	@Override
	public void updateStatus(String oid, int status) {
		orderDao.updateStatus(oid, status);
	}

	@Override
	public PageBean<Order> findAll(int pc) {
		int count=orderDao.findAllCount();//鲜花总记录数
		int ps=5;
		List<Order> orders = orderDao.findAll((pc-1)*ps,ps);
		
		for(Order order:orders){
			List<OrderItem> orderItems=orderItemDao.loadOrderItem(order.getOid());
			order.setOrderItemList(orderItems);
		}
		
		PageBean<Order> pb = new PageBean<Order>();
		
		pb.setBeanList(orders);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		return pb;
	}

	@Override
	public PageBean<Order> findByStatus(int status, int pc) {
		int count=orderDao.findCountByStatus(status);//鲜花总记录数
		int ps=5;
		List<Order> orders = orderDao.findByStatus(status,(pc-1)*ps,ps);
		
		for(Order order:orders){
			List<OrderItem> orderItems=orderItemDao.loadOrderItem(order.getOid());
			order.setOrderItemList(orderItems);
		}
		
		PageBean<Order> pb = new PageBean<Order>();
		
		pb.setBeanList(orders);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		return pb;
	}
	
}
