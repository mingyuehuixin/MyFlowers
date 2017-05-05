package com.lyh.flowers.dao;


import java.util.List;

import com.lyh.flowers.pojo.Flower;



public interface IFlowerDao {
	public void delete(String fid);
	
	public void edit(Flower flower);
	public int findCommentsCount(String fid);
	
	public Flower findByFid(String fid);
	public int findFlowerCountByCategory(String cid);
	public int findCount(String material,String fname,String makeuse);
	public void add(String fid,String fname,String material,Double price,Double currPrice,Double discount,String flowersaying,
			String packing,String target,int branchnumber,String flowercolor,String type,String makeuse,String cid,String image_w,String image_b);
	
	public List<Flower>findByPrice(int minprice,int maxprice,int start,int limit);
	public List<Flower> findByCategory(String cid,int start,int limit);
	
	public List<Flower> findByType(String material,String target,
			String branchnumber,String flowercolor,String makeuse,String type,int start,int limit);
	
	public List<Flower> findBySeachKey(String material,String fname,String makeuse,int start,int limit);
}