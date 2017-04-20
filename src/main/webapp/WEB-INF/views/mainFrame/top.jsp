<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>top</title>
<link rel="stylesheet" href="<c:url value='../static/css/top.css'/>" type="text/css" media="all">

</head>
<body>

<c:choose>
	<c:when test="${empty sessionScope.sessionUser }">	
	<div id="PanelTop" class="warp">
		<ul id="TopMenu" class="fr">
			<li><a href="#">帮助中心</a></li>
			<li><a
				href="javascript:addBookmark('玫瑰之约网上鲜花店','http://localhost:8080/org.lyh.flowers/');">收藏本站</a></li>
		</ul>
		<p id="WelcomeText" class="fr">
			您好，欢迎访问玫瑰之约网上鲜花商城！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="../user/login" target="_parent">登录</a>]&nbsp;[<a
				href="../user/regist" target="_parent">免费注册</a>]
		</p>
	</div>
	<div id="PanelHead" class="warp">
		<p id="Logo" class="fl">
			<a href="#" ><img src="../static/image/logo.jpg" ></a>
		</p>
		<div class="fr" style="padding: 12px;">
			<img src="../static/image/header.png">
		</div>
	</div>
	
	
	</c:when>
	<c:otherwise>
	<div id="PanelTop" class="warp">
		      当前会员：${sessionScope.sessionUser.loginname }&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='../cart/cartlist'/>" target="body">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='../order/orderlist'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='../address/showAddress'/>" target="body">地址管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='../user/changePwd'/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='../user/quit'/>" target="_parent">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="#" >帮助中心</a>	
		
	</div>
	<div id="PanelHead" class="warp">
		<p id="Logo" class="fl">
			<a href="#" ><img src="../static/image/logo.jpg" ></a>
		</p>
		
		<div class="fr" style="padding: 12px;">
			<img src="../static/image/header.png">
		</div>
	</div>
	
	</c:otherwise>
</c:choose>

	<div id="PanelNav" class="frameMarginBot warp">
		<div id="MainNavBox">
		<form target="body" action="<c:url value='../flower/seach'/>" method="post" id="form1">
			<div id="SchBox" class="fr">
				<p class="fr">
					<a href="javascript:document.getElementById('form1').submit();" class="btnSeachGoods">搜索</a>
				</p>
				<input id="schKeyword" name="schKeyword" value="" type="text">
			</div>
		</form>
			<ul id="NavBox">
				<li><p>
						<a href="../mainFrame/index" target="_parent">首页</a>
					</p></li>
				<li><p class="Over">
						<a href="../flower/flowerList/40001" title="情人节专栏" target="body">情人节专栏</a>
					</p></li>
				
				<li><p class="">
						<a href="../flower/flowerList/i0010" title="开业花篮" target="body">开业花篮</a>
					</p></li>
				<li><p class="">
						<a href="../flower/flowerList/50011" title="99朵玫瑰" target="body">99朵玫瑰</a>
					</p></li>
			</ul>
		</div>
		<div id="SubNavBox">
			<ul class="fl">
				<li><a href="<c:url value='../mainFrame/news'/>" title="新闻中心" target="body">新闻中心</a></li>
				<li><a href="<c:url value='../mainFrame/flowersaying'/>" title="花语" target="body">花语</a></li>
				<li><a href="<c:url value='../mainFrame/contact'/>" title="联系我们" target="body">联系我们</a></li>
				<li><a href="<c:url value='../mainFrame/about'/>" title="关于我们" target="body">关于我们</a></li>
			</ul>
			<p class="fr"></p>
		</div>
	</div>
</body>
</html>