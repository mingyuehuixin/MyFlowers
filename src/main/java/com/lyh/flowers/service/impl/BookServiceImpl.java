package com.lyh.flowers.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IBookDao;
import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.BookSelectType;
import com.lyh.flowers.service.IBookService;

@Service("bookService")
public class BookServiceImpl implements IBookService {
	
	@Resource
	private IBookDao bookDao;
	@Override
	public List<Book> getAllBookList() {
		// TODO Auto-generated method stub
		return bookDao.getAllList();
	}

	@Override
	public Book getBooksByCon(String conditoin) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> getAllBookListBylimit(int start,int limit) {
		// TODO Auto-generated method stub
		return bookDao.getAllListByLimit(start, limit);

	}

	

	@Override
	public Book selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return bookDao.selectByPrimaryKey(id);
	}

	@Override
	public int changeStatus(String status, String id) {
		// TODO Auto-generated method stub
		return bookDao.changeStatus(status, id);
	}

	

	

	

	

	
	

	

/********** 通用方法*************/
	
	/*
	 * 限制显示页面中图书简介的长度
	 */
	public List<Book> limitDesc(List<Book> books) {
		for (int index=0;index<books.size();index++) {
			modifyStatus(books.get(index));
			String temDes=books.get(index).getDescription();
			if(temDes.length()>25){     //限制图书的简介长度不能超过28个字节
				String tem=temDes.substring(0, 25)+"......";
				books.get(index).setDescription(tem);
			}
		}
		return books;
	}
	
	
	/*
	 * 更改状态在页面上的显示
	 */
	public Book modifyStatus(Book book) {
		switch (book.getStatus()) {
		case "1":
			book.setStatus("在库");
			break;
		case "2":
			book.setStatus("已选");
			break;
		case "3":
			book.setStatus("借出");
			break;
		case "4":
			book.setStatus("遗失");
			break;
		case "5":
			book.setStatus("损坏");
			break;
		case "6":
			book.setStatus("不可用");
			break;
		}
		return book;
	}
	
	
	/********** 各种逻辑方法*************/
	
	/*
	 * 添加图书信息，保存到数据库中
	 * @see com.hpe.books.service.IBookService#saveBook(com.hpe.books.pojo.Book)
	 */
	@Override
	public void saveBook(Book book) {
		String classify=null;
//		switch (book.getClassify()) {
//			case "文学":classify="I";
//				break;
//			case "哲学 ":classify="B";
//			break;
//			case "经济":classify="F";
//			break;
//			case "计算机":classify="N";
//			break;
//			case "历史":classify="K";
//			break;
//		}
		
		switch (book.getClassify()) {
			case "文学":classify="11";
				break;
			case "小说":classify="22";
				break;
			case "经济":classify="33";
				break;
			case "计算机与互联网":classify="66";
				break;
			case "历史":classify="55";
				break;
			case "哲学":classify="88";
				break;
		}
		
		SimpleDateFormat df1=new SimpleDateFormat("ddHHmmss");
		String rand=df1.format(new Date());;
//		System.out.println(rand);
		//(int)(Math.random()*9+1)*100
		String id=classify+rand;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime=df.format(new Date());
		
		//补齐数据
		book.setId(id);
		book.setStatus("1");   //状态设为1，即默认在库
		book.setCreatetime(createtime);
		book.setLastupdatetime(createtime);//最后更新时间默认为创建时间
		
		bookDao.insert(book);
	}
	
	/*
	 * 查找所以图书信息，显示在管理员的图书列表中
	 * @see com.hpe.books.service.IBookService#findAllBooks()
	 */
	@Override
	public List<Book> findAllBooks() {
		List<Book> books=bookDao.slesctAllBooks();
		
		return limitDesc(books);
	}

	/*
	 * 通过图书Id查找特定图书
	 * @see com.hpe.books.service.IBookService#findById(java.lang.String)
	 */
	@Override
	public Book findById(String id) {
		Book book=bookDao.selectByPrimaryKey(id);
		modifyStatus(book);
		return book;
//		return bookDao.selectByPrimaryKey(id);
	}

	
	
	
/*
 * 在逻辑上删除图书信息，即把状态设置为6即可
 * @see com.hpe.books.service.IBookService#deleteBook(com.hpe.books.pojo.Book)
 */
	@Override
	public void deleteBook(Book book) {
		Book entiry=bookDao.selectByPrimaryKey(book.getId());
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化最后更新日期
		if(entiry!=null){
			entiry.setStatus("6");
			entiry.setLastupdatetime(df.format(new Date()));
		}
		bookDao.updateByPrimaryKeySelective(entiry);
//		bookDao.deleteByPrimaryKey(id);
	}

	/*
	 * 修改图书信息，更新数据库
	 * @see com.hpe.books.service.IBookService#updateBook(com.hpe.books.pojo.Book)
	 */
	@Override
	public void updateBook(Book book) {
		Book entiry=bookDao.selectByPrimaryKey(book.getId());
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化最后更新日期
		if(entiry!=null){
			entiry.setBookname(book.getBookname());
			entiry.setAuthorname(book.getAuthorname());
			entiry.setClassify(book.getClassify());
//			System.out.println("Description:"+book.getDescription());
			entiry.setDescription(book.getDescription());
			entiry.setIssuedate(book.getIssuedate());
			entiry.setLastupdatetime(df.format(new Date()));
			entiry.setStatus(book.getStatus());
		}
		bookDao.updateByPrimaryKeySelective(entiry);
//		bookDao.insertSelective(entiry);
	}


	@Override
	public List<Book> getEidtBookListBylimit(int start, int limit) {
		List<Book> books=bookDao.getEidtBookListBylimit(start, limit);
		return limitDesc(books);
	}

	@Override
	public int getListCount() {
		return bookDao.getListCount();
	}


	@Override
	public int getAllBooksCount() {
		return bookDao.getAllBooksCount();
	}

	
	@Override
	public List<Book> findByBookName(String bookname) {
		List<Book> books=bookDao.findByBookName(bookname);
		return limitDesc(books);
	}

	@Override
	public List<Book> findByBookAuthor(String authorname) {
		List<Book> books=bookDao.findByBookAuthor(authorname);
		return limitDesc(books);
	}


	@Override
	public List<Book> findByBookStatus(String status) {
		switch (status) {
		case "在库":
			status="1";
			break;
		case "已选":
			status="2";
			break;
		case "借出":
			status="3";
			break;
		case "遗失":
			status="4";
			break;
		case "损坏":
			status="5";
			break;
		case "不可用":
			status="6";
			break;
		}
		
		List<Book> books=bookDao.findByBookStatus(status);
		return limitDesc(books);
	}

	@Override
	public int getStatusCount() {
		return bookDao.getStatusCount();
	}


	@Override
	public List<Book> queryBooks(String bookname, String author,
			String status, String classify, String issuedate, int start,
			int limit) {
		List<Book> books=bookDao.queryBooks(bookname, author, status, classify, issuedate, start, limit);
		return limitDesc(books);
	}

	@Override
	public List<Book> getAllListBySearch(BookSelectType bookSelectType) {
		// TODO Auto-generated method stub
		return bookDao.getAllListBySearch(bookSelectType);
	}
	
	


	

	


}
