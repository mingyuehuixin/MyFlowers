<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>显示购物车条目</title>


<link rel="stylesheet" type="text/css"
	href="<c:url value='../static/css/cart/showitem.css'/>">
<script src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='../static/js/round.js'/>"></script>
<style type="text/css">
#addr {
	width: 500px;
	height: 32px;
	border: 1px solid #7f9db9;
	padding-left: 10px;
	line-height: 32px;
}
.class {
	width: 200px;
	height: 32px;
	border: 1px solid #7f9db9;
	padding-left: 10px;
	line-height: 32px;
	}
.error{color: #f40000; font-size: 10pt;}

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
	
	
	$(function() {	
		/*
		 * 1. 
		 */
		$("#form1").submit(function(){
			$("#msg").text("");
			var bool = true;
			$(".input").each(function() {
				var inputName = $(this).attr("name");
				if(!invokeValidateFunction(inputName)) {
					bool = false;
				}
			});
			return bool;
		});
		
		/*
		 * 3. 输入框推动焦点时进行校验
		 */
		$(".input").blur(function() {
			var inputName = $(this).attr("name");
			invokeValidateFunction(inputName);
		});
	});

	function invokeValidateFunction(inputName) {
		inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
		var functionName = "validate" + inputName;
		return eval(functionName + "()");	
	}

	/*
	 * 校验收件人姓名
	 */
	function validateName() {
		var bool = true;
		$("#unameError").css("display", "none");
		var value = $("#name").val();
		if(!value) {// 非空校验
			$("#unameError").css("display", "");
			$("#unameError").text("收件人姓名不能为空！");
			bool = false;
		} 
		return bool;
	}

	// 校验电话号码
	function validatePhone() {
		var bool = true;
		$("#uphoneError").css("display", "none");
		var value = $("#phone").val();
		if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(value))) {// 非空校验
			$("#uphoneError").css("display", "");
			$("#uphoneError").text("不是完整的11位手机号或者正确的手机号前七位！");
			bool = false;
		} 
		return bool;
	}

	/*
	 * 校验收货地址
	 */
	function validateAddress() {
		var bool = true;
		$("#uaddressError").css("display", "none");
		var value = $("#address").val();
		if(!value) {// 非空校验
			$("#uaddressError").css("display", "");
			$("#uaddressError").text("收件人地址不能为空！");
			bool = false;
		} 
		return bool;	
	}
	
</script>
</head>

<body>
	<c:choose>
		<c:when test="${empty cartItemList }">嘻嘻~</c:when>
		<c:otherwise>
			<form id="form1" action="<c:url value='../order/createOrder/${cartItemIds }'/>"
				method="post">
				<table width="95%" align="center" cellpadding="0" cellspacing="0">
					<tr bgcolor="#efeae5">
						<td width="400px" colspan="5"><span style="font-weight: 900;">生成订单</span></td>
					</tr>
					<tr align="center">
						<td width="10%">&nbsp;</td>
						<td width="50%">鲜花名称</td>
						<td>单价</td>
						<td>数量</td>
						<td>小计</td>
					</tr>


					<c:forEach items="${cartItemList }" var="cartItem">
						<tr align="center">
							<td align="right"><a class="linkImage"
								href="<c:url value='../flower/loadDesc/${cartItem.flower.fid }'/>"><img border="0"
									width="54" align="top"
									src="<c:url value='/${cartItem.flower.image_b }'/>" /></a></td>
							<td align="left"><a
								href="<c:url value='../flower/loadDesc/${cartItem.flower.fid }'/>"><span>${cartItem.flower.fname }</span></a>
							</td>
							<td>&yen;${cartItem.flower.currPrice }</td>
							<td>${cartItem.quantity }</td>
							<td><span class="price_n">&yen;<span class="subtotal">${cartItem.subtotal }</span></span>
							</td>
						</tr>
					</c:forEach>


					<tr>
						<td colspan="6" align="right"><span>总计：</span><span
							class="price_t">&yen;<span id="total">${total }</span></span></td>
					</tr>
					<tr>
						<td colspan="5" bgcolor="#efeae5"><span
							style="font-weight: 900">请填写收货人信息</span></td>
					</tr>
					<tr>
					    <td colspan="2">收货人姓名：
					    	<input id="name" type="text" name="name" class="input" />
					    	<label id="unameError" class="error"></label>
					    </td>
						<td colspan="3">联系电话：
							<input id="phone" type="text" name="phone" class="input" />
							<label id="uphoneError" class="error"></label>
						</td>
					</tr>
					<tr>
						<td colspan="6">收货地址：
							<input id="address" type="text" name="address" class="input" />
							<label id="uaddressError" class="error"></label>
						</td>
					</tr>
					<tr>
						<td style="border-top-width: 4px;" colspan="5" align="right">
							<input id="linkSubmit" type="submit" value="提交订单">
						</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>
