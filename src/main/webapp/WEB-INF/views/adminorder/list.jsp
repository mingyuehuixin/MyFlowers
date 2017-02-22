<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单列表</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/pager/pager.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/css.css'/>" />
<style type="text/css">
	table {
		font-size: 10pt;
	}
	td {
		padding-left: 5px;
	}
	body {
		font-size: 10pt;
		color: #404040;
	}
	.divMain {
		width: 1000px;
		margin-left: 150px;
	}
	.pLink {
		margin-left: 150px;
	}
	.title {
		border: 1px solid #d0d0d0;
		background: url(../static/image/bg_btns.png) repeat-x;
		background-position: 0 -132px;
		margin-left: 2px;
		height: 30px;
		width: 99.8%;
	}
	.price_t {
		color: #c30;
		font-weight: bold;
		padding-right: 10px;
		font-family: Arial;
		font-size: 10pt;
	}
	.tt {
		background-color: #efeae5;
		height: 25px;
		font-family: Arial;
		color: #878787;
	}
</style>
</head>

<body>
	<div class="divMain">
		<div class="title">
			<div style="margin-top: 7px;">
				<span style="margin-left: 150px; margin-right: 280px;">商品信息</span> 
				<span style="margin-left: 40px; margin-right: 100px;">金额</span>
				<span style="margin-left: 50px; margin-right: 53px;">订单状态</span>
				<span style="margin-left: 100px;">操作</span>
			</div>
		</div>
		<br />
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
			<c:forEach items="${pb.beanList }" var="order">
				<tr class="tt">
					<td width="320px">订单号：<a href="<c:url value='../../orderM/load/${order.oid }'/>">${order.oid }</a></td>
					<td width="200px">下单时间：${order.ordertime }</td>
					<td width="178px">&nbsp;</td>
					<td width="205px">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr style="padding-top: 10px; padding-bottom: 10px;">
					<td colspan="2">
						<c:forEach items="${order.orderItemList }" var="orderItem">
							<img border="0" width="70" src="<c:url value='/${orderItem.image_b }'/>" />
						</c:forEach></td>
					<td style="padding-left: 0">
						<span class="price_t">&yen;${order.total }</span>
					</td>
					<td><c:choose>
							<c:when test="${order.status eq 1 }">(等待付款)</c:when>
							<c:when test="${order.status eq 2 }">(准备发货)</c:when>
							<c:when test="${order.status eq 3 }">(等待确认)</c:when>
							<c:when test="${order.status eq 4 }">(交易成功)</c:when>
							<c:when test="${order.status eq 5 }">(已取消)</c:when>
						</c:choose>
					</td>
					<td><a href="<c:url value='../../orderM/load/${order.oid }'/>">查看</a>
						<br />
						<c:if test="${order.status eq 1 }">
							<a href="<c:url value='../../orderM/cancle/${order.oid }'/>">取消</a>
							<br />
						</c:if> <c:if test="${order.status eq 2 }">
							<a href="<c:url value='../../orderM/deliver/${order.oid }'/>">发货</a>
							<br />
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		
		<%@include file="../pager/pager.jsp"%>
	</div>
</body>
</html>
