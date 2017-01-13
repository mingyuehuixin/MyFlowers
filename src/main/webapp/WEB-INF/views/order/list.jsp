<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='../static/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
  </head>
  
  <body>
<div class="divMain">
	<div class="divTitle">
		<span style="margin-left: 150px;margin-right: 280px;">商品信息</span>
		<span style="margin-left: 40px;margin-right: 38px;">金额</span>
		<span style="margin-left: 50px;margin-right: 40px;">订单状态</span>
		<span style="margin-left: 50px;margin-right: 50px;">操作</span>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">



		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='../order/desc'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='../order/desc'/>">查看</a><br/>

				<a href="<c:url value='../order/desc'/>">支付</a><br/>
				<a href="<c:url value='../order/desc'/>">取消</a><br/>						

				<a href="<c:url value='../order/desc'/>">确认收货</a><br/>

			</td>
		</tr>















		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
			<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>
		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/jsps/order/desc.jsp'/>">E3A1EB6D0543489F9729B2B5BC5DB365</a></td>
			<td width="200px">下单时间：2013-06-01 19:30:22</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">



	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	

	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>
	<a class="link2" href="<c:url value='/jsps/book/desc.jsp'/>">
	    <img border="0" width="70" src="<c:url value='/book_img/23254532-1_b.jpg'/>"/>
	</a>



			</td>
			<td width="115px">
				<span class="price_t">&yen;203.5</span>
			</td>
			<td width="142px">
			(等待付款)
<!-- 
			(准备发货)
			(等待确认)
			(交易成功)
			(已取消)
 -->
			</td>
			<td>
			<a href="<c:url value='/jsps/order/desc.jsp'/>">查看</a><br/>

				<a href="<c:url value='/jsps/order/desc.jsp'/>">支付</a><br/>
				<a href="<c:url value='/jsps/order/desc.jsp'/>">取消</a><br/>						

				<a href="<c:url value='/jsps/order/desc.jsp'/>">确认收货</a><br/>

			</td>
		</tr>



	</table>
	<br/>
	
</div>
  </body>
</html>
