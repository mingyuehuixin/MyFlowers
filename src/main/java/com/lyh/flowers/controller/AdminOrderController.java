package com.lyh.flowers.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.Order;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.impl.OrderServiceImpl;

@Controller
@RequestMapping("/orderM")
public class AdminOrderController {
	@Resource
	private OrderServiceImpl orderService;

	/**
	 * 获取当前页码
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
			}
		}
		return pc;
	}

	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();

		int index = url.lastIndexOf("&pc=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}

	@RequestMapping(value = "/orderlist", method = { RequestMethod.GET })
	public String findAll(HttpServletRequest request, Model model) {

		int pc = getPc(request);

		String url = getUrl(request);

		PageBean<Order> pb = orderService.findAll(pc);

		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "adminorder/list";
	}
	@RequestMapping(value = "/header", method = { RequestMethod.GET })
	public String header(HttpServletRequest request, Model model) {

		return "adminorder/header";
	}
	@RequestMapping(value = "/ordermain", method = { RequestMethod.GET })
	public String ordermain(HttpServletRequest request, Model model) {

		return "adminorder/ordermain";
	}

	@RequestMapping(value = "/findbystatus/{status}")
	public String findByStatus(@PathVariable String status,HttpServletRequest request, Model model) {

		int pc = getPc(request);

		String url = getUrl(request);
		
		PageBean<Order> pb = orderService.findByStatus(Integer.valueOf(status), pc);
		
		pb.setUrl(url);
		model.addAttribute("pb", pb);

		return "adminorder/list";
	}

	 @RequestMapping(value="/load/{oid}",method={RequestMethod.GET})
	 public String load(@PathVariable String oid,HttpServletRequest request,Model model){
		 Order order = orderService.load(oid);
		 model.addAttribute("order", order);
		 
		 return "adminorder/desc";
	 }
	 @RequestMapping(value="/cancle/{oid}",method={RequestMethod.GET})
	 public String cancel(@PathVariable String oid,HttpServletRequest request,Model model){
		 int status = orderService.findStatus(oid);
			if(status != 1) {
				model.addAttribute("code", "error");
				model.addAttribute("msg", "状态不对，不能取消！");
				return "admin/msg";
			}
			orderService.updateStatus(oid, 5);//设置状态为取消！
			model.addAttribute("code", "success");
			model.addAttribute("msg", "订单已取消!");
			return "admin/msg";			 
	 }
	
	 @RequestMapping(value="/deliver/{oid}",method={RequestMethod.GET})
	 public String deliver(@PathVariable String oid,HttpServletRequest request,Model model){
		 int status = orderService.findStatus(oid);
			if(status != 2) {
				model.addAttribute("code", "error");
				model.addAttribute("msg", "状态不对，不能发货！");
				return "admin/msg";
			}
			orderService.updateStatus(oid, 3);//设置状态为取消！
			model.addAttribute("code", "success");
			model.addAttribute("msg", "订单已发货，请查看物流!");
			return "admin/msg";	
	 }

	
}
