package com.lyh.flowers.pojo;

public class Employee {

private String id;
private String empname;
private String email;
private String empno;
private String phonenumber;
private String sex;
private String status;
private String isadmin;
private String createtime;
private String lastupdatetime;
private String password;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
@Override
public String toString() {
	return "Employee [id=" + id + ", emoname=" + empname + ", email=" + email
			+ ", empno=" + empno + ", phonenumber=" + phonenumber + ", sex="
			+ sex + ", status=" + status + ", isadmin=" + isadmin
			+ ", createtime=" + createtime + ", lastupdatetime="
			+ lastupdatetime + ", password=" + password + "]";
}
public String getEmpname() {
	return empname;
}
public void setEmpname(String emoname) {
	this.empname = emoname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEmpno() {
	return empno;
}
public void setEmpno(String empno) {
	this.empno = empno;
}
public String getPhonenumber() {
	return phonenumber;
}
public void setPhonenumber(String phonenumber) {
	this.phonenumber = phonenumber;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getIsadmin() {
	return isadmin;
}
public void setIsadmin(String isadmin) {
	this.isadmin = isadmin;
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
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}


}
