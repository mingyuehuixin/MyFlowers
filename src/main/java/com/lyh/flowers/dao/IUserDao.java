package com.lyh.flowers.dao;

import com.lyh.flowers.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);
    
    int findByUidAndPassword(String uid,String oldpass);
    void insert(User record);
    boolean updatePassWord(String uid,String newpass);
    
    User selectByPrimaryKey(Integer id);
    
    User findByCode(String code);
    User findByEmail(String email);
    User findByUserName(String loginname);
    User findByUid(String uid);
    int updateByPrimaryKey(User record);
    void updateStatus(User user);
    
    User loginCheck(String empname,String password);
}