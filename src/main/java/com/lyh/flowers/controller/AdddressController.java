package com.lyh.flowers.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyh.flowers.pojo.Address;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.impl.AddressServiceImpl;
import com.lyh.flowers.util.tools;

@Controller
@RequestMapping("/address")
public class AdddressController {
	@Resource
	private AddressServiceImpl addressService;

	@RequestMapping(value = "/addAddress", method = { RequestMethod.POST })
	@ResponseBody
	public String addAddress(HttpServletResponse response,
			HttpServletRequest request, Model model, HttpSession httpSession) {
		User owner = (User) request.getSession().getAttribute("sessionUser");

		String str = request.getParameter("str");
		String[] strArray = str.split("/");

		String province = strArray[0];
		String city = strArray[1];
		String district = strArray[2];

		String adstreet = request.getParameter("adstreet");
		String adpostcode = request.getParameter("adpostcode");
		String adname = request.getParameter("adname");
		String phone = request.getParameter("adphone");
		Address address = new Address();
		address.setAdid(tools.uuid());
		address.setUid(owner.getUid());
		address.setAdname(adname);
		address.setAdcity(city);
		address.setAddistrict(district);
		address.setAdphone(phone);
		address.setAdprovince(province);
		address.setAdstreet(adstreet);
		address.setAdpostcode(adpostcode);

		addressService.add(address);
		return "ok";
	}

//	@RequestMapping(value="/insertAddress")
//	public String insertAddress(HttpServletRequest request, Model model) {
//		User owner = (User) request.getSession().getAttribute("sessionUser");
//
//		String str = request.getParameter("city-picker3");
//		String[] strArray = str.split("/");
//
//		String province = strArray[0];
//		String city = strArray[1];
//		String district = strArray[2];
//
//		String adstreet = request.getParameter("adstreet");
//		String adpostcode = request.getParameter("adpostcode");
//		String adname = request.getParameter("adname");
//		String phone = request.getParameter("adphone");
//		Address address = new Address();
//		address.setAdid(tools.uuid());
//		address.setUid(owner.getUid());
//		address.setAdname(adname);
//		address.setAdcity(city);
//		address.setAddistrict(district);
//		address.setAdphone(phone);
//		address.setAdprovince(province);
//		address.setAdstreet(adstreet);
//		address.setAdpostcode(adpostcode);
//
//		addressService.add(address);
////		return "ok";loadjiesuan
//		return "redirect:/cart/loadjiesuan";
//	}
	
	@RequestMapping("/showAddress")
	public String showAddress(HttpServletRequest request, Model model) {
		User owner = (User)request.getSession().getAttribute("sessionUser");
		List<Address> addressList=addressService.findByUid(owner.getUid());
		
		int count=addressService.findCountByUid(owner.getUid());
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("count", count);
		model.addAttribute("remain", (10-count));
		
		return "user/addressMsg";
	}
	
	@RequestMapping("/delete/{adid}")
	public String delete(@PathVariable String adid,HttpServletRequest request, Model model) {
		addressService.delete(adid);
		
		return "redirect:/address/showAddress";
	}
	
}
