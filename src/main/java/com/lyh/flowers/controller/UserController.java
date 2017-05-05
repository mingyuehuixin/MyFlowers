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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IUserService;
import com.lyh.flowers.util.Md5;
import com.lyh.flowers.util.tools;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;

	/*
	 * 随机生成颜色
	 */
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);

	}

	/**
	 * 产生验证码
	 */
	@RequestMapping(value = "/getVerifyCode")
	public void getVerifyCode(HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession httpSession)
			throws IOException {
		int width = 100;
		int height = 50;
		Random random = new Random();

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		// 生成缓冲区imag类
		BufferedImage image = new BufferedImage(width, height, 1);
		Graphics g = image.getGraphics(); // 产生imag类的Graphics用于绘制操作

		g.setColor(this.getRandColor(200, 250));
		g.setFont(new Font("Times New Roman", 0, 28));
		g.fillRect(0, 0, width, height);
		// 绘制干扰线
		for (int i = 0; i < 40; i++) {
			g.setColor(this.getRandColor(130, 200));
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(12);
			int y1 = random.nextInt(12);
			g.drawLine(x, y, x + x1, y + y1);
		}
		// 绘制字符
		String strCode = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			strCode = strCode + rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 28);
		}
		// model.addAttribute("verifyCode", strCode);
		httpSession.setAttribute("strCode", strCode);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
		response.getOutputStream().flush();
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, Model model) {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public String dologin(HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession httpSession)
			throws UnsupportedEncodingException {
		String loginname = request.getParameter("loginname");
		String loginpass = request.getParameter("loginpass");

		User loginUser = userService.loginCheck(loginname, loginpass);

		if (loginUser == null) {
			model.addAttribute("loginname", loginname);
			model.addAttribute("loginpass", loginpass);
			model.addAttribute("msg", "用户名或密码错误");
			return "user/login";
		} else {
			if (0 == loginUser.getStatus()) {
				model.addAttribute("loginname", loginname);
				model.addAttribute("loginpass", loginpass);
				model.addAttribute("msg", "您还没有激活");
				return "user/login";
			} else {
				httpSession.setAttribute("sessionUser", loginUser);
				httpSession.setAttribute("userName", loginUser.getLoginname());
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);// 保存10天
				response.addCookie(cookie);
				return "redirect:/index.jsp";
			}
		}
	}

	@RequestMapping(value = "/registCheck", method = { RequestMethod.POST })
	@ResponseBody
	public String registCheck(HttpServletResponse response,
			HttpServletRequest request, Model model, HttpSession httpSession) {
		User user = null;
		String email = request.getParameter("email");
		String loginname = request.getParameter("loginname");

		if (email != null) {
			user = userService.findByEmail(email);
			if (user != null) {
				return "已存";
			} else {
				return "未存";
			}
		}

		if (loginname != null) {
			user = userService.findByUserName(loginname);
			if (user != null) {
				return "已存";
			} else {
				return "未存";
			}
		}
		return "未存";
	}

	@RequestMapping(value = "/vCodeCheck", method = { RequestMethod.POST })
	@ResponseBody
	public String vCodeCheck(HttpServletResponse response,
			HttpServletRequest request, Model model, HttpSession httpSession) {
		String vCodeInput = request.getParameter("verifyCode");
		String vCodeSession = (String) httpSession.getAttribute("strCode");

		if (vCodeInput != null) { // 校验验证码
			boolean b = vCodeInput.equals(vCodeSession);
			if (b) {
				return "正确";
			} else {
				return "错误";
			}
		}
		return "正确";
	}

	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user/regist";
	}

	@RequestMapping(value = { "/regist" }, method = RequestMethod.POST)
	public String doregist(@Valid User user, BindingResult result,
			ModelMap model) {
		userService.insert(user);
		
//		model.addAttribute("code", "success");
//		model.addAttribute("msg", "恭喜您注册成功，请马上到邮箱激活，或点击下方使用电话号码激活");
//		return "user/phoneValtion";
		return "mainFrame/msg";
	}

	/**
	 * 激活功能
	 */
	@RequestMapping("/activation/{activationCode}")
	public String activation(@PathVariable String activationCode,
			HttpServletRequest requset, ModelMap model)
			throws ServletException, IOException {

		// System.out.println("activationCode:"+activationCode);
		boolean b = userService.activation(activationCode);
		if (b) {
			requset.setAttribute("code", "success");// 通知msg.jsp显示对号
			requset.setAttribute("msg", "恭喜，激活成功，请马上登录！");

		} else {
			requset.setAttribute("code", "error");// 通知msg.jsp显示对号
			requset.setAttribute("msg", "激活失败！");
		}
		return "mainFrame/msg";
	}

	@RequestMapping(value = "/changePwd", method = { RequestMethod.POST })
	public String dochangePwd(HttpServletRequest request, Model model) {
		String loginpass = request.getParameter("loginpass");
		String newpass = request.getParameter("newpass");
		String reloginpass = request.getParameter("reloginpass");

		User user = (User) request.getSession().getAttribute("sessionUser");

		if (user == null) {
			model.addAttribute("msg", "您还没有登录");
			return "user/login";
		}
		boolean bool = userService.findByUidAndPassword(user.getUid(),
				loginpass);
		if (bool) {
			userService.updatePassWord(user.getUid(), newpass);
			model.addAttribute("msg", "密码修改成功");
			model.addAttribute("code", "success");
			return "mainFrame/msg";
		} else {
			model.addAttribute("msg", "您输入的密码不正确");
			model.addAttribute("loginpass", loginpass);
			model.addAttribute("newpass", newpass);
			model.addAttribute("reloginpass", reloginpass);
			return "user/changePwd";
		}
	}

	@RequestMapping(value = "/changePwd", method = { RequestMethod.GET })
	public String changePwd(HttpServletRequest request, Model model) {
		return "user/changePwd";
	}

	@RequestMapping("/quit")
	public String quit(HttpServletRequest request, Model model) {
		request.getSession().invalidate();
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/emailSendCode", method = { RequestMethod.POST })
	@ResponseBody
	public void emailSendCode(HttpServletResponse response,
			HttpServletRequest request, Model model, HttpSession httpSession) {
		String email = request.getParameter("email");

		userService.emailSendCode(email);

	}

	@RequestMapping("/forgotPassword")
	public String forgetPassword(HttpServletRequest request, Model model) {
		return "user/forgetPwd";
	}

	@RequestMapping(value = "/forgotPassword", method = { RequestMethod.POST })
	public String doforgetPassword(HttpServletRequest request, Model model) {
		User user = null;
		String loginname = request.getParameter("loginname");
		user = userService.findByUserName(loginname);
		if (null == user) {
			model.addAttribute("errorMsg", "该用户不存在！");
			return "user/forgetPwd";
		}
		model.addAttribute("email", user.getEmail());
		return "user/forgetPwd2";
	}
	
	@RequestMapping("/forgotPassword3")
	public String forgetPassword3(HttpServletRequest request, Model model) {
		String sid = request.getParameter("sid");
		String uid = request.getParameter("uid");
		System.out.println("sid:" + sid + "  uname：" + uid);
		if (sid.equals("") || uid.equals("")) {
			model.addAttribute("msg", "链接不完整,请重新生成");
			model.addAttribute("code", "error");
			return "mainFrame/msg";
		}
		User user = userService.findByUid(uid);

		if (user != null) {
			// 获取当前用户申请找回密码的过期时间
			// 找回密码链接已经过期
			if ((user.getOutDate().getTime()) < (System.currentTimeMillis())) {
				System.out.println("链接已经过期");
				model.addAttribute("msg", "链接已经过期,请重新生成");
				model.addAttribute("code", "error");
				return "mainFrame/msg";
			}
			// 获取当前登陆人的加密码
			String key = user.getUid() + "$" + user.getOutDate() + "$"
					+ user.getValidataCode();
			String digitalSignature = Md5.md5(key);// 数字签名
//			System.out.println("digitalSignature:" + digitalSignature);
			if (!digitalSignature.equals(sid)) {
				System.out.println("链接加密密码不正确");
				model.addAttribute("msg", "链接加密密码不正确");
				model.addAttribute("code", "error");
				return "mainFrame/msg";
			} else {
				// 验证成功,跳入到修改密码界面
				model.addAttribute("uid", uid);
				return "user/forgetPwd3";
			}

		} else {
			model.addAttribute("msg", "用户信息不存在");
			model.addAttribute("code", "error");
			return "mainFrame/msg";
		}
	}

	@RequestMapping(value = "/codeCheck", method = { RequestMethod.POST })
	public String verifyCodeCheck(HttpServletRequest request,HttpSession httpSession, Model model) {
		String codeSession = (String) httpSession.getAttribute("vcode");
		String verifyCode=request.getParameter("verifyCode");
//		System.out.println("codeSession:"+codeSession+"verifyCode:"+verifyCode);
		
		if(codeSession.equals(verifyCode)){
			return "user/forgetPwd3";
		}
		else{
			model.addAttribute("errorMsg", "输入的验证码有误");
			model.addAttribute("verifyCode", verifyCode);
			return "user/forgetPwd2";
		}
		
	}
	
	@RequestMapping(value = "/forgotPassword4", method = { RequestMethod.POST })
	public String forgetPassword4(HttpServletRequest request, Model model) {
		String newpass = request.getParameter("loginpass");
		String reloginpass = request.getParameter("reloginpass");
		System.out.println("newpass:" + newpass + "repass" + reloginpass);
		String uid = request.getParameter("uid");
		if (!newpass.equals(reloginpass)) {
			model.addAttribute("msg", "两次输入的密码不一致");
			model.addAttribute("newpass", newpass);
			model.addAttribute("reloginpass", reloginpass);
			return "user/forgetPwd3";
		}
		boolean bool = userService.updatePassWord(uid, newpass);
//		System.out.println("uid:" + uid + "bool:" + bool);
		if (bool) {
			return "user/forgetPwd4";
		} else {
			model.addAttribute("msg", "修改密码不成功");
			model.addAttribute("code", "error");
			return "mainFrame/msg";
		}
	}
	
	/**
     * 获取短信验证码
     */
    @RequestMapping(value ="/getVcode",method = RequestMethod.POST)
    @ResponseBody
    public String getVcode(HttpServletRequest request, HttpSession session) throws ApiException {
    	
    	String phone = request.getParameter("phone");
    	String url = "http://gw.api.taobao.com/router/rest";
    	TaobaoClient client = new DefaultTaobaoClient(url,"23762833",
    			"0e956ca18685b8a177764a5dc7627835");
    	
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        req.setExtend("1");
        
        req.setSmsType("normal");
        
        req.setSmsFreeSignName("玫瑰之约网上商城");
        //生成验证码数字
        String vcode = tools.getVcode();
        //存到session域中
        session.setAttribute("vcode",vcode);
//        System.out.println("验证码："+vcode);
        req.setSmsParamString("{number:'"+vcode+"'}");
        
        req.setRecNum(phone);
        req.setSmsTemplateCode("SMS_62750038");
        AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
        return "ok";
    }
    
    @RequestMapping(value = "/phoneValtion", method = { RequestMethod.GET })
	public String phoneValtion(HttpServletRequest request, Model model) {
		return "user/phonevaltion";
	}
}
