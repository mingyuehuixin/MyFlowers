<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>花束分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/pager/pager.css'/>" />
<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>

 <style type="text/css">
	.pic { display: block; position: relative; margin-bottom: 3px; width: 100px; height: 150px; }
	.inner {overflow:hidden;text-overflow:ellipsis;word-break:keep-all;white-space:nowrap; border: solid 3px #fff; padding: 16px 16px 0; position: absolute; }
	li {float: left; width: 140px; height: 319px; line-height: 18px; position: relative; border-bottom: solid 1px #e5e5e5; }
	li div {margin-bottom:1px;margin-left: 10px;}
	
	body,ul, li, p,img, div { margin: 0; padding: 0; list-style-type: none; font-size: 12px;}
	.price {padding-bottom: 3px; color: #878787; }
	.price_n {color: #c30; font-weight: bold; padding-right: 10px; font-family: Arial; }
	.price_s {color: #c30; font-family: Arial; }
	.price_r {color: #878787; text-decoration: line-through; padding-right: 10px; font-family: Arial; }
	#bookname {text-decoration:underline; color:#555555; display: block; overflow: hidden; width: 200px; font-family: Arial; }
	#bookname:hover {color:#FF6600; }
	.inner a {color: #018BD3;}
	.inner a:hover {color:#FF6600; }
	.inner a:VISITED {color:#018BD3;}
	.divBook{float:left;}
 </style>
 <script type="text/javascript">
	 $(function() {
			$(".inner").hover(function() {
				$(this).css("border", "3px solid #FFCFB1");
			}, function() {
				$(this).css("border", "3px solid #ffffff");
			});
		});
 </script>
  </head>
  
  <body>
<div class="divBook">
<ul>


<c:forEach items="${pb.beanList }" var="flower">
 <li>
  <div class="inner">
    <a class="pic" href="<c:url value='../load/${flower.fid }'/>">
       <img src="<c:url value='/${flower.image_b }'/>" border="1"/>
    </a>
    <p class="price" >
		<span class="price_n">&yen;${flower.currPrice }</span>
		<span class="price_r">&yen;${flower.price }</span>
		(<span class="price_s">${flower.discount }折</span>)
	</p>
	<p>花束名：<a id="flowername" title="${flower.fname }" href="<c:url value='../../flowerM/load/${flower.fid }'/>">${flower.fname }</a></p>
  </div>
 </li>
</c:forEach>


</ul>
</div>
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="../pager/pager.jsp" %>
</div>
  </body>
 
</html>

