package com.lyh.flowers.dao;


import java.util.List;




import java.util.List;

import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.BookSelectType;


public interface IBookDao {
    
    int changeStatus(String status,String id);
    
    
    List<Book> getAllList();
    List<Book> getAllListByLimit(int start,int limit);
    
    List<Book> getAllListBySearch(BookSelectType bookSelectType);
	
	int deleteByPrimaryKey(String id);  //åˆ é™¤

    int insert(Book record);   //å¢žåŠ æ–°ä¹¦

    int insertSelective(Book record);

    Book selectByPrimaryKey(String id);  
    
    List<Book> slesctAllBooks();    //æ˜¾ç¤ºæ‰€ä»¥å›¾ä¹¦åˆ—è¡¨ï¼ˆåŒ…æ‹¬å·²ç»�åˆ é™¤çš„ï¼‰
    List<Book> slesctAvailBooks();  //æ˜¾ç¤ºæ‰€ä»¥åˆ—è¡¨ï¼ˆä¸�åŒ…æ‹¬å·²ç»�åˆ é™¤çš„ï¼‰
    
    List<Book> getEidtBookListBylimit(int start,int limit);   //ç¼–è¾‘åˆ—è¡¨çš„åˆ†é¡µæ˜¾ç¤º
    
    int getListCount();  //ç¼–è¾‘åˆ—è¡¨æ€»å›¾ä¹¦è®°å½•æ•°
    int getAllBooksCount();//æŸ¥è¯¢åˆ—è¡¨æ€»å›¾ä¹¦è®°å½•æ•°
    int getStatusCount();
    
    int updateByPrimaryKeySelective(Book record);
    
    int updateByPrimaryKey(Book record);
    
    List<Book> findByBookName(String bookname);
	List<Book> findByBookAuthor(String authorname);
	List<Book> findByBookStatus(String status);
	//List<Book> findByBookClassify(String classify);
	
	List<Book> queryBooks(String bookname,String author,String status,
			String classify,String issuedate,int start,int limit);
	
}
