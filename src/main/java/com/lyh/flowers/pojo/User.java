package com.lyh.flowers.pojo;

import java.util.Date;

public class User {
	// 对应数据库表
		private String uid;//主键
		private String loginname;//登录名
		private String loginpass;//登录密码
		private String email;//邮箱
		private int status;//状态，true表示已激活，或者未激活

		private String activationCode;//激活码，它是唯一值！即每个用户的激活码是不同的！
		private Date registTime;//注册时间
		
		private String validataCode;//激活码，它是唯一值！即每个用户的激活码是不同的！
		private Date outDate;//注册时间
		
		public int getStatus() {
			return status;
		}
		
		public void setStatus(int status) {
			this.status = status;
		}
		public Date getRegistTime() {
			return registTime;
		}

		public void setRegistTime(Date registTime) {
			this.registTime = registTime;
		}

		// 注册表单
		private String reloginpass;//确认密码
		private String verifyCode;//验证码
//		
		// 修改密码表单
		private String newpass;//新密码

		public String getReloginpass() {
			return reloginpass;
		}

		public void setReloginpass(String reloginpass) {
			this.reloginpass = reloginpass;
		}

		public String getVerifyCode() {
			return verifyCode;
		}

		public void setVerifyCode(String verifyCode) {
			this.verifyCode = verifyCode;
		}

		public String getNewpass() {
			return newpass;
		}

		public void setNewpass(String newpass) {
			this.newpass = newpass;
		}

		public String getUid() {
			return uid;
		}

		public void setUid(String uid) {
			this.uid = uid;
		}

		public String getLoginname() {
			return loginname;
		}

		public void setLoginname(String loginname) {
			this.loginname = loginname;
		}

		public String getLoginpass() {
			return loginpass;
		}

		public void setLoginpass(String loginpass) {
			this.loginpass = loginpass;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

	

		public String getActivationCode() {
			return activationCode;
		}

		public void setActivationCode(String activationCode) {
			this.activationCode = activationCode;
		}

		
		public String getValidataCode() {
			return validataCode;
		}

		public void setValidataCode(String validataCode) {
			this.validataCode = validataCode;
		}

		

		public Date getOutDate() {
			return outDate;
		}

		public void setOutDate(Date outDate) {
			this.outDate = outDate;
		}

		@Override
		public String toString() {
			return "User [uid=" + uid + ", loginname=" + loginname
					+ ", loginpass=" + loginpass + ", email=" + email
					+ ", status=" + status + ", activationCode="
					+ activationCode + ", reloginpass=" + reloginpass
					+ ", verifyCode=" + verifyCode + ", newpass=" + newpass
					+ "]";
		}

		
		
}