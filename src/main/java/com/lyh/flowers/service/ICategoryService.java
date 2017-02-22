package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Category;

public interface ICategoryService {

	List<Category> findAll();
	List<Category> findParents();
	List<Category> findChildren(String pid);
	
	void add(Category category);
	Category load(String cid);
	void edit(Category category);
	int findChildrenCountByParent(String pid);
	void delete(String cid);
}
