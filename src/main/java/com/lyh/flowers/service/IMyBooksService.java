package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.MyBooks;

public interface IMyBooksService {
	List<MyBooks> getAllBookList();
	List<MyBooks> getAllBookListBylimit(int start,int limit);
	
	List<MyBooks> getMyBooksListByEId(String employeeId);
	
	List<MyBooks> getMyBooksListByLimit(String employeeId,int start,int end);

	
    int getListCount(String employeeId);
    
    List<MyBooks> getBooksListByLimit(String record,int start,int limit );


    int update(MyBooks myBooks);

    
    List<MyBooks> getBorrowedBooksListByLimit(String record,int start,int limit );
    
    int getAllListCount();
    int getBorrowedBooksListCount();

    int cancleOrder(String orderId);



	
}
