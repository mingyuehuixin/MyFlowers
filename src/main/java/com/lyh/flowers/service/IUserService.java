package com.lyh.flowers.service;


import com.lyh.flowers.pojo.User;

public interface IUserService {
	public void insert(User record);
	public boolean activation(String validateCode);
	
	public boolean findByUidAndPassword(String uid,String oldpass);
	public boolean updatePassWord(String uid,String newpass);
	
	public void emailSendCode(String email);
	public User getUserById(int userId);
	public User findByEmail(String email);
	public User findByUserName(String loginname);
	public User findByUid(String uid);
	public User loginCheck(String username, String password);
}
