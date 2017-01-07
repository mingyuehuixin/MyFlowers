package com.lyh.flowers.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.pojo.BookApply;
import com.lyh.flowers.pojo.BookOrder;
import com.lyh.flowers.pojo.BookSelectType;
import com.lyh.flowers.pojo.MyBooks;
import com.lyh.flowers.service.IBookApplyService;
import com.lyh.flowers.service.IBookOrderService;
import com.lyh.flowers.service.IBookService;
import com.lyh.flowers.service.IMyBooksService;
import com.lyh.flowers.service.ISystemService;

@Controller
@RequestMapping("/booksBorrow")
public class BooksBorrowController {
	 @Resource  
	private IBookService bookService;  
	 
	 @Resource  
    private IBookOrderService bookOrderService; 
	 
	 @Resource  
	private IMyBooksService myBooksService; 
	 @Resource  
	private IBookApplyService bookApplyService;
	 
	 @Resource
	private ISystemService iSystemService;
	 
	 
	@RequestMapping("/allBooksList")
	public String allBooksList(HttpServletRequest request,Model model){
		int start=0;
		int limit=10;
        List<Book> books = this.bookService.getAllBookListBylimit(start, limit); 
        model.addAttribute("books", books);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage", Math.ceil(bookService.getAllBooksCount()/(float)Integer.valueOf(limit)));
		return "booksBorrow/allBooksList";
	}
	@RequestMapping(value="/allBooksListByLimit",method=RequestMethod.POST)
	public String allBooksListLimit(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
        
		List<Book> books;
		if(Integer.valueOf(start)<0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.bookService.getAllBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(bookService.getAllBooksCount()-Integer.valueOf(limit))){
			//末页
			System.out.println(bookService.getAllBooksCount()+"-------"+start+"-------");
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.bookService.getAllBookListBylimit(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.bookService.getAllBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(bookService.getAllBooksCount()/(float)Integer.valueOf(limit)));
        model.addAttribute("bookSelectType",null);
		return "booksBorrow/allBooksList";
	}
	
	@RequestMapping(value="/searchBooks",method=RequestMethod.POST)
	public String searchBooks(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
        String bookName=request.getParameter("bookname");
        
        String bookAuthor=request.getParameter("bookAuthor");
		String date=request.getParameter("date");
        String type=request.getParameter("type");
        String status=request.getParameter("status");

        
        BookSelectType bookSelectType=new BookSelectType();
        bookSelectType.setLimit(Integer.valueOf(limit));
        bookSelectType.setStart(Integer.valueOf(start));
        bookSelectType.setBookName(bookName);
        bookSelectType.setAuthorname(bookAuthor);
        bookSelectType.setIssuedate(date);
        bookSelectType.setClassify(type);
        bookSelectType.setStatus(status);
		List<Book> books;
		if(Integer.valueOf(start)<=0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        bookSelectType.setStart(Integer.valueOf(start));
	        books = this.bookService.getAllListBySearch(bookSelectType); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(bookService.getStatusCount()-Integer.valueOf(limit))){
			//末页
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
			bookSelectType.setStart(Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.bookService.getAllListBySearch(bookSelectType); 

		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        bookSelectType.setStart(Integer.valueOf(start));
	        books = this.bookService.getAllListBySearch(bookSelectType); 
	        
		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(bookService.getAllBooksCount()/(float)Integer.valueOf(limit)));
        model.addAttribute("bookSelectType",bookSelectType);

		return "booksBorrow/allBooksList";
	}
	@RequestMapping("/forReturnBooks")
	public String forReturnBooks(HttpServletRequest request,Model model){
		return "booksBorrow/forReturnBooks";
	}
	@RequestMapping("/deleteBorrow")
	public String deleteBorrow(HttpServletRequest request,Model model,HttpSession httpSession){
		String orderId=request.getParameter("orderId");
		MyBooks myBooks=new MyBooks();
		myBooks.setBookStatus("1");
		myBooks.setId(orderId);
		myBooksService.update(myBooks);
		myBooksService.cancleOrder(orderId);
		
		
		return myBooksLimit(request,model,httpSession);
	}
	
	@RequestMapping("/buyApply")
	public String buyApply(HttpServletRequest request,Model model){
		return "booksBorrow/buyApply";
	}
	
	@RequestMapping("/buyApplySubmit")
	public String buyApplySubmit(HttpServletRequest request,Model model,HttpSession httpSession){
		String bookName=request.getParameter("bookname");
		String bookauther=request.getParameter("bookauther");
		String issuetime=request.getParameter("issuetime");
		String buyUrl=request.getParameter("buyUrl");
		String descripe=request.getParameter("descripe");

		BookApply bookApply=new BookApply();
		Date date=new Date();
		bookApply.setId(date.getTime()+"");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		bookApply.setCreatetime(formatter.format(date));
		
		bookApply.setBookName(bookName);
		bookApply.setAuthorname(bookauther);
		bookApply.setIssuedate(issuetime);
		bookApply.setUrllink(buyUrl);
		bookApply.setRecommendreason(descripe);
		
		this.bookApplyService.insert(bookApply);
		
		
		//System.out.println(bookName);
		return "booksBorrow/buyApply";
	}
	
//	//点击借阅触发的控制器
	@RequestMapping(value="/borrowBook")
	public String borrowBook(HttpServletRequest request,Model model,HttpSession httpSession) {
		String id=request.getParameter("id");
		int count=bookOrderService.getCountsByEmID((String)httpSession.getAttribute("empID"));
		String allCount=iSystemService.selectByCongigname("booknums");
		System.out.println(count+"booknums"+allCount);
		if(count>=Integer.valueOf(allCount)){
			String resultString="所借图书超过限制";
			model.addAttribute("resultMsg",resultString);
			return allBooksListLimit(request,model);
		}
		System.out.println("--------"+httpSession.getAttribute("empID"));
		Book book=bookService.selectByPrimaryKey(id);
		BookOrder bookOrder=new BookOrder();
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		bookOrder.setId(date.getTime()+"");
		bookOrder.setBookId(id);
		System.out.println(date.getTime());
		bookOrder.setOrderNumber(date.getTime()+id);
		bookOrder.setEmployeeId(httpSession.getAttribute("empID")+"");
		bookOrder.setStatus("1");
		bookOrder.setApplyDate(formatter.format(date));
		bookOrder.setBorrowDate("2001-01-01");
		bookOrder.setExpectReturnDate("2001-01-01");
		bookOrder.setCreateTime(formatter.format(date));
		bookOrder.setReturnDate("2001-01-01");
		
		int result=bookOrderService.insert(bookOrder);
		if(result==1){
			bookService.changeStatus("2", id);
		}
		System.out.println("--------"+result);
		model.addAttribute("resultMsg","借阅成功");

		return allBooksListLimit(request,model);
		
		
	}
	
	
	
	
	@RequestMapping("/myBooks")
	public String myBooks(HttpServletRequest request,Model model,HttpSession httpSession){
		int start=0;
		int limit=10;
		String userIdString=httpSession.getAttribute("empID").toString();
        List<MyBooks> books = this.myBooksService.getMyBooksListByLimit(userIdString, start, limit); 
        model.addAttribute("books", books);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage", Math.ceil(myBooksService.getListCount(userIdString)/(float)Integer.valueOf(limit)));
		return "booksBorrow/myBooks";
	}
	
	@RequestMapping(value="/myBooksByLimit",method=RequestMethod.POST)
	public String myBooksLimit(HttpServletRequest request,Model model,HttpSession httpSession){
		String userIdString=httpSession.getAttribute("empID").toString();
		int listcount=myBooksService.getListCount(userIdString);
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");

		List<MyBooks> books;
		if(Integer.valueOf(start)<0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getMyBooksListByLimit(userIdString,Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(listcount-Integer.valueOf(limit))){
			//末页
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.myBooksService.getMyBooksListByLimit(userIdString,Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getMyBooksListByLimit(userIdString,Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(listcount/(float)Integer.valueOf(limit)));
		return "booksBorrow/myBooks";
	}
	
	
}
