package com.lyh.flowers.controller;


import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.impl.CategoryServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;
import com.lyh.flowers.service.impl.MainFrameImpl;

@Controller
@RequestMapping("/mainFrame")
public class MainFrameController {
	@Resource
	private MainFrameImpl mFrameService;
	@Resource
	private FlowerServiceImpl flowerService;
	
	@Resource
	private CategoryServiceImpl categoryService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model){
		
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping("/about")
	public String about(HttpServletRequest request,Model model){
		
		return "mainFrame/about";
	}
	@RequestMapping("/news")
	public String news(HttpServletRequest request,Model model){
		
		return "mainFrame/news";
	}
	@RequestMapping("/contact")
	public String contact(HttpServletRequest request,Model model){
		
		return "mainFrame/contact";
	}
	@RequestMapping("/flowersaying")
	public String flowersaying(HttpServletRequest request,Model model){
		
//		return "redirect:/index.jsp";
		return "mainFrame/flowersaying";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model){
		
		return "mainFrame/main";
	}
	
	@RequestMapping("/top")
	public String top(HttpServletRequest request,Model model){
		
		return "mainFrame/top";
	}
	
	@RequestMapping("/left")
	public String left(HttpServletRequest request,Model model){
		List<Category> parents=categoryService.findAll();
		model.addAttribute("parents", parents);
		return "mainFrame/left";
	}
	
	@RequestMapping("/body")
	public String body(HttpServletRequest request,Model model){
		PageBean<Flower> pb=flowerService.seachByKeyWord("玫瑰", 1);
		model.addAttribute("pb", pb);
		
		return "mainFrame/body";
	}
	
	@RequestMapping("/msg")
	public String msg(HttpServletRequest request,Model model){
		
		return "mainFrame/msg";
	}
	
}
