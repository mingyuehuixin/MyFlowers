package com.lyh.flowers.service;

import com.lyh.flowers.pojo.Admin;


public interface IAdminService {
	
	
	public Admin findByIdAndPassword(String adminname, String adminpwd);
	
}
