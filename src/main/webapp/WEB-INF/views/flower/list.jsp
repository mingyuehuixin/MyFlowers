<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>鲜花列表</title>

<meta http-equiv="content-type" content="text/html;charset=utf-8">

<style type="text/css">
html, body {border: 0; margin: 0; padding: 0;}
body { font: 14px "Lato", Arial, sans-serif; min-width: 100%; min-height: 100%; color: #666; }
*{margin: 0; padding: 0; box-sizing: border-box;}
img{max-width: 100%; vertical-align: middle;}
ul{margin: 0 -1.5%;width: 770px;}
li{float: left; width: 31.33%; margin: 10px 1%; list-style: none;}

h3{font-size: 20px; margin: 5px 0 10px;color: blue;}
p{font-weight: 300; line-height: 20px; font-size: 14px; margin-bottom: 15px;}
.btn{display: inline-block; padding: 5px 10px; font-size: 10px; color: #fff; border: 2px solid #4d92d9; background-color: #4d92d9; text-decoration: none; transition: 0.4s;}
.btn:hover{background-color: transparent; color: #4d92d9; transition: 0.4s;}
.text-desc{position: absolute; left: 0; top: 0; background-color: #fff; height: 100%; opacity: 0; width: 100%; padding: 20px;}

.port-2{float: left; width: 100%; position: relative; overflow: hidden; text-align: center; border: 4px solid rgba(255, 255, 255, 0.9); perspective: 800px;}
.port-2 .text-desc{z-index: -1; transition: 0.6s;}
.port-2 .image-box{transition: 0.4s;}
.port-2:hover .image-box{transform: rotateX(80deg); transform-origin: center bottom 0; transition: 0.4s;}

.port-2.effect-1:hover .text-desc{opacity: 1;}

</style>

</head>
<body>
	<ul>
		<c:forEach items="${pb.beanList }" var="flower">
				<li>
					<div class="port-2 effect-1">
		                	<div class="image-box">
		                    	<a href="<c:url value='/flower/loadDesc/${flower.fid }'/>">
								<img src="${pageContext.request.contextPath}/${flower.image_w }" alt="Image-1">
								</a>
		                    </div>
		                    <div class="text-desc">
		                    	<a style="text-decoration: none;" href="<c:url value='/flower/loadDesc/${flower.fid }'/>">
								<h3>${flower.fname }</h3>
								</a>
		                        <p>
		                        	花语：
		                        <c:if test="${fn:length(flower.flowersaying)>32}">
		                        <a style="text-decoration: none;" href="<c:url value='/flower/loadDesc/${flower.fid }'/>">>
								${fn:substring(flower.flowersaying, 0, 32)}....
								</a>
								</c:if>
								<c:if test="${fn:length(flower.flowersaying)<=32}">
								<a style="text-decoration: none;" href="<c:url value='/flower/loadDesc/${flower.fid }'/>">>
								${flower.flowersaying }
								</a>
								</c:if>
		                        <br>
    							<span style="color:red">特惠价：&yen;${flower.currPrice }</span>&nbsp;&nbsp;
								<span style="color:999; text-decoration: line-through;">&yen;${flower.price }</span>
								 
								
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
		<br /><br />
		<%@include file="../pager/pager.jsp"%>
	</div>

</body>

</html>

