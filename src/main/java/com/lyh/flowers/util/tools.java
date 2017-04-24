package com.lyh.flowers.util;

import java.awt.Color;
import java.util.Random;
import java.util.UUID;



public class tools {
	/**
	 * 返回一个不重复的字符串
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	public static String getVcode() {
		Random random = new Random();
		String strCode = "";
		for (int i = 0; i < 6; i++) {
			String rand = String.valueOf(random.nextInt(10));
			strCode = strCode + rand;
		}
		return strCode;
	}
}
