package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.BookApply;
import com.lyh.flowers.pojo.BookOrder;

public interface IBookApplyService {
	int insert(BookApply bookApply);
    List<BookApply> getList(int start,int limit );

    int getListCount();


}
