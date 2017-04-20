<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找回密码</title>

<link type="text/css" href="<c:url value='../static/css/user/forgetpwd.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='../static/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/user/forgetpwd.js'/>"></script>

</head>

<body>
 	<br>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写用户名</strong></div>
       <div class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <h3 id="titleH">${errorMsg }</h3>
     <form id="forgetpwdFrom" action="../user/forgotPassword" method="POST" class="forget-pwd">
       <dl>
        <dt>用户名：</dt>
        <dd>
            <input class="inputClass" type="text" id="loginname" name="loginname" value="" />
            <label class="errorClass" id="loginnameError">${errors.loginname }</label>
        </dd>
    
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>验证码：</dt>
        <dd>
         <input class="inputClass" type="text" name="verifyCode" id="verifyCode" value="${verifyCode }"/>
         <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>  
        </dd>
        <dd>
	         <div class="yanzma">
	             <img id="vCode" src="<c:url value='../user/getVerifyCode'/>"/>
	             <a id="verifyCode" href="javascript:changeCode()">换一张</a>
	         </div>
        </dd>
        <div class="clears"></div>
       </dl>
       <div class="subtijiao">
	       <!--  
	       <input type="image" id="submit" src="<c:url value='../static/image/login1.jpg'/>" class="loginBtn"/>
	       -->
	       <input type="submit" id="submitForget" value="下一步" />
       </div> 
      </form><!--forget-pwd/-->
     
      
   </div><!--web-width/-->
  </div><!--content/-->
  
</body>
</html>