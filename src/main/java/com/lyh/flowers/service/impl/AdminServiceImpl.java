package com.lyh.flowers.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IAdminDao;
import com.lyh.flowers.pojo.Admin;
import com.lyh.flowers.service.IAdminService;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {
	@Resource
	private IAdminDao adminDao;

	@Override
	public Admin findByIdAndPassword(String adminname, String adminpwd) {

		return adminDao.find(adminname, adminpwd);
	}
	
}
