<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>

<title>地址管理</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value='../static/css/city-picker.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='../static/css/main.css'/>">

<script src="../static/js/jquery.js"></script>
<script src="../static/js/bootstrap.js"></script>
<script src="../static/js/city-picker.data.js"></script>
<script src="../static/js/city-picker.js"></script>
<script src="../static/js/main.js"></script>

<style type="text/css">
.shade{width: 100%; height: 100%; overflow-y: hidden; position: fixed; z-index: 100; top: 0; background: black; opacity: 0.5;}
	.shade_content{width: 600px; border-radius: 10px; height: 500px; position: fixed; z-index: 101; top: 20%; left: 50%; margin-top: -150px; margin-left: -300px; background: #FFFFFF; }
	.shade_content_div{margin: 0px auto; text-align: center; height: 100%; width: 80%; margin-top: 20px;}
	.shade_title{font-size: 30px; text-align: center; font-weight: bold; font: "微软雅黑";}
	.btn_remove{border-radius: 5px; background: #31B0D5; color: white; width: 150px; height: 40px; border: 0px; outline: 0px; font-size: 15px;}
	.sub_set{border-radius: 5px; background: #31B0D5; color: white; width: 150px; height: 40px; border: 0px; outline: 0px; font-size: 15px;}
	.input_style{height: 30px; border-radius: 5px; width: 250px; outline: 0px; border: 1px solid #CCCCCC;}
	.span_style{font-size: 18px;}
	.shade_from{margin-top: 20px;}
	.shade_from .col-xs-12{margin-top: 20px;}
	.shade_colse{text-align: right; margin-top: 10px; }
	.shade_colse button{font-size: 20px; color: white; outline: 0px; margin-right: 10px; border-radius: 50px; background: red; height: 30px; width: 30px; border: 0px;}
	.open_new{width: 80px;text-align: right;}
	.open_btn{height: 30px; width: 100px; border-radius: 10px; background: red; color: white; outline: 0px; margin-bottom: 10px;margin-left:600px; border: 0px ;}
	#createOrder{border: 3px solid #efeae5 ;height: 50%;width: 1000px;margin-left: -30px;}
	#divTitle {line-height: 30px; width: 100%; height: 30px; border: 1px solid #d0d0d0; background-color:#efeae5; }
	#spanTitle {margin-left: 18px; font-weight: 900;}
	.Caddress .add_mi {
    height: 106px;
    width:200px;
    float: left;
    margin:1px 3px 1px 3px;
    background: url(../static/image/mail.jpg) no-repeat;
    padding: 6px 17px;
}
.tbl-deliver-address {width:830px;margin: 15px 0 0 25px;}
.tbl-deliver-address .tbl-main { width: 97%;table-layout: fixed;border: 1px solid #e7e7e7;}
.tbl-deliver-address .col-man {width: 65px;}
.tbl-deliver-address .col-area {width: 200px;}
.tbl-deliver-address .col-address {width: 200px;}
.tbl-deliver-address .col-postcode {    width: 65px;}
.tbl-deliver-address .col-phone {    width: 130px;}
.tbl-deliver-address .mtb10{color: #FF4500;}
.tbl-deliver-address tr {    border-bottom: 1px solid #e7e7e7;}
.thead-tbl-grade th {    height: 40px;    padding: 0 5px;    border-top: 1px solid #e7e7e7;    border-bottom: 1px solid #e7e7e7;    background: #f2f2f2;    text-align: left;}
.tbl-deliver-address tr {    border-bottom: 1px solid #e7e7e7;}
.tbl-deliver-address td {    padding: 5px;    white-space: normal;    word-wrap: break-word;    word-break: break-all;    position: relative;}
.tbl-deliver-address td {padding: 5px;white-space:normal;word-wrap: break-word;word-break: break-all;    position: relative;}
.tbl-deliver-address .note {    padding: 4px 5px;    background: #f60;    color: #fff;    border: 1px solid #f60;    border-radius: 3px;    text-decoration: none;}
.hide {    display: none;}
table {border-collapse: collapse;margin-left: 0px;}
body {    color: #333;   font: 400 12px/1.6 arial,sans-serif;}


</style>

<script type="text/javascript">
	$(function() {
		//		var region = $("#region");
		//		var address = $("#address");
		//		var number_this = $("#number_this");
		//		var name = $("#name_");
		//		var phone = $("#phone");
		$("#sub_setID").click(function() {
			var input_out = $(".input_style");
			for (var i = 0; i <= input_out.length; i++) {
				if ($(input_out[i]).val() == "") {
					$(input_out[i]).css("border", "1px solid red");

					return false;
				} else {
					$(input_out[i]).css("border", "1px solid #cccccc");
				}
			}
		});
		//	$("#address").hide();
		$(".shade_content").hide();
		$(".shade").hide();

		$('.Caddress .add_mi')
				.click(
						function() {
							$(this)
									.css('background',
											'url("../static/image/mail_1.jpg") no-repeat')
									.siblings('.add_mi')
									.css('background',
											'url("../static/image/mail.jpg") no-repeat');
							var addressid = $(this).attr("id").substring(0, 32);
							//alert(addressid);
							$("#addressId").val(addressid);

						});
	});

	var x = Array();

	function func(a, b) {
		x[b] = a.html();
		alert(x);
		a.css('border', '2px solid #f00').siblings('.min_mx').css('border',
				'2px solid #ccc');
	}

	function onclick_close() {
		var shade_content = $(".shade_content");
		var shade = $(".shade");
		if (confirm("确认关闭么！此操作不可恢复")) {
			shade_content.hide();
			shade.hide();
		}
	}

	function onclick_submit() {
		var shade_content = $(".shade_content");
		var shade = $(".shade");
		var str = $("#city-picker3").val();
		var adstreet = $("#adstreet").val();
		var adpostcode = $("#adpostcode").val();
		var adname = $("#adname").val();
		var adphone = $("#adphone").val();

		$.ajax({
			url : "../address/addAddress",//要请求的servlet
			data : {
				str : str,
				adstreet : adstreet,
				adpostcode : adpostcode,
				adname : adname,
				adphone : adphone
			},//给服务器的参数
			type : "POST",
			dataType : "json",
			async : false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache : false,
			timeout : 1000,
			success : function(result) {
				//alert(result);
				confirm("添加地址成功");
				shade_content.hide();
				shade.hide();
				window.location.reload();
				return true;
			}
		});

	}

	function onclick_open() {
		$(".shade_content").show();
		$(".shade").show();
		var input_out = $(".input_style");
		for (var i = 0; i <= input_out.length; i++) {
			if ($(input_out[i]).val() != "") {
				$(input_out[i]).val("");
			}
		}
	}
</script>
</head>

<body>
	<div id="createOrder">
		<div id="divTitle">
			<span id="spanTitle">地址管理</span>
		</div>
		<br>
		<div class="Caddress" >
			<div class="open_new">
				<button class="open_btn" onclick="javascript:onclick_open();">新增地址</button>
			</div>
		
		<div class="tbl-deliver-address">
			<div class="caption mtb10">已保存了${count }条地址，还能保存${remain }条地址</div>
			<table class="tbl-main" cellspacing="0" cellpadding="0" border="0">
				<colgroup>
					<col class="col-man">
					<col class="col-area">
					<col class="col-address">
					<col class="col-postcode">
					<col class="col-phone">
					<col class="col-actions">
				</colgroup>
				<tbody>
					<tr class="thead-tbl-grade">
						<th>收货人</th>
						<th>所在地区</th>
						<th>详细地址</th>
						<th>邮编</th>
						<th>电话/手机</th>
						<th>操作</th>
						<!-- 
						<th></th>
						 -->
					</tr>
					
					<c:forEach items="${addressList }" var="address" varStatus="status">
						
					<tr class="thead-tbl-address">
						<td>${address.adname }</td>
						<td>${address.adprovince } ${address.adcity }${address.addistrict }</td>
						<td>${address.adstreet }</td>
						<td>${address.adpostcode }</td>
						<td>${address.adphone }</td>
						<td>
							<a
							href="../address/update/${address.adid }">修改</a>
							<a
							href="../address/delete/${address.adid }" class="del">删除</a></td>
						<!-- 
						<td class="thead-tbl-status"><a class="note implicit hide"
							href="/member/fresh/deliver_address.htm?type=home&amp;action=deliver_address_mgr&amp;_tb_token_=e3344716e3485&amp;event_submit_do_update_default_addr=submit&amp;id=7134266435">设为默认</a>
						</td>
						 -->
					</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
		</div>
	  </div>
	</div>

	<div class="shade"></div>
	<div class="shade_content">
		<div class="col-xs-12 shade_colse">
			<button onclick="javascript:onclick_close();">x</button>
		</div>
		<div class="nav shade_content_div">
			<div class="col-xs-12 shade_title">新增收货地址</div>
			<div class="col-xs-12 shade_from">
				<!-- 
					<form action="<c:url value='../address/addAddress'/>" method="post">
				 -->
				<div id="distpicker">
					<div style="float: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="span_style" id="">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
					</div>
					<div style="float: left;" class="form-group">
						<div style="position: relative;">
							<input id="city-picker3" name="city-picker3" class="form-control"
								readonly type="text" value="" data-toggle="city-picker">
						</div>
					</div>

				</div>
				<br>
				<div class="col-xs-12">
					<span class="span_style" id="">详细地址</span> <input
						class="input_style" type="text" name="adstreet" id="adstreet"
						value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
				</div>
				<div class="col-xs-12">
					<span class="span_style" id="">邮政编号</span> <input
						class="input_style" type="text" name="adpostcode" id="adpostcode"
						value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
				</div>
				<div class="col-xs-12">
					<span class="span_style" class="span_sty" id="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
					<input class="input_style" type="text" name="adname" id="adname"
						value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
				</div>
				<div class="col-xs-12">
					<span class="span_style" id="">手机号码</span> <input
						class="input_style" type="text" name="adphone" id="adphone"
						value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
				</div>
				<div class="col-xs-12">
					<input class="btn_remove" type="button" id=""
						onclick="javascript:onclick_close();" value="取消" /> <input
						type="submit" class="sub_set" id="sub_setID"
						onclick="javascript:onclick_submit();" value="提交" />
				</div>
				<!-- 
					</form>
					 -->
			</div>
		</div>
	</div>

</body>
</html>
