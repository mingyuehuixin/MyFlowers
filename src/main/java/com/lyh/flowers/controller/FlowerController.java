package com.lyh.flowers.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.impl.FlowerServiceImpl;


@Controller
@RequestMapping("/flower")
public class FlowerController {
	
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
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	@RequestMapping(value="/flowerList/{cid}",method={RequestMethod.GET})
	public String flowerList(@PathVariable String cid,HttpServletRequest request,Model model){
		int pc = getPc(request);
		String url = getUrl(request);
		PageBean<Flower> pb = flowerService.findByCategory(cid, pc);
		pb.setUrl(url);
		model.addAttribute("pb", pb);
		return "flower/list";
	}
	
	@RequestMapping(value="/loadDesc/{fid}",method={RequestMethod.GET})
	public String load(@PathVariable String fid,HttpServletRequest request,Model model){
//		System.out.println("fid="+fid);
		Flower flower=flowerService.findByFid(fid);
		model.addAttribute("flower", flower);
		return "flower/desc";
	}
	
//	@RequestMapping(value="/flowerDesc",method={RequestMethod.GET})
//	public String flowerDesc(HttpServletRequest request,Model model){
//		return "flower/desc";
//	}

	
}
