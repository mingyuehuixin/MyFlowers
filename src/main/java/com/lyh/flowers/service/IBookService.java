package com.lyh.flowers.service;

import java.util.List;

import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.BookSelectType;



public interface IBookService {
	
	List<Book> findAllBooks();
	
	List<Book> getEidtBookListBylimit(int start,int limit);
	
	int getListCount();
	int getAllBooksCount();
	int getStatusCount();
	Book findById(String id);
	
	
	List<Book> queryBooks(String bookname,String author,String status,
			String classify,String issuedate,int start,int limit);
	
	List<Book> findByBookName(String bookname);
	List<Book> findByBookAuthor(String authorname);
	List<Book> findByBookStatus(String status);
	
	void saveBook(Book user);
	void deleteBook(Book book);
	
	void updateBook(Book book);
	List<Book> getAllBookList();
	List<Book> getAllBookListBylimit(int start,int limit);
	Book getBooksByCon(String conditoin) ;
    Book selectByPrimaryKey(String id);
    int changeStatus(String status,String id);
    
    List<Book> getAllListBySearch(BookSelectType bookSelectType);
}
