package com.lyh.flowers.service;


import com.lyh.flowers.pojo.User;

public interface IUserService {
	public void insert(User record);
	
	public boolean findByUidAndPassword(String uid,String oldpass);
	public void updatePassWord(String uid,String newpass);
	
	public User getUserById(int userId);
	public User findByEmail(String email);
	public User findByUserName(String loginname);
	public User loginCheck(String username, String password);
}
