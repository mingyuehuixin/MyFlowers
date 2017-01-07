package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IBookApplyDao;
import com.lyh.flowers.dao.IBookOrderDao;
import com.lyh.flowers.pojo.BookApply;
import com.lyh.flowers.pojo.BookOrder;
import com.lyh.flowers.service.IBookApplyService;
import com.lyh.flowers.service.IBookOrderService;

@Service("bookApplyService")
public class BookApplyServiceImpl implements IBookApplyService {
	@Resource
	private IBookApplyDao iBookApplyDao;

	@Override
	public int insert(BookApply record) {
		// TODO Auto-generated method stub
		return iBookApplyDao.insert(record);
	}

	@Override
	public List<BookApply> getList(int start, int limit) {
		// TODO Auto-generated method stub
		return iBookApplyDao.getList(start, limit);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return iBookApplyDao.getListCount();
	}
	
}
