package com.lyh.flowers.dao;

import com.lyh.flowers.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);
    
    int findByUidAndPassword(String uid,String oldpass);
    void insert(User record);
    void updatePassWord(String uid,String newpass);
    
    User selectByPrimaryKey(Integer id);

    User findByEmail(String email);
    User findByUserName(String loginname);
    
    int updateByPrimaryKey(User record);
    
    User loginCheck(String empname,String password);
}