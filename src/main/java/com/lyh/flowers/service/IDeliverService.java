package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.DeliveryMsg;

public interface IDeliverService {
	public void add(DeliveryMsg delivermsg);
	public List<DeliveryMsg> findByUid(String uid);
	public void delete(String did);
	public void update(String did);
}
