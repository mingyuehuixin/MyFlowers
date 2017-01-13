package com.lyh.flowers.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.service.ICartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Resource
	private ICartService cartService;
//	@Resource
//	private EmailServiceImpl emailService;
	
	@RequestMapping(value="/cartlist",method={RequestMethod.GET})
	public String cartList(HttpServletRequest request,Model model){
		//Map<String,Object> root = new HashMap<String,Object>();  
      //  root.put("username", "ajun");  
       // emailService.sendTemplateMail(root,"1286005044@qq.com","DDCͼ�����ϵͳ","render.html");
		return "cart/list";
	}
	
//	@RequestMapping(value="/login",method={RequestMethod.POST})
//	@ResponseBody
//	public String loginPost(HttpServletRequest request,Model model,HttpSession httpSession){
//		String empno = request.getParameter("empno");
//		String password = request.getParameter("password");
//		//System.out.println(empname+password+"---"+empService.loginCheck(empname, password).toString());
////		Employee loginUser = empService.loginCheck(empno, password);
//		if(loginUser==null){
//			return "0";
//		}else{
//			httpSession.setAttribute("loginUser", loginUser.getEmpname());
//			httpSession.setAttribute("empID",loginUser.getId());
//			httpSession.setAttribute("adminStatus", loginUser.getIsadmin());
//			return "1";
//		}
//	}
	
	@RequestMapping("/showItem")
	public String showItem(HttpServletRequest request,Model model){
		return "cart/showitem";
	}
	

	
}
