package com.lyh.flowers.dao;


import java.util.List;

import com.lyh.flowers.pojo.Flower;



public interface IFlowerDao {
	public void delete(String fid);
	public void edit(Flower flower);
	public Flower findByFid(String fid);
	public int findFlowerCountByCategory(String cid);
	
	public List<Flower>findByPrice(int minprice,int maxprice,int start,int limit);
	public List<Flower> findByCategory(String cid,int start,int limit);
	
	public List<Flower> findByType(String material,String target,
			String branchnumber,String flowercolor,String makeuse,String type,int start,int limit);
	
}