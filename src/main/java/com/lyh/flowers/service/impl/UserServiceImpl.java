package com.lyh.flowers.service.impl;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IUserDao;
import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IUserService;
import com.lyh.flowers.util.Md5;
import com.lyh.flowers.util.SendEmailUtil;
import com.lyh.flowers.util.tools;


@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	
//	public static String uuid() {
//		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
//	}
//	
	@Override
	public User getUserById(int userId) {
		return this.userDao.selectByPrimaryKey(userId);
	}
	@Override
	public User loginCheck(String username, String password) {
		return userDao.loginCheck(username, password);
	}
	@Override
	public User findByEmail(String email) {
		return this.userDao.findByEmail(email);
	}
	@Override
	public User findByUserName(String loginname) {
		return this.userDao.findByUserName(loginname);
	}
	@Override
	public void insert(User user) {
		
		user.setUid(tools.uuid());
		user.setStatus(0);
		user.setActivationCode(tools.uuid()+tools.uuid());
		user.setRegistTime(new Date());
		this.userDao.insert(user);
		
		 ///邮件的内容
        StringBuffer sb=new StringBuffer("点击下面链接激活账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8080/org.lyh.flowers/user/activation/");
        sb.append(user.getActivationCode());
        sb.append("\"> 点击此处激活账户");
        sb.append("</a>");
 
        //发送邮件
        SendEmailUtil.send(user.getEmail(), sb.toString());
//        System.out.println("发送邮件");
	}
	
	 /**
     * 处理激活
     */
      ///传递激活码和email过来
    public boolean activation(String validateCode){ 
         //数据访问层，通过email获取用户信息
        User user=userDao.findByCode(validateCode);
        //验证用户是否存在
        if(user!=null) { 
            //验证用户激活状态 
            if(user.getStatus()==0) {
                ///没激活
                Date currentTime = new Date();//获取当前时间 
                Calendar deadline=Calendar.getInstance();
                deadline.setTime(user.getRegistTime());
                deadline.add(Calendar.HOUR_OF_DAY, 48);
                Date lastActivateTime=deadline.getTime();
                //验证链接是否过期
//                currentTime.before(user.getRegistTime());
                if(currentTime.before(lastActivateTime)) { 
                    //验证激活码是否正确 
                    if(validateCode.equals(user.getActivationCode())) { 
                        //激活成功， //并更新用户的激活状态，为已激活
                    	user.setStatus(1);
                    	userDao.updateStatus(user);
                    } else { 
                    	System.out.println("激活码不正确");
                    	return false;
                    } 
                } else {
                	System.out.println("激活码已过期");
                	return false;
                } 
            } else {
            	System.out.println("邮箱已激活，请登录！");
            	return false;
            } 
        } else {
        	System.out.println("该邮箱未注册（邮箱地址不存在");
        	return false;
        } 
        return true;
    }
	/* 生成邮箱链接地址 
     */  
    public String createLink(User user){  
          
        //生成密钥  
        String secretKey=UUID.randomUUID().toString();  
        //设置过期时间  
        Date outDate = new Date(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期  
        System.out.println(System.currentTimeMillis());  
          
        //此处应该更新Studentinfo表中的过期时间、密钥信息  
        user.setOutDate(outDate); 
        user.setValidataCode(secretKey);  
        userDao.updateByPrimaryKey(user);
        //将用户名、过期时间、密钥生成链接密钥  
        String key =user.getUid() + "$" + outDate + "$" + secretKey;  
        System.out.println("key0:"+key);
        String digitalSignature = Md5.md5(key);// 数字签名
        System.out.println("digitalSignature0:"+digitalSignature);
        StringBuffer sb=new StringBuffer("请勿回复本邮件.点击下面的链接,重设密码,本邮件超过30分钟,链接将会失效，需要重新申请找回密码.</br>");
        sb.append("<a href=\"http://localhost:8080/org.lyh.flowers/user/forgotPassword3?sid=");
        sb.append(digitalSignature);
        sb.append("&uid=");
        sb.append(user.getUid());
        sb.append("\"> 点击此重新设置密码");
        sb.append("</a>");
        String emailContent=sb.toString();
        return emailContent;
    }  
    
    
	@Override
	public boolean updatePassWord(String uid, String newpass) {
				
		return userDao.updatePassWord(uid, newpass);
				
	}
	@Override
	public boolean findByUidAndPassword(String uid, String oldpass) {
			int count=userDao.findByUidAndPassword(uid, oldpass);
		return count>0;
	}
//邮件发送校验码
	@Override
	public void emailSendCode(String email) {
		User user=userDao.findByEmail(email);
 
        //发送邮件
        SendEmailUtil.send(email, createLink(user));
	}

	@Override
	public User findByUid(String uid) {
		return userDao.findByUid(uid);
	}
}
