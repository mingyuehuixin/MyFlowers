package com.lyh.flowers.dao;

import java.awt.List;

import com.lyh.flowers.pojo.BookOrder;

public interface IBookOrderDao {
    int insert(BookOrder record);
    
    int getCountsByEmID(String id);
    
    


}
