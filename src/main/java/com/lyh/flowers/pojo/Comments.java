package com.lyh.flowers.pojo;

import java.util.Date;

public class Comments {
	private String commentId;//主键
	private String uid;//外键
	private String fid;//外键
	private String cgood;//评价商品
	private String cservice;//评价服务
	private String cpicture;//晒图
	private String cdescribe;//描述相符
	private String storeservice;//店家服务
	private String logistics;//物流服务
	private String attitude;//快递员态度
	private String anony;//匿名评价
	private String commenttime;//评论时间
	
	public String getcommentId() {
		return commentId;
	}
	public void setcommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getCgood() {
		return cgood;
	}
	public void setCgood(String cgood) {
		this.cgood = cgood;
	}
	public String getCservice() {
		return cservice;
	}
	public void setCservice(String cservice) {
		this.cservice = cservice;
	}
	public String getCpicture() {
		return cpicture;
	}
	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}
	public String getcdescribe() {
		return cdescribe;
	}
	public void setcdescribe(String cdescribe) {
		this.cdescribe = cdescribe;
	}
	public String getStoreservice() {
		return storeservice;
	}
	public void setStoreservice(String storeservice) {
		this.storeservice = storeservice;
	}
	public String getLogistics() {
		return logistics;
	}
	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}
	public String getAttitude() {
		return attitude;
	}
	public void setAttitude(String attitude) {
		this.attitude = attitude;
	}
	public String getAnony() {
		return anony;
	}
	public void setAnony(String anony) {
		this.anony = anony;
	}
	public String getCommenttime() {
		return commenttime;
	}
	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	
	
	
	
}
