package com.lyh.flowers.pojo;

//<<<<<<< HEAD
//public class Book {
//	private String id;
//	private String bookName;
//	private String ahthorname;
//	private String issuedate;
//	private String classify;
//	private String description;
//	private String status;
//	private String createtime;
//	private String lastupdatetime;
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getBookName() {
//		return bookName;
//	}
//	public void setBookName(String bookName) {
//		this.bookName = bookName;
//	}
//	public String getAhthorname() {
//		return ahthorname;
//	}
//	public void setAhthorname(String ahthorname) {
//		this.ahthorname = ahthorname;
//	}
//	public String getIssuedate() {
//		return issuedate;
//	}
//	public void setIssuedate(String issuedate) {
//		this.issuedate = issuedate;
//	}
//	public String getClassify() {
//		return classify;
//	}
//	public void setClassify(String classify) {
//		this.classify = classify;
//	}
//	public String getDescription() {
//		return description;
//	}
//	public void setDescription(String description) {
//		this.description = description;
//	}
//	public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
//	public String getCreatetime() {
//		return createtime;
//	}
//	public void setCreatetime(String createtime) {
//		this.createtime = createtime;
//	}
//	public String getLastupdatetime() {
//		return lastupdatetime;
//	}
//	public void setLastupdatetime(String lastupdatetime) {
//		this.lastupdatetime = lastupdatetime;
//	}
//
//=======


public class Book {

	private String id;   //ä¸»é”®
	private String bookname;//ä¹¦å��
	private String authorname;//ä½œè€…
	private String issuedate;//å‡ºç‰ˆæ—¶é—´
	private String classify;// åˆ†ç±»
	private String description;//ç®€ä»‹
	private String status;//çŠ¶æ€�
	private String createtime;//åˆ›å»ºæ—¶é—´
	private String lastupdatetime;//æœ€å�Žæ›´æ–°æ—¶é—´
	
	
	@Override
	public String toString() {
		return "Book [id=" + id + ", bookname=" + bookname + ", authorname="
				+ authorname + ", issuedate=" + issuedate + ", classify="
				+ classify + ", description=" + description + ", status="
				+ status + ", createtime=" + createtime + ", lastupdatetime="
				+ lastupdatetime + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(String issuedate) {
		this.issuedate = issuedate;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getLastupdatetime() {
		return lastupdatetime;
	}
	public void setLastupdatetime(String lastupdatetime) {
		this.lastupdatetime = lastupdatetime;
	}
//>>>>>>> refs/remotes/choose_remote_name/master
}
