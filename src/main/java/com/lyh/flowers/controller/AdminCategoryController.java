package com.lyh.flowers.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.service.impl.CategoryServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;

@Controller
@RequestMapping("/category")
public class AdminCategoryController {
	@Resource
	private CategoryServiceImpl categoryService;
	@Resource
	private FlowerServiceImpl flowerService;

	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

	@RequestMapping(value = "/categorylist")
	public String findAll(HttpServletRequest request, Model model) {
		List<Category> parents = categoryService.findAll();
		model.addAttribute("parents", parents);
		return "admincategory/list";
	}

	// 添加一级分类
	@RequestMapping(value = "/addparent", method = { RequestMethod.GET })
	public String addParent(HttpServletRequest request, Model model) {
		return "admincategory/add";
	}

	@RequestMapping(value = "/addparent", method = { RequestMethod.POST })
	public String doaddParent(HttpServletRequest request, Model model) {
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Category category = new Category();
		category.setCid(uuid());
		category.setCname(cname);
		category.setCdesc(cdesc);
		categoryService.add(category);
		model.addAttribute("parents", categoryService.findAll());
		return "admincategory/list";
	}

	@RequestMapping(value = "/addchild/{pid}", method = { RequestMethod.GET })
	public String addChildPre(@PathVariable String pid,
			HttpServletRequest request, Model model) {

		List<Category> parents = categoryService.findParents();
		model.addAttribute("pid", pid);
		model.addAttribute("parents", parents);

		return "admincategory/add2";
	}

	@RequestMapping(value = "/addchild", method = { RequestMethod.POST })
	public String addChild(HttpServletRequest request, Model model) {
		String cname = request.getParameter("cname");
		String pid = request.getParameter("pid");
		String cdesc = request.getParameter("cdesc");
		Category child = new Category();
		child.setCid(uuid());
		child.setCname(cname);
		child.setCdesc(cdesc);
		child.setPid(pid);

		categoryService.add(child);
		model.addAttribute("parents", categoryService.findAll());

		return "admincategory/list";
	}

	// 编辑二级分类
	@RequestMapping(value = "/editchild/{cid}", method = { RequestMethod.GET })
	public String editChildPre(@PathVariable String cid,
			HttpServletRequest request, Model model) {

		Category child = categoryService.load(cid);
		model.addAttribute("child", child);
		
		model.addAttribute("parents", categoryService.findAll());
		return "admincategory/edit2";
	}

	@RequestMapping(value = "/editchild", method = { RequestMethod.POST })
	public String editChild(HttpServletRequest request, Model model) {

		String cname = request.getParameter("cname");
		String pid = request.getParameter("pid");
		String cid = request.getParameter("cid");
		String cdesc = request.getParameter("cdesc");
		
		Category child = new Category();
		child.setCid(cid);
		child.setCname(cname);
		child.setCdesc(cdesc);
		child.setPid(pid);
		categoryService.edit(child);
		
		model.addAttribute("parents", categoryService.findAll());
		return "admincategory/list";
	}

	// 编辑一级分类
		@RequestMapping(value = "/editparent/{cid}", method = { RequestMethod.GET })
		public String editParentPre(@PathVariable String cid,
				HttpServletRequest request, Model model) {

			Category parent = categoryService.load(cid);
			model.addAttribute("parent", parent);

			return "admincategory/edit";
		}

		@RequestMapping(value = "/editparent", method = { RequestMethod.POST })
		public String editParent(HttpServletRequest request, Model model) {

			String cname = request.getParameter("cname");
			String cid = request.getParameter("cid");
			String cdesc = request.getParameter("cdesc");
			
			Category parent = new Category();
			parent.setCid(cid);
			parent.setCname(cname);
			parent.setCdesc(cdesc);
			
			categoryService.edit(parent);
			
			model.addAttribute("parents", categoryService.findAll());
			return "admincategory/list";
		}
	
	
	
	// 删除二级分类
	@RequestMapping(value = "/deletechild/{cid}", method = { RequestMethod.GET })
	public String deleteChild(@PathVariable String cid,HttpServletRequest request, Model model) {
		int cnt = flowerService.findFlowerCountByCategory(cid);
		if (cnt > 0) {
			model.addAttribute("msg", "该分类下还存在图书，不能删除！");
			return "admin/msg";
		}
		categoryService.delete(cid);
		model.addAttribute("parents", categoryService.findAll());

		return "admincategory/list";
	}

	// 删除一级分类
	@RequestMapping(value = "/deleteparent/{cid}", method = { RequestMethod.GET })
	public String deleteParent(@PathVariable String cid,
			HttpServletRequest request, Model model) {
		int cnt = categoryService.findChildrenCountByParent(cid);
		if (cnt > 0) {
			model.addAttribute("msg", "该分类下还有子分类，不能删除！");
			return "admin/msg";
		}
		categoryService.delete(cid);
		model.addAttribute("parents", categoryService.findAll());

		return "admincategory/list";
	}

}
