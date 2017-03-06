<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>鲜花列表</title>

<meta http-equiv="content-type" content="text/html;charset=utf-8">

<style type="text/css">
/*= Reset CSS 
============= */
html, body {border: 0; margin: 0; padding: 0;}
body { font: 14px "Lato", Arial, sans-serif; min-width: 100%; min-height: 100%; color: #666; }
*{margin: 0; padding: 0; box-sizing: border-box;}
img{max-width: 100%; vertical-align: middle;}
ul{margin: 0 -1.5%;width: 770px;}
li{float: left; width: 23%; margin: 10px 1%; list-style: none;}

h3{font-size: 20px; margin: 5px 0 10px;}
p{font-weight: 300; line-height: 20px; font-size: 14px; margin-bottom: 15px;}
.btn{display: inline-block; padding: 5px 10px; font-size: 14px; color: #fff; border: 2px solid #4d92d9; background-color: #4d92d9; text-decoration: none; transition: 0.4s;}
.btn:hover{background-color: transparent; color: #4d92d9; transition: 0.4s;}
.text-desc{position: absolute; left: 0; top: 0; background-color: #fff; height: 100%; opacity: 0; width: 100%; padding: 20px;}
/*= Reset CSS End
/* effect-6 css */
.port-6{float: left; width: 100%; position: relative; overflow: hidden; text-align: center; border: 4px solid rgba(255, 255, 255, 0.9); overflow: visible;}

.port-6.effect-3 img{transition: 0.5s;}
.port-6.effect-3:hover img{transform: scale(0.3) translateY(-110%); position: relative; z-index: 9;}
.port-6.effect-3 .text-desc{transform: translateY(100%); opacity: 0; padding: 85px 20px 10px; transition: 0.5s;}
.port-6.effect-3:hover .text-desc{transform: translateY(0px); opacity: 1;}
/* effect-6 css end */
</style>

</head>
<body>
	<ul>
		<c:forEach items="${pb.beanList }" var="flower">
				<li>
					<div class="port-6 effect-3">
						<div class="image-box">
						<a href="<c:url value='/flower/loadDesc/${flower.fid }'/>">
							<img src="${pageContext.request.contextPath}/${flower.image_w }" alt="Image-3">
						</a>
						</div>
						<div class="text-desc">
							<a style="text-decoration: none;" href="<c:url value='/flower/loadDesc/${flower.fid }'/>">
							<h3>${flower.fname }</h3>
							</a>
							<p>
								<span style="color:999; text-decoration: line-through;">市场价：&yen;${flower.price }</span>
								<br> 
    							<span style="color:red">特惠价：&yen;${flower.currPrice }</span>
							<p>	
							<c:choose>
							<c:when test="${empty sessionScope.sessionUser }">	
								<a href="javascript:alert('您还没有登录，请登录')" class="btn">加入购物车</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/cart/addCart/${flower.fid }'/>" onclick="alert('加入购物车成功')" class="btn">加入购物车</a>
							</c:otherwise>
							</c:choose>
							
							</p>			
						</div>
					</div>
				</li>
		</c:forEach>
			</ul>
	
	<div style="float: left; width: 100%; text-align: center;">
		<hr />
		<br />
		<%@include file="../pager/pager.jsp"%>
	</div>

</body>

</html>

