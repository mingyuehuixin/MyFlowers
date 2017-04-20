package com.lyh.flowers.pojo;

public class Address {
	private String uid;//外键
	private String adid;//主键
	private String adprovince;//省
	private String adcity;//市
	private String addistrict;//区
	private String adstreet;//街道
	private String adphone;//收货人电话
	private String adname;//收货人姓名
	private String adpostcode;//邮政编码
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getAdid() {
		return adid;
	}
	public void setAdid(String adid) {
		this.adid = adid;
	}
	public String getAdprovince() {
		return adprovince;
	}
	public void setAdprovince(String adprovince) {
		this.adprovince = adprovince;
	}
	public String getAdcity() {
		return adcity;
	}
	public void setAdcity(String adcity) {
		this.adcity = adcity;
	}
	
	public String getAddistrict() {
		return addistrict;
	}
	public void setAddistrict(String addistrict) {
		this.addistrict = addistrict;
	}
	public String getAdstreet() {
		return adstreet;
	}
	public void setAdstreet(String adstreet) {
		this.adstreet = adstreet;
	}
	public String getAdphone() {
		return adphone;
	}
	public void setAdphone(String adphone) {
		this.adphone = adphone;
	}
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
	}
	public String getAdpostcode() {
		return adpostcode;
	}
	public void setAdpostcode(String adpostcode) {
		this.adpostcode = adpostcode;
	}
	@Override
	public String toString() {
		return "Address [uid=" + uid + ", adid=" + adid + ", adprovince="
				+ adprovince + ", adcity=" + adcity + ", addistrict="
				+ addistrict + ", adstreet=" + adstreet + ", adphone=" + adphone
				+ ", adname=" + adname + ", adpostcode=" + adpostcode + "]";
	}
	
	
}
