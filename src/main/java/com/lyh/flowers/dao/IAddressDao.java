package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.Address;


public interface IAddressDao {
	public void add(Address adress);
	public List<Address> findByUid(String uid);
	public Address findByAdid(String adid);
	
	public void delete(String did);
	public void update(String did);
	
	public int findCountByUid(String uid);

}