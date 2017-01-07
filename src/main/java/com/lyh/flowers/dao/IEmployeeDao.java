package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.Employee;
import com.lyh.flowers.pojo.User;

public interface IEmployeeDao {
	int deleteByPrimaryKey(String id);

    int insert(Employee record);
    
    int insertSelective(Employee record);
    
    Employee selectByPrimaryKey(String id);
    
    Employee findByEmail(String email);
    
    int updateByPrimaryKeySelective(Employee record);
    
    int updateByPrimaryKey(Employee record);
    
    List<Employee> getAllEmp();
    
    List<Employee> getEmpsListBylimit(int start,int limit);
    
    int setStatuNA(String id);
    
    List<Employee> queryEmp(String empname,String email,int start,int limit);
    
    Employee loginCheck(String empname,String password);
}
