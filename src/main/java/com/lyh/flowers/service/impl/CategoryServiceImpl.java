package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



import com.lyh.flowers.dao.ICategoryDao;
import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.service.ICategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
	@Resource
	private ICategoryDao categoryDao;
	
	@Override
	public List<Category> findAll() {
		List<Category> parents=categoryDao.findAll();
		/*
		 *  循环遍历所有的一级分类，为每个一级分类加载它的二级分类 
		 */
		for(Category parent : parents) {
			// 查询出当前父分类的所有子分类
			List<Category> children =findByParent(parent.getCid());
			// 设置给父分类
			parent.setChildren(children);
		}
		
		return parents;
	}

	@Override
	public List<Category> findParents() {
		
		return categoryDao.findAll();
	}

	@Override
	public List<Category> findByParent(String pid) {
		List<Category> category=categoryDao.findByParent(pid);
		return category;
	}

	@Override
	public void add(Category category) {
		
		String pid = null;//一级分类
		if(category.getPid() != null) {
			pid = category.getPid();
		}
		categoryDao.add(category.getCid(), category.getCname(), pid, category.getCdesc());
	}

	@Override
	public Category load(String cid) {
		return categoryDao.load(cid);
	}

	@Override
	public void edit(Category category) {
		String pid = null;//一级分类
		if(category.getPid() != null) {
			pid = category.getPid();
		}
		categoryDao.edit(category.getCid(), category.getCname(), pid, category.getCdesc());
	}

	@Override
	public int findChildrenCountByParent(String pid) {
		return categoryDao.findChildrenCountByParent(pid);
	}

	@Override
	public void delete(String cid) {
		categoryDao.delete(cid);
	}

}
