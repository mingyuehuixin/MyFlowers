<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>信息板</title>

<style type="text/css">
body {
	font-size: 10pt;
	color: #404040;
	font-family: SimSun;
}

.divBody {
	margin-left: 15%;
}

.divTitle {
	text-align: left;
	width: 900px;
	height: 25px;
	line-height: 25px;
	background-color: #efeae5;
	border: 5px solid #efeae5;
}

.divContent {
	width: 900px;
	height: 230px;
	border: 5px solid #efeae5;
	margin-right: 20px;
	margin-bottom: 20px;
}

.spanTitle {
	margin-top: 10px;
	margin-left: 10px;
	height: 25px;
	font-weight: 900;
}

a {
	text-decoration: none;
}

a:visited {
	color: #018BD3;
}

a:hover {
	color: #FF6600;
	text-decoration: underline;
}

<
style type ="text/css">.shade {
	width: 100%;
	height: 100%;
	overflow-y: hidden;
	position: fixed;
	z-index: 100;
	top: 0;
	background: black;
	opacity: 0.5;
}

.shade_content {
	width: 500px;
	border-radius: 10px;
	height: 350px;
	position: fixed;
	z-index: 101;
	top: 45%;
	left: 50%;
	margin-top: -150px;
	margin-left: -300px;
	background: #FFFFFF;
}

.shade_content_div {
	margin: 0px auto;
	text-align: center;
	height: 100%;
	width: 80%;
	margin-top: 20px;
}

.shade_title {
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	font: "微软雅黑";
}

.btn_remove {
	border-radius: 5px;
	background: #31B0D5;
	color: white;
	width: 150px;
	height: 40px;
	border: 0px;
	outline: 0px;
	font-size: 15px;
}

.sub_set {
	border-radius: 5px;
	background: #31B0D5;
	color: white;
	width: 150px;
	height: 40px;
	border: 0px;
	outline: 0px;
	font-size: 15px;
}

.input_style {
	height: 30px;
	border-radius: 5px;
	width: 180px;
	outline: 0px;
	border: 1px solid #CCCCCC;
}

.span_style {
	font-size: 18px;
}

.shade_from {
	margin-top: 20px;
	text-align: center;
	margin-left: 60px;
}

.shade_from .col-xs-12 {
	margin-top: 20px;
	float: left;
}

.shade_colse {
	text-align: right;
	margin-top: 10px;
}

.shade_colse button {
	font-size: 20px;
	color: white;
	outline: 0px;
	margin-right: 10px;
	border-radius: 50px;
	background: red;
	height: 30px;
	width: 30px;
	border: 0px;
}

</style>
<script type="text/javascript">
	function onclick_open() {
		$(".shade_content").show();
		$(".shade").show();
		var input_out = $(".input_style");
		for (var i = 0; i <= input_out.length; i++) {
			if ($(input_out[i]).val() != "") {
				$(input_out[i]).val("");
			}
		}
	}
	function onclick_close() {
		var shade_content = $(".shade_content");
		var shade = $(".shade");
		if (confirm("确认关闭么！此操作不可恢复")) {
			shade_content.hide();
			shade.hide();
		}
	}
</script>
</head>

<body>
	
	<div class="divBody">
		<div class="divTitle">
			<span class="spanTitle">${title }</span>
		</div>
		<div class="divContent">
			<div style="margin: 20px;">
				<img style="float: left; margin-right: 30px;"
					src="<c:url value='${img }'/>" width="150" /> <span
					style="font-size: 30px; color: #c30; font-weight: 900;">${msg }</span>
				<br /> <br /> <br /> <br /> <span style="margin-left: 50px;"><a
					target="_top" href="<c:url value='../user/login'/>">登录</a></span> <span
					style="margin-left: 50px;"><a target="_top"
					href="<c:url value='/index.jsp'/>">主页</a></span>
			</div>
		</div>
	</div>

	<div class="shade"></div>
	<div class="shade_content">
		<div class="col-xs-12 shade_colse">
			<button onclick="javascript:onclick_close();">x</button>
		</div>
		<div class="nav shade_content_div">
			<div class="col-xs-12 shade_title">绑定手机</div>
			<div class="col-xs-12 shade_from">

				<div class="col-xs-12">
					<span class="span_style" id="">手机号码</span> <input
						class="input_style" type="text" name="adphone" id="adphone"
						value="${phone }" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
				</div>
				<label class="errorClass" id="adphoneError">${errors.adphone }</label>

				<div class="col-xs-12">
					<span class="span_style" class="span_sty" id="">验&nbsp;证&nbsp;码&nbsp;</span>
					<input class="input_style" type="text" name="verifyCode"
						id="verifyCode" /> <input class="checkCode" type="button" id="btn"
						onclick="getVcode()" value="获取验证码" />
				</div>
				<label class="errorClass" id="adnameError">${errors.adname }</label>

				<div class="col-xs-12">
					<input class="btn_remove" type="button" id=""
						onclick="javascript:onclick_close();" value="取消" />
						 <input
						type="submit" class="sub_set" id="sub_setID"
						onclick="javascript:onclick_submit();" value="提交" />
				</div>

			</div>
		</div>
	</div>
</body>
</html>
