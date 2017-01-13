package com.lyh.flowers.service;


import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;

public interface IFlowerService {
	public void delete(String fid);
	public void edit(Flower flower);
	public Flower findByFid(String fid);
	public int findFlowerCountByCategory(String cid);
	
	public PageBean<Flower> findByCategory(String cid, int pc);


}
