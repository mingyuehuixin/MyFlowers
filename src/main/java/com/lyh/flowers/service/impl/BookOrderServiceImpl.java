package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IBookOrderDao;
import com.lyh.flowers.pojo.BookOrder;
import com.lyh.flowers.service.IBookOrderService;

@Service("bookOrderService")
public class BookOrderServiceImpl implements IBookOrderService {
	@Resource
	private IBookOrderDao iBookOrderDao;

	@Override
	public int insert(BookOrder record) {
		// TODO Auto-generated method stub
		return iBookOrderDao.insert(record);
	}

	@Override
	public int getCountsByEmID(String id) {
		// TODO Auto-generated method stub
		return iBookOrderDao.getCountsByEmID(id);
	}
	
}
