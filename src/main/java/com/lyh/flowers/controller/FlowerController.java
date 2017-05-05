package com.lyh.flowers.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

















import com.lyh.flowers.pojo.Category;
import com.lyh.flowers.pojo.Comments;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.impl.CategoryServiceImpl;
import com.lyh.flowers.service.impl.CommentsServiceImpl;
import com.lyh.flowers.service.impl.FlowerServiceImpl;
import com.lyh.flowers.service.impl.OrderServiceImpl;
import com.lyh.flowers.service.impl.UserServiceImpl;
import com.lyh.flowers.util.tools;

@Controller
@RequestMapping("/flower")
public class FlowerController {
	
	@Resource
	private FlowerServiceImpl flowerService;
	@Resource
	private CategoryServiceImpl categoryService;
	@Resource
	private CommentsServiceImpl commentsService;
	@Resource
	private OrderServiceImpl orderService;
	@Resource
	private UserServiceImpl userService;
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
		Category category=categoryService.load(cid);
		String pid=category.getPid();
		String cname=category.getCname();
		int pc = getPc(request);
		String url = getUrl(request);
		PageBean<Flower> pb=flowerService.findByType(pid, cname, cid, pc);
		
		pb.setUrl(url);
		model.addAttribute("pb", pb);
		return "flower/list";
	}
	
	@RequestMapping(value="/loadDesc/{fid}",method={RequestMethod.GET})
	public String load(@PathVariable String fid,HttpServletRequest request,Model model){
		Flower flower=flowerService.findByFid(fid);
		model.addAttribute("flower", flower);
		
		List<Comments> comments=commentsService.findByFid(fid);
		User user=new User();
		DateFormat df = new SimpleDateFormat("yyyy年MM月dd日 hh点mm分ss秒");
		for(Comments comment : comments) {
			  user=userService.findByUid(comment.getUid());
			  String loginname=user.getLoginname();
			  String uname=loginname.substring(0, 1);//截取名字第一位
			  String uname1=(user.getLoginname()).substring(loginname.length()-1);//截取名字第一位
//			  String str=df.format(comment.getCommenttime());
//			  comment.setCommenttime(str);
			  comment.setUid(uname+"***"+uname1);
			}
		
		model.addAttribute("comments", comments);
		
		return "flower/desc";
	}
	
	@RequestMapping(value="/seach")
	public String seach(HttpServletRequest request,Model model){
		int pc = getPc(request);
		String url = getUrl(request);
		String keyword = request.getParameter("schKeyword");
		System.out.println(keyword);
		PageBean<Flower> pb=flowerService.seachByKeyWord(keyword, pc);
		pb.setUrl(url);
		model.addAttribute("pb", pb);
		
		return "flower/list";
	}
	
	@RequestMapping(value="/comment/fid={fid}&orderItemId={orderItemId}")
	public String comment(@PathVariable String fid,@PathVariable String orderItemId,HttpServletRequest request,Model model){
		
		Flower flower=flowerService.findByFid(fid);
		model.addAttribute("flower", flower);
		model.addAttribute("orderItemId", orderItemId);
		System.out.println("orderItemId:"+orderItemId);
		return "flower/comment";
	}
	
	@RequestMapping(value="/comment",method={RequestMethod.POST})
	public String docomment(HttpServletRequest request,Model model){
		String cGood=request.getParameter("cGood");
		String cService=request.getParameter("cService");
		String cPicture=request.getParameter("cPicture");
		String describe=request.getParameter("describe");
		String storeservice=request.getParameter("storeservice");
		String wuliuService=request.getParameter("logistics");
		String attitude=request.getParameter("attitude");
		String anony=request.getParameter("anony");
		String fid=request.getParameter("fid");
		
		User user = (User) request.getSession().getAttribute("sessionUser");
		
		System.out.println("fid:"+fid+" cGood:"+cGood+" cService:"+cService+" cPicture:"+cPicture+" describe:"+describe
				+" storeservice:"+storeservice+" wuliuService:"+wuliuService+" attitude:"+attitude+" anony:"+anony);
		
		Comments comment=new Comments();
		comment.setcommentId(tools.uuid());
		comment.setFid(fid);
		comment.setUid(user.getUid());
		comment.setAnony(anony);
		comment.setAttitude(attitude);
		comment.setCgood(cGood);
		comment.setCpicture(cPicture);
		comment.setcdescribe(describe);
		comment.setLogistics(wuliuService);
		comment.setStoreservice(storeservice);
		comment.setCservice(cService);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		comment.setCommenttime(df.format(new Date()));
		
		commentsService.save(comment);
		//更新鲜花评价次数
		Flower  flower=flowerService.findByFid(fid);
		flower.setCommentcount((flowerService.findCommentsCount(fid)+1));
		flowerService.edit(flower);
		//修改订单项中的鲜花为已评价状态
		String orderItemId=request.getParameter("orderItemId");
		orderService.updatStatusByItem(orderItemId, "1");
		
		return "redirect:/order/orderlist";
	}
	
}
