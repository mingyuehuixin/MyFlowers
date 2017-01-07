package com.lyh.flowers.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.ISystemService;
import com.lyh.flowers.service.IUserService;

@Controller
@RequestMapping("/system")
public class SystemController {
	@Resource
	private ISystemService iSystemService;
	
	@RequestMapping("/config")
	public String config(HttpServletRequest request,Model model){
		String booknums=iSystemService.selectByCongigname("booknums");
		String days=iSystemService.selectByCongigname("days");
		
		model.addAttribute("booknums", booknums);
		model.addAttribute("days", days);

		return "system/config";
	}

	@RequestMapping("/saveConfig")
	public String saveConfig(HttpServletRequest request,Model model){
		String booknums=request.getParameter("booknums");
		String days=request.getParameter("days");
		
		
		iSystemService.updateBookNumbers(booknums);
		int result=iSystemService.updateDays(days);
		
		booknums=iSystemService.selectByCongigname("booknums");
		days=iSystemService.selectByCongigname("days");
		
		model.addAttribute("booknums", booknums);
		model.addAttribute("days", days);

		if(result==1){
			model.addAttribute("result", "修改成功");
			return "system/config";

		}

		return "system/config";
	}
	
	@RequestMapping("/systemmsg")
	public String register(HttpServletRequest request,Model model){
		return "system/systemmsg";
	}
	
	
	
}
