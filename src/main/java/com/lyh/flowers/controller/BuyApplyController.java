package com.lyh.flowers.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lyh.flowers.pojo.BookApply;
import com.lyh.flowers.service.IBookApplyService;

@Controller
@RequestMapping("/buy")
public class BuyApplyController {
	
	
	@Resource
	private IBookApplyService bookApplyService;
	
	@RequestMapping(value="/applyList",method={RequestMethod.GET})
	public String applyList(HttpServletRequest request,Model model){
		int start=0;
		int limit=3;
        List<BookApply> books = this.bookApplyService.getList(start, limit); 
        model.addAttribute("books", books);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", start/limit+1);
        model.addAttribute("allpage", Math.ceil(bookApplyService.getListCount()/(float)Integer.valueOf(limit)));
		return "borrowM/buyList";
	}
	@RequestMapping(value="/applyListByLimit",method={RequestMethod.POST})
	public String applyListByLimit(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
        
		List<BookApply> books;
		if(Integer.valueOf(start)<0){
			//判断是否是第一页
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        books = this.bookApplyService.getList(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(bookApplyService.getListCount()-Integer.valueOf(limit))){
			//末页
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        books = this.bookApplyService.getList(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        books = this.bookApplyService.getList(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("books", books);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(bookApplyService.getListCount()/(float)Integer.valueOf(limit)));
		return "borrowM/buyList";
	}
	
	
	
}
