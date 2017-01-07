package com.lyh.flowers.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyh.flowers.pojo.Employee;
import com.lyh.flowers.service.IEmployeeService;
import com.lyh.flowers.service.impl.EmailServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IEmployeeService empService;
	
	@Resource
	private EmailServiceImpl emailService;
	
	@RequestMapping(value="/login",method={RequestMethod.GET})
	public String loginGet(HttpServletRequest request,Model model){
		//Map<String,Object> root = new HashMap<String,Object>();  
      //  root.put("username", "ajun");  
       // emailService.sendTemplateMail(root,"1286005044@qq.com","DDCͼ�����ϵͳ","render.html");
		return "user/login";
	}
	
	@RequestMapping(value="/login",method={RequestMethod.POST})
	@ResponseBody
	public String loginPost(HttpServletRequest request,Model model,HttpSession httpSession){
		String empno = request.getParameter("empno");
		String password = request.getParameter("password");
		//System.out.println(empname+password+"---"+empService.loginCheck(empname, password).toString());
		Employee loginUser = empService.loginCheck(empno, password);
		if(loginUser==null){
			return "0";
		}else{
			httpSession.setAttribute("loginUser", loginUser.getEmpname());
			httpSession.setAttribute("empID",loginUser.getId());
			httpSession.setAttribute("adminStatus", loginUser.getIsadmin());
			return "1";
		}
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request,Model model){
		return "user/register";
	}
	
	@RequestMapping("/forgotPassword")
	public String forgetPassword(HttpServletRequest request,Model model){
		return "user/forgotPassword";
	}

	
}
