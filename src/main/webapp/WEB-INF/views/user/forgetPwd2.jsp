<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>

<link type="text/css" href="<c:url value='../static/css/user/forgetpwd.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/user/forgetpwd.js'/>"></script>

<script type="text/javascript">

 function changItem(){
	 var objS = document.getElementById("select1");
	 var value = objS.options[objS.selectedIndex].value;
	// alert(value);
	 if(value=="0"){
		 $(".sel-yzsj").show();
		 $(".sel-yzyx").hide();
		 }
	 else if(value=="1"){
		 $(".sel-yzsj").hide();
		 $(".sel-yzyx").show();
		 }
 }
 function emailSendCode() {
	// alert("test");
	 var email=$("#email").val();
	// alert(email);
	 
	 $.ajax({
			async:false,
			cache:false,
			url:"../user/emailSendCode",
			data:{email:email},
			type:"POST",
			dataType:"json",
			success:function(result) {
				document.getElementById("emailsendCode").innerHtml="发送成功!";
				return false;
			}
		});
	
}
</script>
</head>

<body onload="changItem()" >
  <br><br>
   <h3 id="titleH">${errorMsg }</h3>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写用户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     
     <h3 id="titleH">${errorMsg }</h3>
     
     
     <form action="../user/forgotPassword3" method="POST" class="forget-pwd">
       <dl>
        <dt>验证方式：</dt>
        <dd>
         <select  id="select1" onchange="changItem()" >
          <option value="0" selected="selected">手机验证</option>
          <option value="1" id="emailsendCode" onclick="emailSendCode()" >邮箱验证</option>
         </select>
        </dd>
        <div class="clears"></div>
       </dl>

       <dl class="sel-yzsj">
        <dt>已验证手机：</dt>
        <dd><input type="text" value="1851****517" readonly  /></dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzyx">
        <dt>已验证邮箱：</dt>
        <dd><input id="email"  type="text" value="${email }" readonly /></dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzyx">
       <dd>邮件已发送到该邮箱，请登录该邮箱进行密码修改！
      
        </dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzsj">
        <dt>号码校验码：</dt>
        <dd><input type="text" class="inputClass" type="text" name="verifyCode" id="verifyCode" />
         <button>获取短信验证码</button></dd>
        <dt>&nbsp;&nbsp;&nbsp;&nbsp;</dt>
        <dd>
        <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
        </dd>
        <div class="clears"></div>
       </dl>
       <div class="sel-yzsj">
       <input type="submit" value="下一步" />
       </div> 
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
  
</body>
</html>