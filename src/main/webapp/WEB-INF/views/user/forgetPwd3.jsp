<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<c:url value='../static/css/user/forgetpwd.css'/>" rel="stylesheet" />

<script type="text/javascript" src="<c:url value='../static/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/user/forgetpwd3.js'/>"></script>

<title>找回密码</title>
</head>
<body>
   <br><br>
   <h3 id="titleH">${errorMsg }</h3>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form id="modifyFrom" action="../user/forgotPassword4" method="POST" class="forget-pwd">
        <input name="uid" id="uid" type="hidden" value="${uid }">
       <dl>
        <dt>新密码：</dt>
        <dd><input class="inputClass" name="loginpass" id="loginpass" type="password" value="${loginpass }" />
        <label class="errorClass" id="loginpassError">${errors.loginpass}</label>
        </dd>
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>确认密码：</dt>
        <dd><input class="inputClass" name="reloginpass" id="reloginpass" type="password" value="${reloginpass }" />
        <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
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
       <div class="subtijiao"><input type="submit" value="下一步" /></div> 
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
  
</body>
</html>
