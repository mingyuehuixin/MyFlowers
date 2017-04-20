package com.lyh.flowers.controller;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.flowers.pojo.CartItem;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.Order;
import com.lyh.flowers.pojo.OrderItem;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.impl.AddressServiceImpl;
import com.lyh.flowers.service.impl.CartServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;
import com.lyh.flowers.service.impl.OrderServiceImpl;
import com.lyh.flowers.util.tools;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderServiceImpl orderService;
	@Resource
	private CartServiceImpl cartService;
	@Resource
	private FlowerServiceImpl flowerService;
	@Resource
	private AddressServiceImpl addressService;
	
//	/**
//	 * 返回一个不重复的字符串
//	 * @return
//	 */
//	public static String uuid() {
//		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
//	}
	
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
	
	@RequestMapping(value="/orderlist",method={RequestMethod.GET})
	public String orderList(HttpServletRequest request,Model model){
		int pc = getPc(request);
		
		String url = getUrl(request);
		
		User user = (User)request.getSession().getAttribute("sessionUser");
		
		PageBean<Order> pb = orderService.myOrders(user.getUid(), pc);
		
		pb.setUrl(url);
		model.addAttribute("pb", pb);
		
		return "order/list";
	}
	
	@RequestMapping(value="/createOrder/{cartItemIds}",method={RequestMethod.POST})
	public String createOrder(@PathVariable String cartItemIds,HttpServletRequest request,Model model){
		/*
		 * 1. 获取所有购物车条目的id，查询之
		 */
		List<CartItem> cartItemList=new ArrayList<CartItem>();
		
		String[] cartItemIdArray = cartItemIds.split(",");
		String addressId = request.getParameter("addressId");
//		System.out.println("addressId:"+addressId);
		
		for(String cItemId:cartItemIdArray){
			CartItem cartItem=cartService.loadCartItem(cItemId);
			Flower flower=flowerService.findByFid(cartItem.getFid());
			cartItem.setFlower(flower);
			cartItemList.add(cartItem);
		}
		if(cartItemList.size() == 0) {
			model.addAttribute("code", "error");
			model.addAttribute("msg", "您没有选择要购买的鲜花，不能下单！");
			return "mainFrame/msg";
		}
		/*
		 * 2. 创建Order
		 */
		Order order = new Order();
		order.setOid(tools.uuid());//设置主键
		order.setOrdertime(String.format("%tF %<tT", new Date()));//下单时间
		order.setStatus(1);//设置状态，1表示未付款
		order.setAdid(addressId);
		order.setAddress(addressService.findByAdid(addressId));
//		order.setAddress(request.getParameter("address"));//设置收货地址
//		order.setName(request.getParameter("name"));
//		order.setPhone(request.getParameter("phone"));
		
		User owner = (User)request.getSession().getAttribute("sessionUser");
		
		order.setOwner(owner);//设置订单所有者
		order.setUid(owner.getUid());
		
		BigDecimal total = new BigDecimal("0");
		for(CartItem cartItem : cartItemList) {
			total = total.add(new BigDecimal(cartItem.getSubtotal() + ""));
		}
		order.setTotal(total.doubleValue());//设置总计
		
		/*
		 * 3. 创建List<OrderItem>
		 * 一个CartItem对应一个OrderItem
		 */
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for(CartItem cartItem : cartItemList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemId(tools.uuid());//设置主键
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setFlower(cartItem.getFlower());
			orderItem.setOrder(order);
			orderItemList.add(orderItem);
		}
		order.setOrderItemList(orderItemList);
		
		/*
		 * 4. 调用service完成添加
		 */
		orderService.createOrder(order);
		orderService.addOrderItem(orderItemList);
		// 删除购物车条目
		for(String cItemId:cartItemIdArray){
			cartService.delete(cItemId);
		}
		request.setAttribute("order", order);
		return "order/ordersucc";
	}
	
	//支付准备
	@RequestMapping("/paymentPre/{oid}")
	public String paymentPre(@PathVariable String oid,HttpServletRequest request,Model model){
		model.addAttribute("order", orderService.load(oid));
		return "order/pay";
	}
	
	//支付方法
	@RequestMapping("/payment/{oid}")
	public String payment(@PathVariable String oid,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		/*
		 * 1. 准备13个参数
		 */
		String p0_Cmd = "Buy";//业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");//商号编码，在易宝的唯一标识
		String p2_Order = oid;//订单编码
		String p3_Amt = "0.01";//支付金额
		String p4_Cur = "CNY";//交易币种，固定值CNY
		String p5_Pid = "";//商品名称
		String p6_Pcat = "";//商品种类
		String p7_Pdesc = "";//商品描述
		String p8_Url = props.getProperty("p8_Url");//在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";//送货地址
		String pa_MP = "";//扩展信息
		String pd_FrpId = request.getParameter("yh");//支付通道
		String pr_NeedResponse = "1";//应答机制，固定值1
		
		/*
		 * 2. 计算hmac
		 * 需要13个参数
		 * 需要keyValue
		 * 需要加密算法
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		/*
		 * 3. 重定向到易宝的支付网关
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		
		response.sendRedirect(sb.toString());
		
		
		return null;
	}
	
	/**
	 * 回馈方法
	 * 当支付成功时，易宝会访问这里
	 * 用两种方法访问：
	 * 1. 引导用户的浏览器重定向(如果用户关闭了浏览器，就不能访问这里了)
	 * 2. 易宝的服务器会使用点对点通讯的方法访问这个方法。（必须回馈success，不然易宝服务器会一直调用这个方法）
	 */
	@RequestMapping("/back")
	public String back(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		/*
		 * 1. 获取12个参数
		 */
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		/*
		 * 2. 获取keyValue
		 */
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		String keyValue = props.getProperty("keyValue");
		/*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份
		 *   >如果校验失败：保存错误信息，转发到msg.jsp
		 *   >如果校验通过：
		 *     * 判断访问的方法是重定向还是点对点，如果要是重定向
		 *     修改订单状态，保存成功信息，转发到msg.jsp
		 *     * 如果是点对点：修改订单状态，返回success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
				keyValue);
		if(!bool) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "无效的签名，支付失败！");
			return "mainFrame/msg";
		}
		if(r1_Code.equals("1")) {
			orderService.updateStatus(r6_Order, 2);//修改订单状态
			if(r9_BType.equals("1")) {
				request.setAttribute("code", "success");
				request.setAttribute("msg", "恭喜您，支付成功！");
				return "mainFrame/msg";				
			} else if(r9_BType.equals("2")) {
				response.getWriter().print("success");
			}
		}
		return null;
	}
		
	
	//订单详情
	@RequestMapping("/desc/{oid}")
	public String desc(@PathVariable String oid,HttpServletRequest request,Model model){
		Order order = orderService.load(oid);
		order.setAddress(addressService.findByAdid(order.getAdid()));
		model.addAttribute("order", order);
		
//		System.out.println(order);
		
		String btn = request.getParameter("btn");//btn说明了用户点击哪个超链接来访问本方法的
		model.addAttribute("btn", btn);
		
		return "order/desc";
	}
	
	@RequestMapping("/cancle/{oid}")
	public String cancle(@PathVariable String oid,HttpServletRequest request,Model model){
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status != 1) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "状态不对，不能取消！");
			return "mainFrame/msg";
		}
		orderService.updateStatus(oid, 5);//设置状态为取消！
		request.setAttribute("code", "success");
		request.setAttribute("msg", "您的订单已取消");
		
		return "mainFrame/msg";
	}
	
	@RequestMapping("/confirm/{oid}")
	public String confirm(@PathVariable String oid,HttpServletRequest request,Model model){
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status != 3) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "状态不对，不能确认收货！");
			return "mainFrame/msg";
		}
		orderService.updateStatus(oid, 4);//设置状态为取消！
		request.setAttribute("code", "success");
		request.setAttribute("msg", "恭喜，交易成功！");
		
		return "mainFrame/msg";
	}
	
	
	
	@RequestMapping("/ordersucc")
	public String ordersucc(HttpServletRequest request,Model model){
		return "order/ordersucc";
	}
	

	
}
