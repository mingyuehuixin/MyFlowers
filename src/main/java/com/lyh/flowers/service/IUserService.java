package com.lyh.flowers.service;

import java.util.Map;

import com.lyh.flowers.pojo.User;

public interface IUserService {
	
	public User getUserById(int userId);
	public User loginCheck(String empname, String password);
}
