<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>top</title>
    <base target="body">
	
<style type="text/css">
	body {font-size: 10pt;}
	a {color: #aaa;}
</style>
  </head>
  
<body style="background: rgb(78,78,78);color: #fff;">
<h1 style="text-align: center; line-height: 30px;">玫瑰之约网上鲜花商城后台管理</h1>
<div style="line-height: 10px;">
	<span>管理员：${sessionScope.admin.adminname }</span>
	<a target="_top" href="<c:url value='../admin/loginout'/>">退出</a>
	<span style="padding-left:50px;">
		<a href="<c:url value='../category/categorylist'/>">分类管理</a>
		<a href="<c:url value='../flowerM/main'/>">花束管理</a>
		<a href="<c:url value='../orderM/ordermain'/>">订单管理</a>
	</span>
</div>
  </body>
</html>
