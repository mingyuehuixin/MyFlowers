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
 	<style type="text/css">
 		body
			{
			margin:0px;
			font-family:"宋体",\5b8b\4f53;
			text-align:center;
			font-size:12px;
			color:#727171;
			}
		.rmtj_proimg {
		    width: 177px;
		    height: 222px;
		    margin: 0 auto;
		    text-align: center;
		}
	 	li {
		    list-style: none;
		}
		.rmtj_protl {
		    width: 175px;
		    height: 25px;
		    text-align: left;
		    margin: 0 auto;
		    overflow: hidden;
		}
		.rmtj_projg {
		    width: 175px;
		    height: 18px;
		    line-height: 18px;
		    text-align: left;
		    margin: 0 auto;
		}
	
 	</style>
 
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
<div class="rmtj_conr" style="float:left;">
<c:forEach items="${pb.beanList }" var="flower">
<ul class="rmtj_probox">
    <li class="rmtj_proimg">
    <a href="<c:url value='/flower/loadDesc/${flower.fid }'/>" title="${flower.fname } ">
    <img src="${pageContext.request.contextPath}/${flower.image_b }" alt="百年好合">
    </a>
    </li>
    <li class="rmtj_protl">
    <a href="<c:url value='/flower/loadDesc/${flower.fid }'/>" title="${flower.fname } ">${flower.fname }</a>
    </li>
    <li class="rmtj_projg">
    	<span style="color:999; text-decoration: line-through;">&yen;${flower.price }</span> 
    	<span style="color:red">&yen;${flower.currPrice }</span></li>
</ul>
</c:forEach>
</div>

<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="../pager/pager.jsp" %>
</div>

  </body>
 
</html>

