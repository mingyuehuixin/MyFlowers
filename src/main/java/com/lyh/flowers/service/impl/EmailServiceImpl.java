package com.lyh.flowers.service.impl;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.lyh.flowers.pojo.User;
import com.lyh.flowers.service.IEmailService;

import freemarker.template.Template;


@Service("emailService")
public class EmailServiceImpl implements IEmailService {

	private JavaMailSender sender=null;
	private FreeMarkerConfigurer freeMarkerConfigurer=null; 
	private static final String ENCODING = "utf-8";

	public void setSender(JavaMailSender sender) {
		this.sender = sender;
	}

	public void setFreeMarkerConfigurer(FreeMarkerConfigurer freeMarkerConfigurer) {
		this.freeMarkerConfigurer = freeMarkerConfigurer;
	}
	
	
	 /** 
	     * �����ʼ� 
	     * @param root �洢��̬��ݵ�map 
	     * @param toEmail �ʼ���ַ 
	     * @param subject �ʼ����� 
	     * @return 
	     */  
	    public boolean sendTemplateMail(Map<String,Object> root,String toEmail,String subject,String templateName){    
	        try {  
	        	
	            MimeMessage msg=null;
	            msg=sender.createMimeMessage(); 
	            System.out.println("msg="+msg);
	            MimeMessageHelper helper=new MimeMessageHelper(msg,false,ENCODING);//������html�ʼ�������mulitpart����    
	            helper.setFrom("1286005044@qq.com");    
	            helper.setTo(toEmail);    
	            helper.setSubject(subject);    
	            String htmlText=getMailText(root,templateName);//ʹ��ģ�����html�ʼ�����    
	            helper.setText(htmlText, true);    
	            sender.send(msg);  
	            System.out.println("�ɹ�����ģ���ʼ�");    
	            return true;  
	        } catch (MailException e) {  
	            System.out.println("ʧ�ܷ���ģ���ʼ�");   
	            e.printStackTrace();  
	            return false;  
	        } catch (MessagingException e) {  
	          System.out.println("ʧ�ܷ���ģ���ʼ�");   
	            e.printStackTrace();  
	            return false;  
	        }    
	         
	    }    

	
	 /** 
	     * ���htmlģ���ַ� 
	     * @param root �洢��̬��ݵ�map 
	     * @return 
	     */  
	    private String getMailText(Map<String,Object> root,String templateName){  
	         String htmlText="";    
	            try {    
	                //ͨ��ָ��ģ�����ȡFreeMarkerģ��ʵ��    
	                Template tpl=freeMarkerConfigurer.getConfiguration().getTemplate(templateName);    
	                htmlText=FreeMarkerTemplateUtils.processTemplateIntoString(tpl,root);    
	            } catch (Exception e) {    
	                e.printStackTrace();    
	           }    
	            
	          return htmlText;  
	            
	    }

	@Override
	public void sendMail(User user) {
		
		System.out.println("�ʼ����ͳɹ�...");
		
	}  


}
