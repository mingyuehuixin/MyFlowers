package com.lyh.flowers.service;

import java.util.Map;

import com.lyh.flowers.pojo.User;

public interface IEmailService {
	
	public boolean sendTemplateMail(Map<String,Object> root,String toEmail,String subject,String templateName);
	public void sendMail(User user);
}
