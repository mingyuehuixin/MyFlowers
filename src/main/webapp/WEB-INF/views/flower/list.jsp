<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>鲜花列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='${pageContext.request.contextPath}/static/css/flower/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='${pageContext.request.contextPath}/static/css/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='../static/js/pager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='../static/js/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='${pageContext.request.contextPath}/static/js/flower/list.js'/>"></script>
  </head>

  <body>

<!--  
<ul>
<c:forEach items="${pb.beanList }" var="flower">
  <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/BookServlet?method=load&fid=${flower.fid }'/>"><img src="${pageContext.request.contextPath}/${flower.image_b }" border="0"/></a>
    <p class="price">
		<span class="price_n">&yen;${flower.currPrice }</span>
		<span class="price_r">&yen;${flower.price }</span>
		(<span class="price_s">${flower.discount }折</span>)
	</p>
	<p><a id="flowername" title="${flower.fname }" href="<c:url value='/BookServlet?method=load&bid=${flower.fid }'/>">${flower.fname }</a></p>
	<%-- url标签会自动对参数进行url编码 --%>
	<c:url value="/BookServlet" var="authorUrl">
		<c:param name="method" value="findByAuthor"/>
		<c:param name="author" value="${book.author }"/>
	</c:url>
	<c:url value="/BookServlet" var="pressUrl">
		<c:param name="method" value="findByPress"/>
		<c:param name="press" value="${flower.flowersaying }"/>
	</c:url>
	<p><a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a></p>
  </div>
  </li>
</c:forEach>

</ul>
-->
<ul>
<c:forEach items="${pb.beanList }" var="flower">
  <li>
    <a class="pic" href="<c:url value='/flower/loadDesc/${flower.fid }'/>">
    <img src="${pageContext.request.contextPath}/${flower.image_b }" border="0"/>
    <h3> ${flower.fname } </h3>
   	<span class="jg">
   	 <i>&yen;${flower.currPrice }</i>
   	 <del>&yen;${flower.price }</del>
   	</span>
   	<span class="tj"></span>
   	</a>
	<div class="lan">
		<a class="aa1" href="">加入收藏</a>
		<a class="aa2" href="">加入购物车</a>
	</div>
  </li>
</c:forEach>

</ul>

<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="../pager/pager.jsp" %>
</div>

  </body>
 
</html>

