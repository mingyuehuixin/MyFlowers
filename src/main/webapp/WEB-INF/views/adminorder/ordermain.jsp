<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>flower_main.jsp</title>
    	
<style type="text/css">
	body {
		text-align: center;
		margin: 0px;}
	.table {
		width: 100%;
		height: 100%;
		border-collapse: collapse; /*单线的列表边框*/}
	#headertr{height: 5px;}
	.pLink {
		margin-left: 160px;
	}
	iframe {
		width: 100%;
		height: 100%;}
</style>
  </head>
  
  <body>
 
<table class="table" align="center" width="100%" height="100%" border="0">
	<tr id="headertr">
		<td>
		<p class="pLink">
		<a href="<c:url value='../orderM/findbystatus/1'/>" target="center">未付款</a> | 
		<a href="<c:url value='../orderM/findbystatus/2'/>"	target="center">已付款</a> |
	    <a href="<c:url value='../orderM/findbystatus/3'/>"	target="center">已发货</a> | 
	    <a href="<c:url value='../orderM/findbystatus/4'/>"	target="center">交易成功</a> | 
	    <a href="<c:url value='../orderM/findbystatus/5'/>"	target="center">已取消</a>
		</p>
		</td>
	</tr>
	<tr>
		<td>
			<iframe frameborder="0" src="<c:url value='../orderM/orderlist'/>" name="center"></iframe>
		</td>
	</tr>
</table>

  </body>
</html>
