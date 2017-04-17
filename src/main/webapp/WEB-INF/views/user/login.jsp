<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录</title>
    
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/user/login.css'/>">
	<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='../static/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../static/js/user/login.js'/>"></script>
	
	<script type="text/javascript">
	$(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
		// 获取cookie中的用户名
		var loginname = window.decodeURI("${cookie.loginname.value}");
		if("${requestScope.loginname}") {
			loginname = "${requestScope.loginname}";
		}
		$("#loginname").val(loginname);
	});
	</script>
  </head>
  
  <body>
	<div class="main">
	  <div><img src="<c:url value='../static/image/logo.jpg'/>" /></div>
	  <div>
	    <div class="imageDiv"><img class="img" src="<c:url value='../static/image/zj.jpg'/>"/></div>
        <div class="login1">
	      <div class="login2">
            <div class="loginTopDiv">
              <span class="loginTop">会员登录</span>
			 <a href="<c:url value='../user/regist'/>" class="registBtn">注册</a>
            </div>
            
              <form target="_top" action="<c:url value='../user/login'/>" method="post" id="loginForm">
                <input type="hidden" name="method" value="login" />
                  <table>
                    <tr>
                      <td width="50"></td>
                      <td><label class="error" id="msg">${msg }</label></td>
                    </tr>
                    <tr>
                      <td width="50">用户名</td>
                      <td><input class="input" type="text" name="loginname" id="loginname" value="${loginname}"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><label id="loginnameError" class="error"></label></td>
                    </tr>
                    <tr>
                      <td>密　码</td>
                      <td><input class="input" type="password" name="loginpass" id="loginpass" value="${loginpass }"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><label id="loginpassError" class="error"></label></td>
                    </tr>
                    <tr>
                      <td>验证码</td>
                      <td>
                        <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value="${verifyCode }"/>
                        <img id="vCode" src="<c:url value='../user/getVerifyCode'/>"/>
                        <a id="verifyCode" href="javascript:changeCode()">换张图</a>
                      </td>
                    </tr>
                    <tr>
                      <td height="20px">&nbsp;</td>
                      <td><label id="verifyCodeError" class="error"></label></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left">
                        <input type="image" id="submit" src="<c:url value='../static/image/login1.jpg'/>" class="loginBtn"/>
                      </td>
                      <td align="left">
                      <span>
                      <a href="<c:url value='../user/forgotPassword'/>" >忘记密码？</a>
                      </span>
                      </td>
                    </tr>																				
                 </table>
              </form>
               
            </div>
          </div>
        </div>
      </div>
	
  </body>
</html>
	