<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>支付</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="<c:url value='../../static/css/order/pay.css'/>">
<script type="text/javascript" src="<c:url value='../../static/js/jquery-1.5.1.js'/>"></script>

<script type="text/javascript">
	$(function() {
		$("img").click(function() {
			$("#" + $(this).attr("name")).attr("checked", true);
		});
	});
</script>
</head>

<body>
	<div class="divContent">
		<span class="spanPrice">支付金额：</span><span class="price_t">&yen;${order.total }</span>
		<span class="spanOid">编号：${order.oid }</span>
	</div>
	<form action="<c:url value='../../order/payment/${order.oid }'/>" method="post" id="form1"
		target="_top">
		
		<div class="divBank">
			<div class="divText">选择网上银行</div>
			<div style="margin-left: 20px;">
				<div style="margin-bottom: 20px;">
					<input id="ICBC-NET-B2C" type="radio" name="yh"
						value="ICBC-NET-B2C" checked="checked" /> <img name="ICBC-NET-B2C"
						align="middle" src="<c:url value='../../static/bank_img/icbc.png'/>" />
						 <input
						id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" /> <img
						name="ABC-NET-B2C" align="middle"
						src="<c:url value='../../static/bank_img/abc.png'/>" />
						 <input
						id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" /> <img
						name="CCB-NET-B2C" align="middle"
						src="<c:url value='../../static/bank_img/ccb.png'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					 <input
						id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" /> <img
						name="BOCO-NET-B2C" align="middle"
						src="<c:url value='../../static/bank_img/bcc.png'/>" /> 
					<input id="POST-NET-B2C" type="radio" name="yh"
						value="POST-NET-B2C" /> <img name="POST-NET-B2C" align="middle"
						src="<c:url value='../../static/bank_img/post.png'/>" /> 
					<input
						id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
						name="BOC-NET-B2C" align="middle"
						src="<c:url value='../../static/bank_img/bc.png'/>" /> 
						
				</div>
					
			</div>
			<div style="margin: 40px;">
				<a href="javascript:void $('#form1').submit();" class="linkNext">下一步</a>
			</div>
		</div>
	</form>
</body>
</html>
