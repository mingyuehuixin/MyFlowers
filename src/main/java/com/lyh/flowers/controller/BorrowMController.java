package com.lyh.flowers.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.flowers.pojo.MyBooks;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IMyBooksService;
import com.lyh.flowers.service.ISystemService;
import com.lyh.flowers.service.IUserService;

@Controller
@RequestMapping("/borrowM")
public class BorrowMController {
	@Resource  
	private IMyBooksService myBooksService; 
	
	@Resource  
	private ISystemService iSystemService; 
	@RequestMapping("/applyedList")
	public String applyedList(HttpServletRequest request,Model model){
		int start=0;
		int limit=10;
		List<MyBooks> books=myBooksService.getBooksListByLimit("", 0, limit);
		model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage", Math.ceil(myBooksService.getAllListCount()/(float)Integer.valueOf(limit)));
		System.out.println(books.size()+"");
		return "borrowM/applyedList";
	}
	@RequestMapping("/applyedListByLimit")
	public String applyedListByLimit(HttpServletRequest request,Model model){
		int listcount=myBooksService.getAllListCount();
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");

		List<MyBooks> books;
		if(Integer.valueOf(start)<0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getBooksListByLimit("",Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(listcount-Integer.valueOf(limit))){
			//末页
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
			books = this.myBooksService.getBooksListByLimit("",Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getBooksListByLimit("",Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(listcount/(float)Integer.valueOf(limit)));
		return "borrowM/applyedList";
	}
	
	@RequestMapping("/agreeBorrow")
	public String agreeBorrow(HttpServletRequest request,Model model){
		String orderId=request.getParameter("orderId");
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String borrowDate=formatter.format(date);
		MyBooks myBooks=new MyBooks();
		myBooks.setBookStatus("3");
		myBooks.setOrderStatus("2");
		myBooks.setBorrowDate(borrowDate);
		String days=iSystemService.selectByCongigname("days");

		Calendar ca = Calendar.getInstance();
	    ca.add(Calendar.DATE, Integer.valueOf(days));// num为增加的天数，可以改变的
	    Date currdate = ca.getTime();
	    String enddate = formatter.format(currdate);
		myBooks.setExpectReturnDate(enddate);
		myBooks.setId(orderId);
		myBooksService.update(myBooks);
		return applyedListByLimit(request,model);
	}
	
	@RequestMapping("/registerBorrow")
	public String registerBorrow(HttpServletRequest request,Model model){
		String orderId=request.getParameter("orderId");
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String borrowDate=formatter.format(date);
		MyBooks myBooks=new MyBooks();
		myBooks.setOrderStatus("3");
		myBooks.setBookStatus("1");
		myBooks.setBorrowDate(borrowDate);
		myBooks.setExpectReturnDate("2001-01-01");
		myBooks.setId(orderId);
		myBooksService.update(myBooks);
		return applyedListByLimit(request,model);
	}
	
	@RequestMapping("/borrowedList")
	public String borrowedList(HttpServletRequest request,Model model){
		int start=0;
		int limit=10;
		List<MyBooks> books=myBooksService.getBorrowedBooksListByLimit("2", 0, limit);
		model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage", Math.ceil(myBooksService.getBorrowedBooksListCount()/(float)Integer.valueOf(limit)));
		
		System.out.println(books.size()+"");
		
		return "borrowM/borrowedList";
	}
	
	@RequestMapping("/borrowedListByLimit")
	public String borrowedListByLimit(HttpServletRequest request,Model model){
		int listcount=myBooksService.getBorrowedBooksListCount();
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");

		List<MyBooks> books;
		if(Integer.valueOf(start)<0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getBorrowedBooksListByLimit("2",Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(listcount-Integer.valueOf(limit))){
			//末页
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
			books = this.myBooksService.getBorrowedBooksListByLimit("2",Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.myBooksService.getBorrowedBooksListByLimit("2",Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(listcount/(float)Integer.valueOf(limit)));
		return "borrowM/borrowedList";
	}
	
	@RequestMapping("/sureBack")
	public String sureBack(HttpServletRequest request,Model model){
		String orderId=request.getParameter("orderId");
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String returnDare=formatter.format(date);
		MyBooks myBooks=new MyBooks();
		myBooks.setBookStatus("1");
		myBooks.setOrderStatus("4");
		myBooks.setReturnDate(returnDare);
		myBooks.setId(orderId);
		int result=myBooksService.update(myBooks);
		return borrowedListByLimit(request,model);
	}
	@RequestMapping("/sureLost")
	public String sureLost(HttpServletRequest request,Model model){
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String orderId=request.getParameter("orderId");
		String returnDare=formatter.format(date);
		MyBooks myBooks=new MyBooks();
		myBooks.setBookStatus("4");
		myBooks.setOrderStatus("4");
		myBooks.setReturnDate(returnDare);
		myBooks.setId(orderId);
		int result=myBooksService.update(myBooks);
		return borrowedListByLimit(request,model);
	}
	@RequestMapping("/sureBroken")
	public String sureBroken(HttpServletRequest request,Model model){
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String orderId=request.getParameter("orderId");
		String returnDare=formatter.format(date);
		MyBooks myBooks=new MyBooks();
		myBooks.setBookStatus("5");
		myBooks.setOrderStatus("4");
		myBooks.setReturnDate(returnDare);
		myBooks.setId(orderId);
		int result=myBooksService.update(myBooks);
		return borrowedListByLimit(request,model);
	}
	
	
	
	
}
