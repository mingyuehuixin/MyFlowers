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

	@RequestMapping(value = "/findbystatus/{status}")
	public String findByStatus(@PathVariable String status,HttpServletRequest request, Model model) {

		int pc = getPc(request);

		String url = getUrl(request);
		
		PageBean<Order> pb = orderService.findByStatus(Integer.valueOf(status), pc);
		
		pb.setUrl(url);
		model.addAttribute("pb", pb);

		return "adminorder/list";
	}

	// @RequestMapping(value="/body",method={RequestMethod.GET})
	// public String body(HttpServletRequest request,Model model){
	//
	// return "admin/body";
	// }
	// @RequestMapping(value="/top",method={RequestMethod.GET})
	// public String top(HttpServletRequest request,Model model){
	//
	// return "admin/top";
	// }
	//
	// @RequestMapping(value="/msg",method={RequestMethod.GET})
	// public String msg(HttpServletRequest request,Model model){
	//
	// return "admin/msg";
	// }

	
}
