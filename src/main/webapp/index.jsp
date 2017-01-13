<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
		*{font-size:10pt;}
		body{text-align:center;}
		.table{width:1000px;height:100%;border:1px solid #15B69A;border-collapse: collapse;}
		.table td{border:1px solid #15B69A;}
		.trTop {background: #15B69A;}
		.tdTop {text-align: center; height: 100px;}
		.tdLeft{width: 190px;padding:5px;}
		.tdSearch{height: 45px; border-bottom-width: 0px; padding: 0px; margin: 0px;}
		.tdBody{border-top-width: 0px;}
		iframe {width: 100%;height: 100%;}
	
	</style>
	
  </head>
  
  <body>
<table class="table" align="center">
	<tr class="trTop">
		<td colspan="2" class="tdTop">
			<iframe frameborder="0" src="<c:url value='mainFrame/top'/>" name="top"></iframe>
		</td>
	</tr>
	<tr>
		<td class="tdLeft" rowspan="2">
			<iframe frameborder="0" src="<c:url value='mainFrame/left'/>" name="left"></iframe>
		</td>
		<td class="tdSearch" style="border-bottom-width: 0px;">
			<iframe frameborder="0" src="<c:url value='mainFrame/search'/>" name="search"></iframe>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 0px;">
			<iframe frameborder="0" src="<c:url value='mainFrame/body'/>" name="body"></iframe>
		</td>
	</tr>
</table>
  </body>
</html>
