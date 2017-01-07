package com.lyh.flowers.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IUserDao;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}
	@Override
	public User loginCheck(String empname, String password) {
		// TODO Auto-generated method stub
		return userDao.loginCheck(empname, password);
	}

}
