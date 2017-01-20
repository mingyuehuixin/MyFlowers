<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
  <head>
    
    <title>main</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
 <style type="text/css">
	 * {font-size: 10pt;}
	body {text-align: center; margin: 0px;}
	.table {
		width: 100%;
		height: 100%;
		border: 1px solid gray; /*固定边框,1像素*/
		border-collapse: collapse; /*单线的列表边框*/
	}
	.table td {
		border: 1px solid gray; /*固定边框,1像素*/
	}
	iframe {width: 100%;height: 100%;}
 </style>
  </head>
  
 <body>
	<table class="table" align="center">
		<tr>
			<td colspan="2" align="center" height="100px;">
				<iframe frameborder="0" src="<c:url value='/admin/top'/>" name="top"></iframe>
			</td>
		</tr>
		<tr>
			<td>
				<iframe frameborder="0" src="<c:url value='/admin/body'/>" name="body"></iframe>
			</td>
		</tr>
	</table>
  </body>
</html>
