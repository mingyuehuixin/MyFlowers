package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IEmployeeDao;
import com.lyh.flowers.pojo.Employee;
import com.lyh.flowers.service.IEmployeeService;
@Service("empService")
public class EmployeeServiceImpl implements IEmployeeService{
	@Resource
	private IEmployeeDao empDao;
	@Override
	public Employee getEmployeeById(String employeeId) {
		return this.empDao.selectByPrimaryKey(employeeId);
	}

	@Override
	public int insertEmployee(Employee emp) {
		return this.empDao.insert(emp);
	}

	@Override
	public int insertSelectiveEmployee(Employee emp) {
		return this.empDao.insertSelective(emp);
	}


	@Override
	public int updateByEmployeeSelective(Employee emp) {
		return this.empDao.updateByPrimaryKeySelective(emp);
	}

	@Override
	public int deleteByEmpID(String id) {
		return this.empDao.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByEmployee(Employee emp) {
		return this.empDao.updateByPrimaryKey(emp);
	}

	@Override
	public Employee findByEmail(String email) {
		return this.empDao.findByEmail(email);
	}

	@Override
	public List<Employee> getAllEmp() {
		return this.empDao.getAllEmp();
	}

	@Override
	public List<Employee> getEmpsListBylimit(int start, int limit) {
		return empDao.getEmpsListBylimit(start, limit);
	}

	@Override
	public int setStatuNA(String id) {
		return empDao.setStatuNA(id);
	}

	@Override
	public List<Employee> queryEmp(String empname, String email,int start,int limit) {
		return empDao.queryEmp(empname, email,start,limit);
	}

	@Override
	public Employee loginCheck(String empname, String password) {
		// TODO Auto-generated method stub
		return empDao.loginCheck(empname, password);
	}

}
