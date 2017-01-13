<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>showitem</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/cart/showitem.css'/>">
	<script src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='../static/js/round.js'/>"></script>
<style type="text/css">
#addr{width: 500px; height: 32px;border: 1px solid #7f9db9; padding-left: 10px; line-height: 32px;}
</style>

<script type="text/javascript">
	//计算合计
	$(function() {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text(round(total, 2));
	});
</script>
  </head>
  
  <body>
<form id="form1" action="<c:url value='/jsps/order/ordersucc.jsp'/>" method="post">
	<input type="hidden" name="cartItemIds" value=""/>
	<input type="hidden" name="method" value=""/>
<table width="95%" align="center" cellpadding="0" cellspacing="0">
	<tr bgcolor="#efeae5">
		<td width="400px" colspan="5"><span style="font-weight: 900;">生成订单</span></td>
	</tr>
	<tr align="center">
		<td width="10%">&nbsp;</td>
		<td width="50%">图书名称</td>
		<td>单价</td>
		<td>数量</td>
		<td>小计</td>
	</tr>



	<tr align="center">
		<td align="right">
			<a class="linkImage" href="<c:url value='/jsps/book/desc.jsp'/>"><img border="0" width="54" align="top" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/></a>
		</td>
		<td align="left">
			<a href="<c:url value='/jsps/book/desc.jsp'/>"><span>Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）</span></a>
		</td>
		<td>&yen;40.7</td>
		<td>1</td>
		<td>
			<span class="price_n">&yen;<span class="subtotal">40.7</span></span>
		</td>
	</tr>
	
	
	
	
	<tr align="center">
		<td align="right">
			<a class="linkImage" href="<c:url value='/jsps/book/desc.jsp'/>"><img border="0" width="54" align="top" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/></a>
		</td>
		<td align="left">
			<a href="<c:url value='/jsps/book/desc.jsp'/>"><span>Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）</span></a>
		</td>
		<td>&yen;40.7</td>
		<td>1</td>
		<td>
			<span class="price_n">&yen;<span class="subtotal">40.7</span></span>
		</td>
	</tr>






	<tr>
		<td colspan="6" align="right">
			<span>总计：</span><span class="price_t">&yen;<span id="total"></span></span>
		</td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#efeae5"><span style="font-weight: 900">收货地址</span></td>
	</tr>
	<tr>
		<td colspan="6">
			<input id="addr" type="text" name="address" value="北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷"/>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 4px;" colspan="5" align="right">
			<a id="linkSubmit" href="javascript:$('#form1').submit();">提交订单</a>
		</td>
	</tr>
</table>
</form>
  </body>
</html>
