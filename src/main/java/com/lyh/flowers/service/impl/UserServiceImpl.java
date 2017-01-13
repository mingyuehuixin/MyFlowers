package com.lyh.flowers.service.impl;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		return this.userDao.selectByPrimaryKey(userId);
	}
	@Override
	public User loginCheck(String username, String password) {
		return userDao.loginCheck(username, password);
	}
	@Override
	public User findByEmail(String email) {
		return this.userDao.findByEmail(email);
	}
	@Override
	public User findByUserName(String loginname) {
		return this.userDao.findByUserName(loginname);
	}
	@Override
	public void insert(User user) {
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddHHmmss");
		String id=df.format(new Date());
		user.setUid(id);
		this.userDao.insert(user);
	}
	
	@Override
	public void updatePassWord(String uid, String newpass) {
				userDao.updatePassWord(uid, newpass);
	}
	@Override
	public boolean findByUidAndPassword(String uid, String oldpass) {
			int count=userDao.findByUidAndPassword(uid, oldpass);
		return count>0;
	}

}
