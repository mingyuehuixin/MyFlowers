package com.lyh.flowers.dao;

import java.util.List;

import com.lyh.flowers.pojo.MyBooks;


public interface IMyBooksDao {

	List<MyBooks> getMyBooksListByEId(String employeeId);
	List<MyBooks> getMyBooksListByLimit(String employeeId,int start,int end);
    int getListCount(String employeeId);
    
    int getAllListCount();

    int getBorrowedBooksListCount();
    
	List<MyBooks> getReturnBooksByLimit(String employeeId,int start,int end);
    int getReturnBooksListCount(String employeeId);
    
    
    List<MyBooks> getBooksListByLimit(String record,int start,int limit );
    
    List<MyBooks> getBorrowedBooksListByLimit(String record,int start,int limit );
    
    
    int update(MyBooks myBooks);

    int cancleOrder(String orderId);

}
