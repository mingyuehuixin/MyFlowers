package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.Category;



public interface ICategoryDao {
	List<Category> findAll();
//	List<Category> findParents();
	List<Category> findByParent(String pid);
	
	void add(String cid,String cname,String pid,String cdesc);
	Category load(String cid);
	void edit(String cid,String cname,String pid,String cdesc );
	int findChildrenCountByParent(String pid);
		
	void delete(String cid);
}