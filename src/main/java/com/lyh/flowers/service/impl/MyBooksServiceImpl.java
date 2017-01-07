package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IBookOrderDao;
import com.lyh.flowers.dao.IMyBooksDao;
import com.lyh.flowers.pojo.BookOrder;
import com.lyh.flowers.pojo.MyBooks;
import com.lyh.flowers.service.IBookOrderService;
import com.lyh.flowers.service.IMyBooksService;

@Service("myBooksService")
public class MyBooksServiceImpl implements IMyBooksService {
	@Resource
	private IMyBooksDao iMyOBooksDao;

	@Override
	public List<MyBooks> getAllBookList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyBooks> getAllBookListBylimit(int start, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyBooks> getMyBooksListByEId(String employeeId) {
		// TODO Auto-generated method stub
		return  iMyOBooksDao.getMyBooksListByEId(employeeId);
	}

	@Override
	public List<MyBooks> getMyBooksListByLimit(String employeeId, int start,
			int end) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getMyBooksListByLimit(employeeId, start, end);
	}

	@Override
	public int getListCount(String employeeId) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getListCount(employeeId);
	}

	@Override
	public List<MyBooks> getBooksListByLimit(String record, int start, int limit) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getBooksListByLimit(record, start, limit);
	}

	

	@Override
	public List<MyBooks> getBorrowedBooksListByLimit(String record, int start,
			int limit) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getBorrowedBooksListByLimit(record, start, limit);
	}


	@Override
	public int getAllListCount() {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getAllListCount();
	}

	@Override
	public int getBorrowedBooksListCount() {
		// TODO Auto-generated method stub
		return iMyOBooksDao.getBorrowedBooksListCount();
	}

	@Override
	public int update(MyBooks myBooks) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.update(myBooks);
	}

	@Override
	public int cancleOrder(String orderId) {
		// TODO Auto-generated method stub
		return iMyOBooksDao.cancleOrder(orderId);
	}

	
}
