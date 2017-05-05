package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Comments;



public interface ICommentsService {

	public void save(Comments comment);
//	
	public List<Comments> findByFid(String fid);
//	public Address findByAdid(String adid);
//	
//	public void delete(String adid);
//	public void update(Address address);
//	
//	public int findCountByUid(String uid);
}
