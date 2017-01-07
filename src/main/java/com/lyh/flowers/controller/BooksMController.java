package com.lyh.flowers.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.Book;
import com.lyh.flowers.service.impl.BookServiceImpl;


@Controller
@RequestMapping("/booksM")
public class BooksMController {
	
	@Resource
	private BookServiceImpl bookService;
	
	
	/***************   ä¸€äº›é€šç”¨æ–¹æ³•   *****************/
	//ç¼–è¾‘å›¾ä¹¦åˆ—è¡¨çš„æ˜¾ç¤ºæ•°æ�®ï¼Œå�³å�ªä¸�æ˜¾ç¤ºçŠ¶æ€�ä¸ºâ€œå€Ÿå‡ºâ€�çš„å›¾ä¹¦ä¿¡æ�¯
	public List<Book> booksData() {
		List<Book> books=bookService.findAllBooks();
		List<Book> showBooks=new ArrayList<Book>();
		/**
		 * åœ¨ç¼–è¾‘åˆ—è¡¨å�ªæ˜¾ç¤ºæœªå€Ÿå‡ºçš„å›¾ä¹¦ï¼Œçº§å�ªèƒ½ç¼–è¾‘æœªå€Ÿå‡ºçš„å›¾ä¹¦ä¿¡æ�¯
		 */
		for(int index=0;index<books.size();index++)
		{
			if(!(books.get(index).getStatus()).equals("å€Ÿå‡º")){
				showBooks.add(books.get(index));
			}
		}
		return showBooks;
	}
	//æŸ¥è¯¢åˆ—è¡¨çš„å›¾ä¹¦æ€»æ•°
	public int getAllBooksCount() {
		return bookService.getAllBooksCount();
	}
	
	//ç¼–è¾‘åˆ—è¡¨çš„å›¾ä¹¦æ€»æ•°
	public int getListCount(){
			return bookService.getListCount();
		} 
	
	public  int getQuertListCount(String bookname,String authorname,String status,
			String classify,String issuedate){
		return this.bookService.queryBooks(bookname, authorname, status,
				classify, issuedate,0,Integer.MAX_VALUE).size();
	} 
	
