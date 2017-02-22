<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>flower_desc.</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
<link rel="stylesheet" type="text/css" href="<c:url value='../../static/js/jquery.datepick.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='../../static/css/admindesc.css'/>">
<script type="text/javascript" src="<c:url value='../../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/jquery.datepick-zh-CN.js'/>"></script>

<script type="text/javascript" src="<c:url value='../../static/js/mflowerdesc.js'/>"></script>

<script type="text/javascript">
$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
	});
});
</script>
  </head>
  
  <body>
    <input type="checkbox" id="box"><label for="box">编辑</label>
    <br/>
    <br/>
  <div id="show">
    <div class="sm"><h3>${flower.fname }</h3></div>
    <img align="top" src="<c:url value='/${flower.image_w }'/>" class="tp"/>
    <div id="book" style="float:left;">
	    <ul>
	    	<li>花束编号：${flower.fid }</li>
	    	<li>会员价：<span class="price_n">&yen;${flower.currPrice }</span></li>
	    	<li>市场价：<span style="text-decoration:line-through;">&yen;${flower.price }</span>　折扣：<span style="color: #c30;">${flower.discount }</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					花语：${flower.flowersaying }
				</td>
			</tr>
			<tr>
				<td colspan="3">
					包装：${flower.packing }
				</td>
			</tr>
			<tr>
				<td>颜色：${flower.flowercolor }</td>
				<td>枝数：${flower.branchnumber }</td>
			</tr>
			<tr>
				<td>对象：${flower.target }</td>
				<td>类别：${flower.type }</td>
			</tr>
			<tr>
				<td>材料：${flower.material}</td>
				<td>用途：${flower.makeuse }</td>
			</tr>
			<tr>
				<td colspan="3">
				<a style="text-decoration:none" href="../../flowerM/delete/${flower.fid }" >  
					<input onclick="deleteForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
				</a>
				</td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv'>
   <div class="sm">&nbsp;</div>
   <form action="<c:url value='../../flowerM/edit'/>" method="post" id="form">
   	<input type="hidden" name="fid" value="${flower.fid }"/>
    <img align="top" src="<c:url value='/${flower.image_w }'/>" class="tp"/>
    <div style="float:left;">
	    <ul>
	    	<li>商品编号：${flower.fid }</li>
	    	<li>花束名称：　<input id="fname" type="text" name="fname" value="${flower.fname }" style="width:500px;"/></li>
	    	<li>会员价：<input id="currPrice" type="text" name="currPrice" value="${flower.currPrice }" style="width:50px;"/></li>
	    	<li>市场价：　<input id="price" type="text" name="price" value="${flower.price }" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="${flower.discount }" style="width:30px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					包装：　<input id="target" type="text" name="target" value="${flower.packing }" style="width:450px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					花语：　<input id="flowersaying" type="text" name="flowersaying" value="${flower.flowersaying }" style="width:450px;"/>
				</td>
			</tr>
			<tr>
			
			<td>花材：　<input id="material" type="text" name="material" value="${flower.material}" style="width:450px;"/></td>
				<td>枝数：
					<select name="branchnumber" id="branchnumber">
						<option value="${flower.branchnumber }">${flower.branchnumber }</option>
					<c:forEach items="${branchnumbers }" var="branchnumber">
			    		<option value="${branchnumber.cname }">${branchnumber.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>颜色：　<select name="flowercolor" id="flowercolor">
						<option value="${flower.flowercolor }">${flower.flowercolor }</option>
					<c:forEach items="${colors }" var="color">
			    		<option value="${color.cname }">${color.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>类别：
					<select name="type" id="type">
						<option value="${flower.type }">${flower.type }</option>
					<c:forEach items="${types }" var="type">
			    		<option value="${type.cname }">${type.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>对象：　<select name="target" id="target">
						<option value="${flower.target }">${flower.target }</option>
					<c:forEach items="${targets }" var="target">
			    		<option value="${target.cname }">${target.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>用途：
					<select name="makeuse" id="makeuse">
						<option value="${flower.makeuse }">${flower.makeuse }</option>
					<c:forEach items="${makeuses }" var="makeuse">
			    		<option value="${makeuse.cname }">${makeuse.cname }</option>
			    	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="method" id="editBtn" class="btn" value="编　　辑">
				</td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
