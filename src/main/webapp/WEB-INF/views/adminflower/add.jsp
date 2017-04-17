<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
  <head>
    <title>添加新花束</title>
    	
<link rel="stylesheet" type="text/css" href="<c:url value='../static/js/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='../static/js/jquery.datepick-zh-CN.js'/>"></script>
<style type="text/css">
body {
	font-size: 10pt;
	color: #404040;
	font-family: SimSun;}
table {
	font-size: 10pt;
	margin-top: 15px;
	margin-left: 50px;
	width: 680px;}
td {	height: 25px;}
.tp {
	border: 1px solid #dcdcdc;
	float: left;}
ul {	list-style: none;}
li {	margin: 10px;}
.btn {
	border: 0;
	width: 142px;
	height: 33px;
	margin-top: 10px;
	font-size: 18px;
	font-weight: 900;
	text-align: left;
	padding-top: 1px;
	padding-left: 32px;
	color: #fff;
	font-family: 黑体;}
.btn1 {	background: url(../static/image/hong_2_btn.jpg) left top		no-repeat;}
.btn2 {	background: url(../static/image/hong_1_btn.jpg) left top		no-repeat;}

</style>

<script type="text/javascript">
$(function () {
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var fname = $("#fname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var packing = $("#packing").val();
		var flowersaying = $("#flowersaying").val();
		var material = $("#material").val();
		var flowercolor = $("#flowercolor").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		var branchnumber = $("#branchnumber").val();
		var type = $("#type").val();
		var makeuse = $("#makeuse").val();
		
		if(!fname || !currPrice || !price || !discount || !packing|| !branchnumber|| !type|| !makeuse|| !flowersaying || !material || !flowercolor || !image_w || !image_b) {
			alert("花束名、当前价、定价、折扣、包装、枝数、类型、用途、花语、材料、颜色、大图、小图都不能为空！");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("当前价、定价、折扣必须是合法小数！");
			return false;
		}
		$("#form").submit();
	});
});

</script>
  </head>
  
  <body>
  <h3 align="left">添加新花束</h3>
  <br>
  <div>
   <p style="font-weight: 900; color: red;">${msg }</p>
   <!--  
   <form:form method="POST" modelAttribute="flower" enctype="multipart/form-data" id="form">
   <form:input type="hidden" path="fid" id="fid"/>
    -->
    <form action="<c:url value='/flowerM/addflower'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul>
	    	<li>花束名称：　<input id="fname" type="text" name="fname" value="${flower.fname }" style="width:390px;"/></li>
	    	<li>大图：　<input id="image_w" type="file" name="image_w" value="${flower.image_w }"/></li>
	    	<li>小图：　<input id="image_b" type="file" name="image_b" value="${flower.image_b }"/></li>
	    	<li>会员价：<input id="currPrice" type="text" name="currPrice" value="${flower.currPrice }" style="width:50px;"/></li>
	    	<li>市场价：　<input id="price" type="text" name="price" value="${flower.price }" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="${flower.discount }" style="width:30px;"/>折</li>
	    </ul>
	    <br>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<br>
		<table>
			<tr>
				<td colspan="3">
					包装：<input type="text" id="packing" name="packing" value="${flower.packing }" style="width:500px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					花语：<input type="text" name="flowersaying" id="flowersaying" value="${flower.flowersaying }" style="width:500px;"/>
				</td>
			</tr>
			<tr>
				<td>材料：
					<select name="material" id="material">
						<option value="">===请选择花束材料===</option>
					<c:forEach items="${materials }" var="material">
			    		<option value="${material.cname }">${material.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>枝数：
					<select name="branchnumber" id="branchnumber">
						<option value="">===请选择花束枝数===</option>
					<c:forEach items="${branchnumbers }" var="branchnumber">
			    		<option value="${branchnumber.cname }">${branchnumber.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>颜色：
					<select name="flowercolor" id="flowercolor">
						<option value="">===请选择花束颜色===</option>
					<c:forEach items="${colors }" var="color">
			    		<option value="${color.cname }">${color.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>对象：
					<select name="target" id="target">
						<option value="">===请选择花束对象===</option>
					<c:forEach items="${targets }" var="target">
			    		<option value="${target.cname }">${target.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>类别：
					<select name="type" id="type">
						<option value="">===请选择花束类别===</option>
					<c:forEach items="${types }" var="type">
			    		<option value="${type.cname }">${type.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>用途：
					<select name="makeuse" id="makeuse">
						<option value="${flower.makeuse }">===请选择花束用途===</option>
					<c:forEach items="${makeuses }" var="makeuse">
			    		<option value="${makeuse.cname }">${makeuse.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" id="btn" class="btn" value="新花上架">
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<!--  
   </form:form>
   -->
   </form>
  </div>

  </body>
</html>
