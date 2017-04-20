package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IAddressDao;
import com.lyh.flowers.pojo.Address;
import com.lyh.flowers.service.IAddressService;

@Service("deliveryService")
public class AddressServiceImpl implements IAddressService {
	@Resource
	private IAddressDao addressDao;
	
	@Override
	public void add(Address address) {
		
		addressDao.add(address);
	}

	@Override
	public List<Address> findByUid(String uid) {
		return addressDao.findByUid(uid);
	}

	@Override
	public void delete(String adid) {
		addressDao.delete(adid);
	}

	@Override
	public void update(String adid) {
		addressDao.update(adid);
	}

	@Override
	public Address findByAdid(String adid) {
		return addressDao.findByAdid(adid);
	}

	@Override
	public int findCountByUid(String uid) {
		return addressDao.findCountByUid(uid);
	}

}
