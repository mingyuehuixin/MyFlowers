<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>分类列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/css.css'/>">
  <style type="text/css">
  body {background: rgb(254, 238, 189);}
table {
	font-family: 宋体;
	font-size: 11pt;
	border-color: rgb(78, 78, 78);
	width: 60%;
}
td {padding: 5px;}
.trTitle {
	background: rgb(78, 78, 78);
	color: #fff;
}
.trOneLevel {
	background-color: #fff;
	font-weight: 900;}
.captionAddOneLevel {line-height: 30px;}
.trTwoLevel {text-align: right;font-size: 10pt;}
 </style>
  
  </head>
  
  <body>
    <h2 style="text-align: center;">分类列表</h2>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<caption class="captionAddOneLevel">
    	  <a href="<c:url value='/category/addparent'/>">添加一级分类</a>
    	</caption>
    	<tr class="trTitle">
    		<th>分类名称</th>
    		<th>描述</th>
    		<th>操作</th>
    	</tr>
    	
<c:forEach items="${parents }" var="parent">    	
    	<tr class="trOneLevel">
    		<td width="200px;">${parent.cname }</td>
    		<td>${parent.cdesc }</td>
    		<td width="200px;">
    		  <a href="<c:url value='/category/addchild/${parent.cid }'/>">添加二级分类</a>
    		  <a href="<c:url value='/category/editparent/${parent.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该一级分类？')" href="<c:url value='/category/deleteparent/${parent.cid }'/>">删除</a>
    		</td>
    	</tr>
   <c:forEach items="${parent.children }" var="child">
    	<tr class="trTwoLevel">
    		<td>${child.cname }</td>
    		<td>${child.cdesc }</td>
    		<td width="200px;" align="right">
    		  <a href="<c:url value='/category/editchild/${child.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value='/category/deletechild/${child.cid }'/>">删除</a>
    		</td>
    	</tr>
   </c:forEach>
</c:forEach>
    </table>
  </body>
</html>
