<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>鲜花导购</title>
	<link rel="stylesheet" href="<c:url value='../static/css/left.css'/>" type="text/css" media="all">
</head>

<body>
	<div id="LeftPanel" class="fl">
		<!--鲜花导购-->
		<h1 class="LeftTitle LeftTitleRed TextWhite">鲜花导购</h1>
		<div class="LeftColumnBox">
			<div class="cf"></div>
			<c:forEach items="${parents}" var="parent">
				<h2 class="lct2d TextCoffee">${parent.cname}</h2>
				<ul class="lct2dList">
					<c:forEach items="${parent.children}" var="child">
						<li><a href="../flower/flowerList/${child.cid}" target="body">${child.cname}</a></li>
					</c:forEach>
				</ul>
				<div class="cf"></div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
