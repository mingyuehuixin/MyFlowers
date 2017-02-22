package com.lyh.flowers.controller;


import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.swing.ImageIcon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	@RequestMapping(value="/main")
	public String main(HttpServletRequest request,Model model){
		return "adminflower/main";
	}
	
	@RequestMapping(value="/edit",method={RequestMethod.POST})
	public String edit(HttpServletRequest request,Model model){
		Flower flower=new Flower();
		flower=flowerService.findByFid(request.getParameter("fid"));
//		System.out.println("fid="+request.getParameter("fid"));
		flower.setCurrPrice(Double.valueOf(request.getParameter("currPrice")));
		flower.setPrice(Double.valueOf(request.getParameter("price")));
		flower.setDiscount(Double.valueOf(request.getParameter("discount")));
		flower.setBranchnumber(Integer.valueOf(request.getParameter("branchnumber")));
		flower.setFlowercolor(request.getParameter("flowercolor"));
		flower.setFname(request.getParameter("fname"));
		flower.setFlowersaying(request.getParameter("flowersaying"));
		flower.setTarget(request.getParameter("target"));
		flower.setType(request.getParameter("type"));
		flower.setMakeuse(request.getParameter("makeuse"));
		flower.setMaterial(request.getParameter("material"));
		flower.setPacking(request.getParameter("packing"));
		
		
		flowerService.edit(flower);
		model.addAttribute("msg", "修改图书成功！");
		return "admin/msg";
	}
	
	@RequestMapping(value="/delete/{fid}")
	public String delete(@PathVariable String fid,HttpServletRequest request,Model model){
		Flower flower=new Flower();
		flower=flowerService.findByFid(fid);
		/*
		 * 删除图片
		 */
		flower = flowerService.findByFid(flower.getFid());
		
		String savepath = request.getSession().getServletContext().getRealPath("/");//获取真实的路径
		new File(savepath, flower.getImage_w()).delete();//删除文件
		new File(savepath, flower.getImage_b()).delete();//删除文件
		
		flowerService.delete(flower.getFid());//删除数据库的记录
		
		model.addAttribute("msg", "删除图书成功！");
		return "admin/msg";
	}
	
	@RequestMapping(value="/findCategoryAll")
	public String findCategoryAll(HttpServletRequest request,Model model){
		List<Category> parents = categoryService.findAll();
		model.addAttribute("parents", parents);
		
		return "adminflower/left";
	}
	
	@RequestMapping(value="/load/{fid}",method={RequestMethod.GET})
	public String load(@PathVariable String fid,HttpServletRequest request,Model model){
		Flower flower = flowerService.findByFid(fid);
		model.addAttribute("flower", flower);
		
		List<Category> materials=categoryService.findChildren("2");
		List<Category> colors=categoryService.findChildren("6");
		List<Category> targets=categoryService.findChildren("4");
		List<Category> makeuses=categoryService.findChildren("1");
		List<Category> types=categoryService.findChildren("7");
		List<Category> branchnumbers=categoryService.findChildren("5");
		
		model.addAttribute("materials", materials);
		model.addAttribute("colors", colors);
		model.addAttribute("targets", targets);
		model.addAttribute("makeuses", makeuses);
		model.addAttribute("types", types);
		model.addAttribute("branchnumbers", branchnumbers);
		
		
		return "adminflower/desc";
	}
	
	
	@RequestMapping(value="/body",method={RequestMethod.GET})
	public String body(HttpServletRequest request,Model model){
		
		return "adminflower/body";
	}
	@RequestMapping(value="/addflower",method={RequestMethod.GET})
	public String addPre(HttpServletRequest request,Model model){
		List<Category> materials=categoryService.findChildren("2");
		List<Category> colors=categoryService.findChildren("6");
		List<Category> targets=categoryService.findChildren("4");
		List<Category> makeuses=categoryService.findChildren("1");
		List<Category> types=categoryService.findChildren("7");
		List<Category> branchnumbers=categoryService.findChildren("5");
		
		model.addAttribute("materials", materials);
		model.addAttribute("colors", colors);
		model.addAttribute("targets", targets);
		model.addAttribute("makeuses", makeuses);
		model.addAttribute("types", types);
		model.addAttribute("branchnumbers", branchnumbers);
		Flower flower=new Flower();
	    model.addAttribute("flower", flower);
		return "adminflower/add";
	}	
	
	@RequestMapping(value="/addflower",method={RequestMethod.POST})
	public String doadd(@Validated Flower flower,@RequestParam("image_w") MultipartFile image_w,
			@RequestParam("image_b") MultipartFile image_b, HttpServletRequest request,ModelMap model) throws ServletException, IOException{
		/*
		 * 把上传的图片保存起来
		 *   > 获取文件名：截取之
		 *   > 给文件添加前缀：使用uuid前缀，为也避免文件同名现象
		 *   > 校验文件的扩展名：只能是jpg
		 *   > 校验图片的尺寸
		 *   > 保存之
		 */
		// 获取文件名
		String filename = image_w.getOriginalFilename();
		// 截取文件名，因为部分浏览器上传的绝对路径
		int index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}
		// 给文件名添加uuid前缀，避免文件同名现象
		filename = uuid() + "_" + filename;
		// 校验文件名称的扩展名
		if(!filename.toLowerCase().endsWith(".jpg")) {
			model.addAttribute("msg", "上传的图片扩展名必须是JPG");
			model.addAttribute("flower", flower);
			return "adminflower/add";
		}
		/*
		 * 保存图片：
		*/
		String savepath = request.getSession().getServletContext().getRealPath("/static/flower_images");
		File destFile=new File(savepath, filename);
		image_w.transferTo(destFile);
		
		// 校验尺寸,把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
		// 1. 使用文件路径创建ImageIcon
		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
		// 2. 通过ImageIcon得到Image对象
		Image image = icon.getImage();
		// 3. 获取宽高来进行校验
		if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			destFile.delete();//删除图片
			model.addAttribute("msg", "您上传的图片尺寸超出了350*350！");
			model.addAttribute("flower", flower);
			return "adminflower/add";
		}
		
		// 把图片的路径设置给flower对象
		flower.setImage_w("/static/flower_images/" + filename);
		
		// 获取文件名
		filename = image_b.getOriginalFilename();
		// 截取文件名，因为部分浏览器上传的绝对路径
		index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}
		filename = uuid() + "_" + filename;
		if(!filename.toLowerCase().endsWith(".jpg")) {
			model.addAttribute("msg", "上传的图片扩展名必须是JPG");
			model.addAttribute("flower", flower);
			return "adminflower/add";
		}
		
		savepath = request.getSession().getServletContext().getRealPath("/static/flower_images");
		destFile = new File(savepath, filename);
		image_b.transferTo(destFile);
		// 校验尺寸
		icon = new ImageIcon(destFile.getAbsolutePath());
		image = icon.getImage();
		if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			destFile.delete();//删除图片
			model.addAttribute("msg", "您上传的图片尺寸超出了350*350！");
			model.addAttribute("flower", flower);
			return "adminflower/add";
		}
		
		flower.setImage_b("/static/flower_images/" + filename);
	
		// 调用flowerService完成保存
		flower.setFid(uuid());
		flowerService.add(flower);
		
		// 保存成功信息转发到msg.jsp
	    model.addAttribute("msg", "添加鲜花成功");
	    return "admin/msg";
	}

	@RequestMapping(value="/flowerlist/{cid}")
	public String findByCategory(@PathVariable String cid,HttpServletRequest request,Model model){
		
		Category category=categoryService.load(cid);
		String pid=category.getPid();
		String cname=category.getCname();
		int pc = getPc(request);
		String url = getUrl(request);
		
//		System.out.println("pid:"+pid+"cname:"+cname+"cid+"+cid+"pc:"+pc);
		PageBean<Flower> pb = flowerService.findByType(pid, cname, cid, pc);
		
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		
		return "adminflower/list";
	}
	

}
