package com.lyh.flowers.dao;

import com.lyh.flowers.pojo.Admin;

public interface IAdminDao {
	public Admin find(String adminname, String adminpwd);
	
}