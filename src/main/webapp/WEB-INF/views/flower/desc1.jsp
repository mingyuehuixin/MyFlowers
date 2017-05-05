<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>鲜花详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flower/desc.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flower/common.css">

<script type="text/javascript" src="<c:url value='../../static/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/flower/desc.js'/>"></script>
<script type="text/javascript" src="<c:url value='../../static/js/flower/common.js'/>"></script>

<script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>

</head>
<body>
	<div id="MainPanel" class="fr">
		<div id="GoodsAlbum" class="frameMarginRight fl">
			<!--页面必要代码,img标签上请务必带上图片真实尺寸px-->
			<div id="showbox">
			  <img src="<c:url value='/${flower.image_w }'/>" width="220" height="240" />
			  <img src="<c:url value='/${flower.image_w }'/>" width="220" height="240" />
			</div><!--展示图片盒子-->
			<div id="showsum"></div><!--展示图片里边-->
			<p class="showpage">
			  <a href="javascript:void(0);" id="showlast"> < </a>
			  <a href="javascript:void(0);" id="shownext"> > </a>
			</p>
			
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
			<div class="PanelBuy">
				<p>
					<strong class="TextRed">会员价:&yen;${flower.currPrice }</strong> <span
						class="InvText frameMarginLeft">市场价:&yen;${flower.price }</span>
				</p>
				<div class="frameMarginTop">
					<c:choose>
								<c:when test="${empty sessionScope.sessionUser }">	
									<a class="BtnBuy buyIt" href="javascript:alert('您还没有登录，请登录')" ></a>
								</c:when>
								<c:otherwise>
									<a class="BtnBuy buyIt" href="<c:url value='/cart/addCart/${flower.fid }'/>" onclick="alert('加入购物车成功')" class="btn"></a>
								</c:otherwise>
								</c:choose>
					
					
					
				</div>
			</div>
			<div id="ckepop" style="margin-top: 20px;">
				<span class="jiathis_txt" style="font-family: SimSun;">分享到：</span> <a
					class="jiathis_button_copy" href="#">微信</a> 
					<a class="jiathis_button_tsina">QQ</a>
			</div>
		</div>
		<div class="cf"></div>
		<h1 class="FullBar fbRed">
			<span class="FullBarText">商品详情</span>
		</h1>
		<div class="DispalyContentBox frameMarginBot">
			<p>
				<span
					style="font-family: lucida sans unicode, lucida grande, sans-serif"><span
					style="color: #ff0000"><span style="font-size: 18px">商品名称：${flower.fname }</span></span></span>
			</p>
			<p>
				<span
					style="font-family: lucida sans unicode, lucida grande, sans-serif"><span
					style="color: #ff0000">
				<span style="font-size: 18px">花材：${flower.material }
				<span>A</span>级红玫瑰
				<span>${flower.branchnumber }</span>
				朵<span>,</span>${flower.packing }<span
							style="font-weight: normal"></span></span></span></span>
			</p>
			<p>&nbsp;</p>
			
			<p>
				<span style="font-family: lucida sans unicode, lucida grande, sans-serif">
				<span style="color: #ff0000"> <span style="font-size: 18px">
				<span style="font-weight: normal"> <span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px">
				<strong><span style="color: #ff0000"><span style="font-size: 18px">
				<span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span><span style="font-size: 18px">
				<span style="font-size: 16px"><span style="color: #000000">订购电话：<br>
			     100861199 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 QQ:100861199
				 </span></span></span></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></span></span></span>
			</p>
			<br>
		<ul>
			<li>
				    <span style="font-family: lucida sans unicode, lucida grande, sans-serif">
					<span style="color: #ff0000"> <span style="font-size: 18px">
					<span style="font-weight: normal"> <span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px">
					<strong><span style="color: #ff0000"><span style="font-size: 18px">
					<span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span><span style="font-size: 18px">
					<span style="font-size: 16px"><span style="color: #000000">友情提示：<br>
				      假如由于地区域季节的限制,需要更换花材，我们将会在第一时间和您联系，假如在此期间内得不到您的认可，
					  我们的花艺师将采用价值相等，花意相同的花村代替，敬请谅解。</span></span></span></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></span></span></span>
				</li>  <br>
				<li>
			    <span style="font-family: lucida sans unicode, lucida grande, sans-serif">
				<span style="color: #ff0000"> <span style="font-size: 18px">
				<span style="font-weight: normal"> <span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px">
				<strong><span style="color: #ff0000"><span style="font-size: 18px">
				<span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span style="color: #ff0000">
				<strong><span style="font-size: 18px"><span><span style="font-size: 18px">
				<span style="font-size: 16px"><span style="color: #000000">配送提示：<br>
			          非节日期间，可指定时间送到最快时间2小时到达，节日期间，可保证当日送达，急需者可另议。送达市郊或乡村，根据路程远近，收取相应的快递费。	</span></span></span></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></span></span></span>
			  </li> <br>
			  <li>
				    <span style="font-family: lucida sans unicode, lucida grande, sans-serif">
					<span style="color: #ff0000"> <span style="font-size: 18px">
					<span style="font-weight: normal"> <span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px">
					<strong><span style="color: #ff0000"><span style="font-size: 18px">
					<span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span style="color: #ff0000">
					<strong><span style="font-size: 18px"><span><span style="font-size: 18px">
					<span style="font-size: 16px"><span style="color: #000000">售后服务：<br>
				      因我们服务质量问题，引起您的不满，我们定会对您给予相应的理赔。欢迎您给予我宝贵的建议，您的建议就是我们成长的步伐。
					  一经采纳者，我们将给予相应的回报，谢谢您的支持和厚爱！</span></span></span></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></strong></span></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></span></span></span>
				</li>
			</ul>		
		</div>
	</div>
</body>
</html>
