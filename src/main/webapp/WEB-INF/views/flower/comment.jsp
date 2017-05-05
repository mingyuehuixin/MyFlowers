<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>评价</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flower/desc.css">
<script type="text/javascript" src="<c:url value='../../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/flower/desc.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/flower/comment.js'/>"></script>

<style>
#commentMain{border:1px solid #E5E5E5; width:765px;height:380px;}
#shaitu{border:1px solid #e5e5e5;width:300px;height:60px;margin-left:100px;}
#divservce{clear:both;height:20px;}
.divStart{float:left;}
.divInput{float:left;width:60%;}
textarea {    resize: none;    border: 1px solid #CFCFCF;    display: #EE30A7;    width: 300px;    height: 60px;}
.compose-btn {    text-align: center;    margin-left: 460px;    border-radius: 2px;    padding: 0;}
.dd1{float:left;line-height:60px;}
</style>

</head>
<body>
	<div id="MainPanel" class="fr">
		<div id="GoodsAlbum" class="frameMarginRight fl">
			<div class="GoodsImage" style="border: 0;">
				<img src="<c:url value='/${flower.image_w }'/>">
			</div>
			<div class="AlbumList"></div>
		</div>
		<div id="GoodsHead">
			<h2 class="TextCoffee">${flower.fname }</h2>
			<dl>
				<dt>编号：</dt>
				<dd>${flower.fid }</dd>
				<dt>类别：</dt>
				<dd>${flower.type }</dd>
				<dt>用途：</dt>
				<dd>${flower.makeuse }</dd>
				<dt>花材：</dt>
				<dd>${flower.material }</dd>
				<dt>枝数：</dt>
				<dd>${flower.branchnumber }</dd>
				<dt>颜色：</dt>
				<dd>${flower.flowercolor }</dd>
				<dt>包装：</dt>
				<dd>${flower.packing }</dd>
				<dt>花语：</dt>
				<dd>${flower.flowersaying }</dd>
				<dt>附送：</dt>
				<dd>免费附送精美贺卡，代写您的祝福。</dd>
			</dl>
		</div>
		</div>
		
		<div class="cf"></div>
		<h1 class="FullBar fbRed">
			<span class="FullBarText">累计评价（${flower.commentcount }）</span>
		</h1>
		<br/>
		<h3>我的评价</h3><hr>
	<div id="commentMain" >
	<form action="<c:url value='../../flower/comment'/>" method="post" id="commentFrom">
	<input type="hidden" id="fid" name="fid" value="${flower.fid }">
	<input type="hidden" id="orderItemId" name="orderItemId" value="${orderItemId }">
	<div class="divInput">
		<dt>
			<dd class="dd1">
				<dd class="dd1">评价商品</dd>&nbsp;&nbsp;
				<textarea id="cGood" name="cGood"></textarea>
			</dd>
		</dt>
		<dt>
			<dd class="dd1">
				<dd class="dd1">评价服务</dd>&nbsp;&nbsp;
				<textarea id="cService" name="cService"></textarea>
			</dd>
		</dt>
		<dt>
			<dd class="dd1">
				<dd class="dd1">晒&nbsp;图&nbsp;片</dd>
				<div id="shaitu">
				<br/>
					<input type="file" id="cPicture" name="cService"/>
				</div>				
			</dd>
		</dt>
	</div>
	<div class="divStart" >
		<div>
		<input type="hidden" id="describe" name="describe"/>
		<br/>
		<span><lable style="color:red;">*</lable>&nbsp;描述相符</span>
		<a href="javascript:click(1)"><img src="../../static/image/star.png" id="star1" onMouseOver="over(1)" onMouseOut="out(1)"/></a>
		<a href="javascript:click(2)"><img src="../../static/image/star.png" id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a>
		<a href="javascript:click(3)"><img src="../../static/image/star.png" id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a>
		<a href="javascript:click(4)"><img src="../../static/image/star.png" id="star4" onMouseOver="over(4)" onMouseOut="out(4)"/></a>
		<a href="javascript:click(5)"><img src="../../static/image/star.png" id="star5" onMouseOver="over(5)" onMouseOut="out(5)"/></a>
		<span id="message"></span>
		</div>

		<div>
		<input type="hidden" id="storeservice" name="storeservice"/>
		<br/>
		<span><lable style="color:red;">*</lable>&nbsp;店家服务</span>
		<a href="javascript:click(11)"><img src="../../static/image/star.png" id="star11" onMouseOver="over1(11)" onMouseOut="out1(11)"/></a>
		<a href="javascript:click(22)"><img src="../../static/image/star.png" id="star22" onMouseOver="over1(22)" onMouseOut="out1(22)" /></a>
		<a href="javascript:click(33)"><img src="../../static/image/star.png" id="star33" onMouseOver="over1(33)" onMouseOut="out1(33)" /></a>
		<a href="javascript:click(44)"><img src="../../static/image/star.png" id="star44" onMouseOver="over1(44)" onMouseOut="out1(44)"/></a>
		<a href="javascript:click(55)"><img src="../../static/image/star.png" id="star55" onMouseOver="over1(55)" onMouseOut="out1(55)"/></a>
		<span id="message1" name="message1"></span>
		</div>

		<div >
		<input type="hidden" id="logistics" name="logistics"/>
		<br/>
		<span><lable style="color:red;">*</lable>&nbsp;物流服务</span>
		<a id="" href="javascript:click(111)"><img src="../../static/image/star.png" id="star111" onMouseOver="over2(111)" onMouseOut="out2(111)"/></a>
		<a href="javascript:click(222)"><img src="../../static/image/star.png" id="star222" onMouseOver="over2(222)" onMouseOut="out2(222)" /></a>
		<a href="javascript:click(333)"><img src="../../static/image/star.png" id="star333" onMouseOver="over2(333)" onMouseOut="out2(333)" /></a>
		<a href="javascript:click(444)"><img src="../../static/image/star.png" id="star444" onMouseOver="over2(444)" onMouseOut="out2(444)"/></a>
		<a href="javascript:click(555)"><img src="../../static/image/star.png" id="star555" onMouseOver="over2(555)" onMouseOut="out2(555)"/></a>
		<span id="message2" ></span>
		</div> 

	</div>
	<br/>
	<div id="divservce">
	<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于服务
	<hr/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快递员:服务态度<br/><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label><input name="attitude" type="radio" value="1" />失望 </label> 
	<label><input name="attitude" type="radio" value="2" />不满 </label> 
	<label><input name="attitude" type="radio" value="3" />一般 </label> 
	<label><input name="attitude" type="radio" value="4" />满意 </label> 
	<label><input name="attitude" type="radio" value="5" />惊喜 </label> 
	<br/><br/>
	<input type="checkbox" name="anony" value="1" checked="checked"/><lable>匿名提交</lable>
	
	<span class="compose-btn">
		<button  type="submit" style="background:#c40000;color:#ffffff; ">提交评价</button>
	</span>
	</div>
	</form>
	</div>
</body>
</html>
