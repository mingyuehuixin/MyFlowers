<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../static/js/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='../static/css/mymenu.css'/>" type="text/css" media="all">

<style type="text/css">
		* {
			font-size: 10pt;
			text-align: center;
		}
		body {
			margin: 1px;
		}
		a {
			text-decoration: none;
			color: gray;
			font-weight: 900;
		}
		a:hover {
			text-decoration: underline;
			color: gray;
		}
</style>
<script language="javascript">
/*
 * 1. 对象名必须与第一个参数相同！
   2. 第二个参数是显示在菜单上的大标题
 */
var bar = new Q6MenuBar("bar", "玫瑰之约鲜花商城");
$(function() {
	bar.colorStyle = 4;//指定配色样式，一共0,1,2,3,4
	bar.config.imgDir = "<c:url value='../static/image/'/>";//小工具所需图片的路径
	bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥

	<c:forEach items="${parents}" var="parent">
	  <c:forEach items="${parent.children}" var="child">
		bar.add("${parent.cname}", "${child.cname}", "../flower/flowerList/${child.cid}", "body");
	  </c:forEach>
	</c:forEach>
		
		$("#menu").html(bar.toString());
	});
	
</script>
</head>
  
<body>  
  <div id="menu"></div>
</body>
</html>
