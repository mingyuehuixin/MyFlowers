<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/user/regist.css'/>">
	<script type="text/javascript" src="<c:url value='../static/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../static/js/user/regist.js'/>"></script>
  </head>
  
  <body>
<div id="divMain">
<div><img src="<c:url value='../static/image/logo.jpg'/>" /></div>
  <div id="divTitle">
    <span id="spanTitle">新用户注册</span>
  </div>
  <div id="divBody">
  
<form:form method="POST" modelAttribute="user" id="registForm">
	<form:input type="hidden" path="uid" id="uid"/> 
    <table id="tableForm">
      <tr>
        <td class="tdText">用户名：</td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="loginname" id="loginname" value="${form.loginname }"/>
        </td>
        <td class="tdError">
          <label class="errorClass" id="loginnameError">${errors.loginname }</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">登录密码：</td>
        <td>
          <input class="inputClass" type="password" name="loginpass" id="loginpass" value="${form.loginpass }"/>
        </td>
        <td>
          <label class="errorClass" id="loginpassError">${errors.loginpass }</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">确认密码：</td>
        <td>
          <input class="inputClass" type="password" name="reloginpass" id="reloginpass" value="${form.reloginpass }"/>
        </td>
        <td>
          <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">Email：</td>
        <td>
          <input class="inputClass" type="text" name="email" id="email" value="${form.email }"/>
        </td>
        <td>
          <label class="errorClass" id="emailError">${errors.email}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">验证码：</td>
        <td>
          <input class="inputClass" type="text" name="verifyCode" id="verifyCode" value="${form.verifyCode }"/>
        </td>
        <td>
          <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <div id="divVerifyCode"><img id="vCode" src="<c:url value='../user/getVerifyCode'/>"/></div>
        </td>
        <td>
          <label><a href="javascript:changeCode()">换一张</a></label>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="image" src="<c:url value='../static/image/regist1.jpg'/>" id="submitBtn"/>
        </td>
        <td>
          <label></label>
        </td>
      </tr>
    </table>
</form:form>   
  </div>
</div>
  </body>
</html>
