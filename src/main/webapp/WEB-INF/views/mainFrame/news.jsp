<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>news</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
html, body, p, div, li, ul, form, ol, dt, h1, h2, h3, h4, h5 {
    margin: 0px;
    padding: 0px;
    font-size: 12px;
    font-family: Arial,SimSun;
}
#MainPanel {
    width: 760px;
}
.fr {
    float: left;
}
#PagePath, #CartStep {
    background: url(../static/image/page-path-bg.png) repeat-x;
    height: 28px;
    border: 1px solid #ddd;
    line-height: 28px;
}
.frameMarginBot {
    margin-bottom: 10px;
}
#PagePath .Home {
    padding-top: 8px;
    padding-left: 10px;
    height: 20px;
}
#PagePath p {
    background: url(../static/image/page-path-split.gif) no-repeat right center;
    padding-left: 6px;
    padding-right: 14px;
    height: 28px;
    line-height: 30px;
}
.fl {
    float: left;
}
.InfoList {
    margin: 15px 25px 5px 25px;
}
.TextLightGray {
    color: #8d8d8d;
}
.InfoList li {
    line-height: 25px;
    height: 25px;
    overflow: hidden;
    background: url(../static/image/arr-art-list.gif) no-repeat 5px 0;
    padding-left: 20px;
    border-bottom: 1px dotted #eee;
}
li {
    list-style: none;
}
.InfoList .date {
    margin-right: 10px;
}
a {
    text-decoration: none;
    color: #4e4e4e;
}
  </style>
 </head>

 <body>
 
  <div id="MainPanel" class="fr">
		<div id="PagePath" class="frameMarginBot">
			<p class="fl"><a href="/article/4/" title="新闻中心">新闻中心</a></p>		</div>
		<ul class="InfoList TextLightGray"><li>
							<span class="date fr">2017-01-22</span>
							<a href="/article/4/87.html" title="2017年情人节订花须知">2017年情人节订花须知</a>
							</li>
							<li>
							<span class="date fr">2016-011-01</span>
							<a href="/article/4/83.html" title="用户下单须知">用户下单须知</a>
							</li>
							<li>
							<span class="date fr">2012-10-11</span>
							<a href="/article/4/65.html" title="新系统上线">新系统上线</a>
							</li></ul>	</div>
 </body>
</html>
