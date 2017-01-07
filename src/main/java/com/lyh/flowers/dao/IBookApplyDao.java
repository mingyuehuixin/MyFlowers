package com.lyh.flowers.dao;


import java.util.List;

import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.BookApply;
import com.lyh.flowers.pojo.BookOrder;

public interface IBookApplyDao {
    int insert(BookApply record);
    
    List<BookApply> getList(int start,int limit );
    
    int getListCount();

}
