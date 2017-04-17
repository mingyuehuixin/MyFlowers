<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>玫瑰之约网上鲜花商城</title>
	
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<style type="text/css">
		*{font-size:10pt;}
		body{text-align:center;
		background-image: url("./static/image/bg1.gif");
		}
		.table{width:1010px;height:200%;border-collapse: collapse;}
		.tdTop {text-align: left; height: 180px;}
		.tdLeft{width: 240px;}
		.tdBody{border-top-width: 0px;height: 100%;}
		iframe {width: 100%;height: 100%;}
	
	</style>
  </head>
  
  <body>
  <div></div>
<table class="table" align="center">
	<tr class="trTop">
		<td colspan="2" class="tdTop">
			<iframe scrolling="no" frameborder="0" src="<c:url value='mainFrame/top'/>" name="top"></iframe>
		</td>
	</tr>
	<tr>
		<td class="tdLeft" rowspan="2">
			<iframe scrolling="no" frameborder="0" src="<c:url value='mainFrame/left'/>" name="left"></iframe>
		</td>
		<td class="tdBody" style="border-top-width: 0px;">
			<iframe scrolling="no" frameborder="0" src="<c:url value='mainFrame/body'/>" name="body"></iframe>
		</td>
	</tr>
</table>
  </body>
</html>
