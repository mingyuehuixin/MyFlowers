package com.lyh.flowers.controller;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IUserService;
 
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	/*
	 * 随机生成颜色
	 */
	Color getRandColor(int fc,int bc){
		Random random=new Random();
		if(fc>255)
			fc=255;
		if(bc>255) 
			bc=255;
		int r=fc+random.nextInt(bc-fc);
		int g=fc+random.nextInt(bc-fc);
		int b=fc+random.nextInt(bc-fc);
		
		return new Color(r, g, b);
		
	}
	/**
	 * 产生验证码
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@RequestMapping(value="/getVerifyCode")
	public void getVerifyCode(HttpServletRequest request,
			HttpServletResponse response, Model model,HttpSession httpSession) throws IOException{
		int width=100;
		int height=50;
		Random random=new Random();
		
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		//生成缓冲区imag类
		BufferedImage image=new BufferedImage(width, height, 1);
		Graphics g=image.getGraphics();   //产生imag类的Graphics用于绘制操作
		
		g.setColor(this.getRandColor(200,250));
		g.setFont(new Font("Times New Roman", 0, 28));
		g.fillRect(0, 0, width, height);
		//绘制干扰线
		for(int i=0;i<40;i++){
			g.setColor(this.getRandColor(130,200));
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			int x1=random.nextInt(12);
			int y1=random.nextInt(12);
			g.drawLine(x, y, x+x1, y+y1);
		}
		//绘制字符
		String strCode="";
		for(int i=0;i<4;i++){
			String rand=String.valueOf(random.nextInt(10));
			strCode=strCode+rand;
			g.setColor(new Color(20+random.nextInt(110), 20+random.nextInt(110), 20+random.nextInt(110)));
			g.drawString(rand, 13*i+6, 28);
		}
//		 model.addAttribute("verifyCode", strCode);
		 httpSession.setAttribute("strCode", strCode);
		 g.dispose();
		 ImageIO.write(image, "JPEG", response.getOutputStream());
		 response.getOutputStream().flush();
	}
	 
	
	@RequestMapping(value="/login",method={RequestMethod.GET})
	public String login(HttpServletRequest request,Model model){
		//Map<String,Object> root = new HashMap<String,Object>();  
      //  root.put("username", "ajun");  
       // emailService.sendTemplateMail(root,"1286005044@qq.com","DDCͼ�����ϵͳ","render.html");
		return "user/login";
	}
	
	@RequestMapping(value="/login",method={RequestMethod.POST})
	public String dologin(HttpServletRequest request,HttpServletResponse response ,Model model,
			HttpSession httpSession) throws UnsupportedEncodingException{
		String loginname = request.getParameter("loginname");
		String loginpass = request.getParameter("loginpass");
//		System.out.println("loginname:"+loginname+"  loginpass"+loginpass);

		User loginUser=userService.loginCheck(loginname, loginpass);
		
		if(loginUser==null){
			model.addAttribute("loginname", loginname);
			model.addAttribute("loginpass", loginpass);
			model.addAttribute("msg", "用户名或密码错误");
			return "user/login";
		}else{
			if(!loginUser.isStatus()){
				model.addAttribute("loginname", loginname);
				model.addAttribute("loginpass", loginpass);
				model.addAttribute("msg", "您还没有激活");
				return "user/login";
			}else{
				httpSession.setAttribute("sessionUser", loginUser);
				httpSession.setAttribute("userName", loginUser.getLoginname());
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);//保存10天
//				resp.addCookie(cookie);
				response.addCookie(cookie);
				return "redirect:/index.jsp";
			}
		}
//		return "user/regist";
	}
	
	
	
	@RequestMapping(value="/registCheck",method={RequestMethod.POST})
	@ResponseBody
	public String registCheck(HttpServletResponse response,HttpServletRequest request,Model model,HttpSession httpSession){
		User user=null;
		String email=request.getParameter("email");
		String loginname=request.getParameter("loginname");
		
		if(email!=null){
			user=userService.findByEmail(email);
			if(user!=null){
				return "已存";
			}else{
				return "未存";
			}
		}
		
		if(loginname!=null){
			user=userService.findByUserName(loginname);
			if(user!=null){
				return "已存";
			}else{
				return "未存";
			}
		}
		
		return "未存";
	}
	
	@RequestMapping(value="/vCodeCheck",method={RequestMethod.POST})
	@ResponseBody
	public String vCodeCheck(HttpServletResponse response,HttpServletRequest request,Model model,HttpSession httpSession){
		String vCodeInput=request.getParameter("verifyCode");
		String vCodeSession=(String) httpSession.getAttribute("strCode");
		
		if(vCodeInput!=null){   //校验验证码
			boolean b=vCodeInput.equals(vCodeSession);
			if(b){
				return "正确";
			}else{
				return "错误";
			}
		}
		return "正确";
	}
	
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request,ModelMap model){
		User user=new User();
		model.addAttribute("user", user);
		return "user/regist";
	}
	
	@RequestMapping(value={"/regist"},method = RequestMethod.POST)
	public String doregist(@Valid User user, BindingResult result,ModelMap model)
	{
		userService.insert(user);
		model.addAttribute("code", "success");
		model.addAttribute("msg", "恭喜您注册成功，请马上到邮箱激活！");
		return "mainFrame/msg";
	}
	
	
	@RequestMapping(value="/changePwd",method={RequestMethod.POST})
	public String dochangePwd(HttpServletRequest request,Model model){
		String loginpass = request.getParameter("loginpass");
		String newpass = request.getParameter("newpass");
		String reloginpass=request.getParameter("reloginpass");
		
		User user=(User) request.getSession().getAttribute("sessionUser");
		
		if(user==null){
			model.addAttribute("msg", "您还没有登录");
			return "user/login";
		}
		boolean bool=userService.findByUidAndPassword(user.getUid(), loginpass);
		if(bool){
			userService.updatePassWord(user.getUid(), newpass);
			model.addAttribute("msg", "密码修改成功");
			model.addAttribute("code", "success");
			return "mainFrame/msg";
		}else{
			model.addAttribute("msg", "您输入的密码不正确");
			model.addAttribute("loginpass", loginpass);
			model.addAttribute("newpass", newpass);
			model.addAttribute("reloginpass", reloginpass);
			return "user/changePwd";
		}
	}
	@RequestMapping(value="/changePwd",method={RequestMethod.GET})
	public String changePwd(HttpServletRequest request,Model model){
		return "user/changePwd";
	}
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request,Model model){
		request.getSession().invalidate();
		return "redirect:/index.jsp";
	}
	
}
