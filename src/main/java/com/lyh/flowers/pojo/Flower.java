package com.lyh.flowers.pojo;


public class Flower {
	private String fid;//主键
	private String fname;//花名
	private String material;//材料
	private double price;//市场价
	private double currPrice;//当前价
	private double discount;//折扣
	private String flowersaying;//花语
	private String packing;//包装
	private String target;//对象
	private int branchnumber;//支数
	private String flowercolor;//颜色
	private String type;//类型
	private String makeuse;//用途
	private String cid;//所属分类
	private int orderBy;//支数
	private int commentcount;//所属分类
	private String image_w;//大图路径
	private String image_b;//小图路径
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getCurrPrice() {
		return currPrice;
	}
	public void setCurrPrice(double currPrice) {
		this.currPrice = currPrice;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getFlowersaying() {
		return flowersaying;
	}
	public void setFlowersaying(String flowersaying) {
		this.flowersaying = flowersaying;
	}
	public String getPacking() {
		return packing;
	}
	public void setPacking(String packing) {
		this.packing = packing;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public int getBranchnumber() {
		return branchnumber;
	}
	public void setBranchnumber(int branchnumber) {
		this.branchnumber = branchnumber;
	}
	public String getFlowercolor() {
		return flowercolor;
	}
	public void setFlowercolor(String flowercolor) {
		this.flowercolor = flowercolor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getMakeuse() {
		return makeuse;
	}
	public void setMakeuse(String makeuse) {
		this.makeuse = makeuse;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public int getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}
	public String getImage_w() {
		return image_w;
	}
	public void setImage_w(String image_w) {
		this.image_w = image_w;
	}
	public String getImage_b() {
		return image_b;
	}
	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}
	
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	@Override
	public String toString() {
		return "Flower [fid=" + fid + ", fname=" + fname + ", material="
				+ material + ", price=" + price + ", currPrice=" + currPrice
				+ ", discount=" + discount + ", flowersaying=" + flowersaying
				+ ", packing=" + packing + ", target=" + target
				+ ", branchnumber=" + branchnumber + ", flowercolor="
				+ flowercolor + ", type=" + type + ", makeuse=" + makeuse
				+ ", cid=" + cid + ", orderBy=" + orderBy + ", image_w="
				+ image_w + ", image_b=" + image_b + "]";
	}
	
	
}
