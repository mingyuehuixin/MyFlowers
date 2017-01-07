package com.lyh.flowers.pojo;

public class BookSelectType {

	private String bookName;
	private String authorName;
	
	private String issueDate;
	
	private String classify;
	private String status;
	
	private int start;
	private int limit;
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorname() {
		return authorName;
	}
	public void setAuthorname(String authorname) {
		this.authorName = authorname;
	}
	public String getIssuedate() {
		return issueDate;
	}
	public void setIssuedate(String issuedate) {
		this.issueDate = issuedate;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
