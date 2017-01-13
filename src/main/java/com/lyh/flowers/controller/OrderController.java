package com.lyh.flowers.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.service.ICartService;
import com.lyh.flowers.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private IOrderService orderService;
//	@Resource
//	private EmailServiceImpl emailService;
	
	@RequestMapping(value="/orderlist",method={RequestMethod.GET})
	public String orderList(HttpServletRequest request,Model model){
		//Map<String,Object> root = new HashMap<String,Object>();  
      //  root.put("username", "ajun");  
       // emailService.sendTemplateMail(root,"1286005044@qq.com","DDCͼ�����ϵͳ","render.html");
		return "order/list";
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
	
	@RequestMapping("/pay")
	public String pay(HttpServletRequest request,Model model){
		return "order/pay";
	}
	
	@RequestMapping("/desc")
	public String desc(HttpServletRequest request,Model model){
		return "order/desc";
	}
	
	@RequestMapping("/ordersucc")
	public String ordersucc(HttpServletRequest request,Model model){
		return "order/ordersucc";
	}
	

	
}
