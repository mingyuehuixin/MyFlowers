package com.lyh.flowers.dao;

import com.lyh.flowers.pojo.System;

public interface ISystemDao {

	int updateDays(String days);
	int updateBookNumbers(String bookBumbers);
	String selectByCongigname(String name);

}
