package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IDeliveryMsgDao;
import com.lyh.flowers.pojo.DeliveryMsg;
import com.lyh.flowers.service.IDeliverService;

@Service("deliveryService")
public class DeliveryServiceImpl implements IDeliverService {
	@Resource
	private IDeliveryMsgDao deliveryDao;
	
	@Override
	public void add(DeliveryMsg delivermsg) {
		
		deliveryDao.add(delivermsg);
	}

	@Override
	public List<DeliveryMsg> findByUid(String uid) {
		return deliveryDao.findByUid(uid);
	}

	@Override
	public void delete(String did) {
		deliveryDao.delete(did);
	}

	@Override
	public void update(String did) {
		deliveryDao.update(did);
	}

}
