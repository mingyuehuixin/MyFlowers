package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.Comments;



public interface ICommentsDao {
	public void add(Comments comment);
	public List<Comments> findByFid(String fid);
//	public Address findByAdid(String adid);
//	
//	public void delete(String did);
//	public void update(Address address);
//	
//	public int findCountByUid(String uid);

}