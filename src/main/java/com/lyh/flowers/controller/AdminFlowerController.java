package com.lyh.flowers.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.impl.CategoryServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;

 
@Controller
@RequestMapping("/flowerM")
public class AdminFlowerController {
	@Resource
	private CategoryServiceImpl categoryService;
	@Resource
	private FlowerServiceImpl flowerService;
	/**
	 * 获取当前页码
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch(RuntimeException e) {}
		}
		return pc;
	}
	
	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	
	
	@RequestMapping(value="/main")
	public String main(HttpServletRequest request,Model model){
		
		return "adminflower/main";
	}
	
	@RequestMapping(value="/findCategoryAll")
	public String findCategoryAll(HttpServletRequest request,Model model){
		List<Category> parents = categoryService.findAll();
		model.addAttribute("parents", parents);
		
		return "adminflower/left";
	}
	@RequestMapping(value="/body",method={RequestMethod.GET})
	public String body(HttpServletRequest request,Model model){
		
		return "adminflower/body";
	}
	@RequestMapping(value="/addflower",method={RequestMethod.GET})
	public String addPre(HttpServletRequest request,Model model){
		
		return "adminflower/add";
	}
	
	@RequestMapping(value="/flowerlist/{cid}")
	public String findByCategory(@PathVariable String cid,HttpServletRequest request,Model model){
		
		Category category=categoryService.load(cid);
		String pid=category.getPid();
		String cname=category.getCname();
		int pc = getPc(request);
		String url = getUrl(request);
		
		System.out.println("pid:"+pid+"cname:"+cname+"cid+"+cid+"pc:"+pc);
		PageBean<Flower> pb = flowerService.findByType(pid, cname, cid, pc);
		
		System.out.println(pb.toString());
		
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		
		return "adminflower/list";
	}
	

}
