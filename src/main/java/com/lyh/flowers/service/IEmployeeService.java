package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Employee;
import com.lyh.flowers.pojo.User;


public interface IEmployeeService {
	public Employee getEmployeeById(String employeeId);
	
	public int insertEmployee(Employee emp);
	
	public int insertSelectiveEmployee(Employee emp);
	
	public int deleteByEmpID(String id);
	
	public int updateByEmployee(Employee emp);
	
	public Employee findByEmail(String email);
	
	public int updateByEmployeeSelective(Employee emp);
	
	public List<Employee> getAllEmp();
	
	public List<Employee> getEmpsListBylimit(int start,int limit);
	
	int setStatuNA(String id);
	
	List<Employee> queryEmp(String empname,String email,int start,int limit);
	
	public Employee loginCheck(String empname,String password);
}
