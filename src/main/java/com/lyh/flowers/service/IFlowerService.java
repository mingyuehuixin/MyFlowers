package com.lyh.flowers.service;



import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;

public interface IFlowerService {
	public void delete(String fid);
	public void edit(Flower flower);
	public Flower findByFid(String fid);
	public int findFlowerCountByCategory(String cid);
	public int findCommentsCount(String fid);
	
	public PageBean<Flower> findByCategory(String cid, int pc);
	
	public void add(Flower flower);
	public PageBean<Flower> findByType(String pid,String cname,String cid,int pc);
	public PageBean<Flower> seachByKeyWord(String keyword,int pc);
}
