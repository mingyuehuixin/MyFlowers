package com.lyh.flowers.service;

import com.lyh.flowers.pojo.BookOrder;

public interface IBookOrderService {
	int insert(BookOrder bookOrder);
	
    int getCountsByEmID(String id);


}
