package com.lyh.flowers.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.service.ICategoryService;
import com.lyh.flowers.service.IMainFrameService;

@Controller
@RequestMapping("/mainFrame")
public class MainFrameController {
	@Resource
	private IMainFrameService mFrameService;
	
	@Resource
	private ICategoryService categoryService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model){
		
		return "mainFrame/index";
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
		
		return "mainFrame/body";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request,Model model){
		
		return "mainFrame/search";
	}
	@RequestMapping("/gj")
	public String gj(HttpServletRequest request,Model model){
		
		return "mainFrame/gj";
	}
	
	@RequestMapping("/msg")
	public String msg(HttpServletRequest request,Model model){
		
		return "mainFrame/msg";
	}
	
}
