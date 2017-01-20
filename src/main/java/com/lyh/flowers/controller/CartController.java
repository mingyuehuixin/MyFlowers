package com.lyh.flowers.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;









import org.springframework.web.bind.annotation.ResponseBody;

import com.lyh.flowers.pojo.CartItem;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.impl.CartServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Resource
	private CartServiceImpl cartService;
	@Resource
	private FlowerServiceImpl flowerService;
	
	/**
	 * 返回一个不重复的字符串
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	
	@RequestMapping(value="/cartlist",method={RequestMethod.GET})
	public String cartList(HttpServletRequest request,Model model){
		User user=(User) request.getSession().getAttribute("sessionUser");
		String uid = user.getUid();
		List<CartItem> cartItemList=cartService.myCart(uid);
		Flower flower=null;
		
		for(CartItem cartItem:cartItemList){
			flower=flowerService.findByFid(cartItem.getFid());
			cartItem.setFlower(flower);
		}
		
		model.addAttribute("cartItemList", cartItemList);
		
		return "cart/list";
	}
	
	@RequestMapping(value="/delete/{cartItemId}")
	public String delete(@PathVariable String cartItemId,HttpServletRequest request,Model model){
		
		String[] cartItemIdArray = cartItemId.split(",");
		for(String cItemId:cartItemIdArray){
			cartService.delete(cItemId);
		}
		return "redirect:/cart/cartlist";
	}
	
	@RequestMapping(value="/updateQuantity",method={RequestMethod.POST})
	@ResponseBody
	public String updateQuantity(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		String cartItemId =request.getParameter("cartItemId");
		String quantity = request.getParameter("quantity");
//		System.out.println("cartItemId:"+cartItemId+"  quantity:"+quantity);
		
		CartItem cartItem=cartService.updateQuantity(cartItemId, quantity);
		Flower flower=flowerService.findByFid(cartItem.getFid());
		cartItem.setFlower(flower);
		
		// 给客户端返回一个json对象
		StringBuilder sb = new StringBuilder("{");
		sb.append("\"quantity\"").append(":").append(cartItem.getQuantity());
		sb.append(",");
		sb.append("\"subtotal\"").append(":").append(cartItem.getSubtotal());
		sb.append("}");

		response.getWriter().print(sb);	
		return null;
	}
	
	@RequestMapping(value="/quickBuy/{fid}")
	public String quickBuy(@PathVariable String fid,HttpServletRequest request,Model model){
		List<CartItem> cartItemList=new ArrayList<CartItem>();
		User owner = (User)request.getSession().getAttribute("sessionUser");
		if(owner==null){
			request.setAttribute("code", "error");
			request.setAttribute("msg", "您还没有登录，请先登录！");
			return "mainFrame/msg";
		}
		CartItem cartItem=new CartItem();
		String cartItemId=uuid();
		Flower flower=flowerService.findByFid(fid);
		cartItem.setCartItemId(cartItemId);
		cartItem.setFlower(flower);
		cartItem.setQuantity(1);
		cartItem.setUid(owner.getUid());
		
		cartItemList.add(cartItem);
		
		model.addAttribute("cartItemList", cartItemList);
		model.addAttribute("total", flower.getCurrPrice());
		model.addAttribute("cartItemIds", cartItem.getCartItemId());
		
		return "cart/showitem";
	}
	
	@RequestMapping(value="/loadjiesuan",method={RequestMethod.POST})
	public String loadjiesuan(HttpServletRequest request,Model model){
		String cartItemIds = request.getParameter("cartItemIds");
		double total = Double.parseDouble(request.getParameter("total"));
		String[] cartItemIdArray = cartItemIds.split(",");
//		System.out.println("cartItemIds"+cartItemIds);
		List<CartItem> cartItemList=new ArrayList<CartItem>();
		for(String cItemId:cartItemIdArray){
			CartItem cartItem=cartService.loadCartItem(cItemId);
			Flower flower=flowerService.findByFid(cartItem.getFid());
			cartItem.setFlower(flower);
			cartItemList.add(cartItem);
		}
		model.addAttribute("cartItemList", cartItemList);
		model.addAttribute("total", total);
		model.addAttribute("cartItemIds", cartItemIds);
		return "cart/showitem";		
	}
	
	@RequestMapping("/addCart/{fid}")
	public String addCart(@PathVariable String fid,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		
		CartItem cartItem=new CartItem();
		User user = (User)request.getSession().getAttribute("sessionUser");
		if(user==null){
			response.getWriter().print("<script language=\"javascript\" charst=\"UTF-8\">alert('您还未登录，请先登录！');</script>");
			
			return null;
		}
		Flower flower=flowerService.findByFid(fid);
//		System.out.println(flower.toString());
		cartItem.setFlower(flower);
		cartItem.setUser(user);
		
		cartService.addCartItem(cartItem);
		return "redirect:/cart/cartlist";
	}
	
	@RequestMapping("/showItem")
	public String showItem(HttpServletRequest request,Model model){
		return "cart/showitem";
	}
}
