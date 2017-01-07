package com.lyh.flowers.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.ISystemDao;
import com.lyh.flowers.service.ISystemService;
import com.sun.mail.handlers.image_gif;
@Service("systemService")
public class ISystemServiceImpl implements ISystemService{

	@Resource 
	private ISystemDao iSystemDao;
	@Override
	public int updateDays(String days) {
		// TODO Auto-generated method stub
		return iSystemDao.updateDays(days);
	}

	@Override
	public int updateBookNumbers(String bookBumbers) {
		// TODO Auto-generated method stub
		return iSystemDao.updateBookNumbers(bookBumbers);
	}

	@Override
	public String selectByCongigname(String name) {
		// TODO Auto-generated method stub
		return iSystemDao.selectByCongigname(name);
	}

}
