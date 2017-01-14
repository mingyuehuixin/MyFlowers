package com.lyh.flowers.service;


import java.util.List;

import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;

public interface IFlowerService {
	public void delete(String fid);
	public void edit(Flower flower);
	public Flower findByFid(String fid);
	public int findFlowerCountByCategory(String cid);
	
	public PageBean<Flower> findByCategory(String cid, int pc);
	
//	public List<Flower> findByType(String price,String material,String target,
//			String branchnumber,String flowercolor,String using,String type,
//			int start,int limit);
	public PageBean<Flower> findByType(String pid,String cname,String cid,int pc);

}
