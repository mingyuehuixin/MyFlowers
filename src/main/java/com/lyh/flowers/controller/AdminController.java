package com.lyh.flowers.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.Admin;
import com.lyh.flowers.service.impl.AdminServiceImpl;

 
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private AdminServiceImpl adminService;
	
	@RequestMapping(value="/login",method={RequestMethod.GET})
	public String login(HttpServletRequest request,Model model){
		
		return "admin/login";
	}
	
	@RequestMapping(value="/index",method={RequestMethod.GET})
	public String index(HttpServletRequest request,Model model){
		
		return "admin/main";
	}
	@RequestMapping(value="/body",method={RequestMethod.GET})
	public String body(HttpServletRequest request,Model model){
		
		return "admin/body";
	}
	@RequestMapping(value="/top",method={RequestMethod.GET})
	public String top(HttpServletRequest request,Model model){
		
		return "admin/top";
	}
	
	@RequestMapping(value="/msg",method={RequestMethod.GET})
	public String msg(HttpServletRequest request,Model model){
		
		return "admin/msg";
	}
	
	@RequestMapping(value="/login",method={RequestMethod.POST})
	public String dologin(HttpServletRequest request,Model model,HttpSession httpSession) {
		String adminname = request.getParameter("adminname");
		String adminpwd = request.getParameter("adminpwd");
//		System.out.println("loginname:"+loginname+"  loginpass"+loginpass);

		Admin admin=adminService.findByIdAndPassword(adminname, adminpwd);
		if(admin==null){
			model.addAttribute("msg", "用户名或密码错误！");
			return "admin/login";
		}
		httpSession.setAttribute("admin", admin);
		return "admin/main";
	}
	@RequestMapping("/loginout")
	public String quit(HttpServletRequest request,Model model){
		request.getSession().invalidate();
//		return "redirect:/index.jsp";
		return "admin/login";
	}
	
}