				/***************ç¼–è¾‘å›¾ä¹¦åˆ—è¡¨çš„æ˜¾ç¤º*****************/
	//æ˜¾ç¤ºç¼–è¾‘å›¾ä¹¦åˆ—è¡¨
		@RequestMapping(value="/editBookList",method=RequestMethod.GET)
		public String booksList(HttpServletRequest request,Model model){
			int start=0;
			int limit=6;
	        List<Book> books = this.bookService.getEidtBookListBylimit(start, limit); 
	        model.addAttribute("books", books);  
	        model.addAttribute("limit", limit);
	        model.addAttribute("start", start);
	        model.addAttribute("page", start/limit+1);
	        model.addAttribute("allpage",Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
			
			return "booksM/editBookList";
		}
		
		@RequestMapping(value="/editBooksListByLimit",method=RequestMethod.POST)
		public String editBooksListLimit(HttpServletRequest request,Model model){
			String start=request.getParameter("start");
			String limit=request.getParameter("limit");
			List<Book> books;
			if(Integer.valueOf(start)<0){
		        start="0";
		        model.addAttribute("page", 1);
		        model.addAttribute("start", start);
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

			}
			else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(getListCount()-Integer.valueOf(limit))){
				start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
		        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
		        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
			}else {
		        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
		        model.addAttribute("start", start);
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

			}
	        model.addAttribute("books", books);
	        model.addAttribute("limit", limit);
	        model.addAttribute("allpage",Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
			return "booksM/editBookList";
		}
	
		/***************  æ–°å¢žå›¾ä¹¦çš„åŠŸèƒ½      *****************/
	//æ˜¾ç¤ºæ·»åŠ é¡µé�¢
	@RequestMapping(value="/addBook",method=RequestMethod.GET)
	public String addBook(HttpServletRequest request,Model model){
		
		Book book=new Book();
		model.addAttribute("book", book);
		return "booksM/addBook";
	}
	
	//å¤„ç�†æ·»åŠ ä¸šåŠ¡
	@RequestMapping(value={"/doaddBook"},method=RequestMethod.POST)
	public String doAddBook(HttpServletRequest request,Model model){
		Book book=new Book();
		book.setBookname(request.getParameter("bookname"));
		book.setAuthorname(request.getParameter("authorname"));
		book.setClassify(request.getParameter("classify"));
		book.setDescription(request.getParameter("description"));
		book.setStatus(request.getParameter("status"));
		book.setIssuedate(request.getParameter("issuedate"));
		bookService.saveBook(book);
		
		
		int start=0;
		int limit=6;
		
		 model.addAttribute("limit", limit);
	     model.addAttribute("start", start);
	     model.addAttribute("page", start/limit+1);
	     model.addAttribute("allpage",Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
			
	     List<Book> books = this.bookService.getEidtBookListBylimit(start, limit);
		model.addAttribute("books",books);
		return "booksM/editBookList";
	}
	
	
	/***************  ç¼–è¾‘å›¾ä¹¦çš„åŠŸèƒ½   *****************/
	//æ˜¾ç¤ºå›¾ä¹¦ç¼–è¾‘é¡µé�¢
		@RequestMapping(value="/editBooks/{id}")
		public String editBooks(@PathVariable String id, HttpServletRequest request,Model model){
			Book book=bookService.findById(id);
			
			String start=request.getParameter("start");
			String limit=request.getParameter("limit");
			
			model.addAttribute("limit", limit);
		    model.addAttribute("start", start);
			
			model.addAttribute("book", book);
			return "booksM/editBooks";
		}
		//å¤„ç�†ç¼–è¾‘ä¸šåŠ¡
		@RequestMapping(value="/doeditbook/{id}",method=RequestMethod.POST)
		public String doedit(@PathVariable String id,Model model,HttpServletRequest request){
			Book book=new Book();
			book=bookService.findById(id);
			book.setBookname(request.getParameter("bookname"));
			book.setAuthorname(request.getParameter("authorname"));
			book.setClassify(request.getParameter("classify"));
			book.setDescription(request.getParameter("description"));
			book.setStatus(request.getParameter("status"));
			book.setIssuedate(request.getParameter("issuedate"));
			bookService.updateBook(book);
			
			
			String start=request.getParameter("start");
			String limit=request.getParameter("limit");
//			System.out.println("limit:"+limit);
			List<Book> books;
			if(Integer.valueOf(start)<0){
		        start="0";
		        model.addAttribute("page", 1);
		        model.addAttribute("start", start);
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

			}
			else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(getListCount()-Integer.valueOf(limit))){
				start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
		        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
		        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
			}else {
		        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
		        model.addAttribute("start", start);
		        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

			}
	        model.addAttribute("books", books);
	        model.addAttribute("limit", limit);
	        model.addAttribute("allpage",Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
			return "booksM/editBookList";
		}
	
		
	/***************  åˆ é™¤å›¾ä¹¦çš„åŠŸèƒ½   *****************/
	//åˆ é™¤å›¾ä¹¦è®°å½•
	@RequestMapping(value={"/delete/{id}"})
	public String delete(@PathVariable String id,HttpServletRequest request,Model model){
		Book book=bookService.findById(id);
		bookService.deleteBook(book);
		
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
		
		List<Book> books;
		if(Integer.valueOf(start)<0){
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(10-Integer.valueOf(limit))){
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.bookService.getEidtBookListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage",Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
		
		return "booksM/editBookList";
	}
	
	
	/***************  æŸ¥è¯¢åˆ—è¡¨çš„åŠŸèƒ½  *****************/
	
	/**
	 * æŸ¥è¯¢æ˜¾ç¤ºåˆ—è¡¨ï¼Œæ˜¾ç¤ºå›¾ä¹¦çš„æ‰€æœ‰ä¿¡æ�¯
	 */
	@RequestMapping(value="/queryBooksList",method=RequestMethod.GET)
	public String queryBooksList(HttpServletRequest request,Model model){
		int start=0;
		int limit=5;
		String bookname="-1";
		String authorname="-1";
		String classify="-1";
		String status="-1";
		String issuedate="-1";
		
		List<Book>  books = this.bookService.queryBooks(bookname, authorname, status,
				classify, issuedate,start, limit);
		int quert_size =getQuertListCount(bookname, authorname, status, classify, issuedate);
		
        model.addAttribute("books", books);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("bookname", bookname);  
        model.addAttribute("authorname", authorname);
        model.addAttribute("classify", classify);
        model.addAttribute("status", status);  
        model.addAttribute("issuedate", issuedate);
        
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage",Math.ceil(quert_size/(float)Integer.valueOf(limit)));
		
		return "booksM/queryBooksList";
	}
	
	@RequestMapping(value="/queryBooksListLimit",method=RequestMethod.POST)
	public String queryBooksListLimit(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
		
		String bookname=request.getParameter("bookname");
		String authorname=request.getParameter("authorname");
		String classify=request.getParameter("classify");
		String status=request.getParameter("status");
		String issuedate=request.getParameter("issuedate");
//		System.out.println("22-----"+bookname+"-----"+status);
		
		if(bookname==null||bookname=="") bookname="-1";
		if(authorname==null||authorname=="") authorname="-1";
		if(classify==null||classify=="") classify="-1";
		if(status==null||status=="") status="-1";
		if(issuedate==null||issuedate=="") issuedate="-1";
		
		int quert_size =getQuertListCount(bookname, authorname, status, classify, issuedate);
		
		List<Book> books;
		//aas
		if(Integer.valueOf(start)<0){
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.bookService.queryBooks(bookname, authorname, status,
					classify, issuedate,Integer.valueOf(start), Integer.valueOf(limit));
		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(quert_size-Integer.valueOf(limit))){
			
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.bookService.queryBooks(bookname, authorname, status,
					classify, issuedate,Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.bookService.queryBooks(bookname, authorname, status,
					classify, issuedate,Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("bookname", bookname);  
        model.addAttribute("authorname", authorname);
        model.addAttribute("classify", classify);
        model.addAttribute("status", status);  
        model.addAttribute("issuedate", issuedate);
        
        model.addAttribute("allpage",Math.ceil(quert_size/(float)Integer.valueOf(limit)));
        model.addAttribute("alllist", quert_size );
		return "booksM/queryBooksList";
	}
	
	@RequestMapping(value="/searchBooks")
	public String searchBooks(HttpServletRequest request,Model model){
		List<Book> books;
		
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
		String bookname=request.getParameter("bookname");
		String authorname=request.getParameter("authorname");
		String classify=request.getParameter("classify");
		String status=request.getParameter("status");
		String issuedate=request.getParameter("issuedate");
//		System.out.println("111-----"+bookname+"**"+authorname+"**"+classify+"**"+issuedate+"--"+status);
		
		if(bookname==null||bookname=="") bookname="-1";
		if(authorname==null||authorname=="") authorname="-1";
		if(classify==null||classify=="") classify="-1";
		if(status==null||status=="") status="-1";
		if(issuedate==null||issuedate=="") issuedate="-1";
		
		int quert_size =getQuertListCount(bookname, authorname, status, classify, issuedate);
//		System.out.println("quert_size:"+quert_size);
		
		books=bookService.queryBooks(bookname, authorname, status,
				classify, issuedate,Integer.valueOf(start), Integer.valueOf(limit));
       
		model.addAttribute("books", books);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("bookname", bookname);  
        model.addAttribute("authorname", authorname);
        model.addAttribute("classify", classify);
        model.addAttribute("status", status);  
        model.addAttribute("issuedate", issuedate);
        
        model.addAttribute("page",Integer.valueOf(start)/Integer.valueOf(limit)+1);
        model.addAttribute("alllist", quert_size );
        model.addAttribute("allpage",Math.ceil(quert_size/(float)Integer.valueOf(limit)));
        return "booksM/queryBooksList";
	}
	
}
