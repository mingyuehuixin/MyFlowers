package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Address;



public interface IAddressService {

	public void add(Address adress);
	
	public List<Address> findByUid(String uid);
	public Address findByAdid(String adid);
	
	public void delete(String adid);
	public void update(String adid);
	
	public int findCountByUid(String uid);
}
