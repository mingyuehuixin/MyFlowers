<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ordersucc.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/order/ordersucc.css'/>">
  </head>
  
  <body>
<div class="div1">
	<span class="span1">订单已生成</span>
</div>
<div class="div2">
	<img src="<c:url value='/images/duihao.jpg'/>" class="img"/>
	<dl>
		<dt>订单编号</dt>
		<dd>E3A1EB6D0543489F9729B2B5BC5DB365</dd>
		<dt>合计金额</dt>
		<dd><span class="price_t">&yen;203.5</span></dd>
		<dt>收货地址</dt>
		<dd>北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷</dd>
	</dl>
	<span>ITCAST书城感谢您的支持，祝您购物愉快！</span>
	<a href="<c:url value='/jsps/order/pay.jsp'/>" id="linkPay">支付</a>
</div>
  </body>
</html>
