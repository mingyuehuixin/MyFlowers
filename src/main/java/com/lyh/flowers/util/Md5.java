package com.lyh.flowers.util;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;


public class Md5 {
	public static String md5(String messages) {
		try {
			
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			
			String newstr = base64en.encode(md5.digest(messages.getBytes("utf-8")));
			return newstr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

//	public static void main(String[] args) {
//		System.out.println(md5("QQ.com22"));
//	}

}
