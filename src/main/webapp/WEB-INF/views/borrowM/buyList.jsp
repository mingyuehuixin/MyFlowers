<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.lyh.flowers.pojo.BookApply"%>
    
    <%@page import="com.lyh.flowers.pojo.BookSelectType"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="com.lyh.flowers.pojo.Book"%>
<%@page import="com.lyh.flowers.controller.BooksBorrowController"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            font-weight: 500;
            width: 100px;
        }

        tbody tr:hover {
            background-color: rgba(47, 47, 47, 0.63);
            color: #000;;
        }

        td {
            vertical-align: middle !important;
        }
    </style>
    <script>
    var limit=<%=request.getAttribute("limit")%>
    var start=<%=request.getAttribute("start")%>
    var allpage=<%=request.getAttribute("allpage")%>
    function prePage(){
    	start=start-limit;
        parent.$(".Content-Main").load("buy/applyListByLimit",{start:start,limit:limit});
    }
    function nextPage(){
    	start=start+limit;
        parent.$(".Content-Main").load("buy/applyListByLimit",{start:start,limit:limit});
    }
    function firstPage(){
        parent.$(".Content-Main").load("buy/applyListByLimit",{start:0,limit:limit});
    }
    function lastPage(){
        parent.$(".Content-Main").load("buy/applyListByLimit",{start:(allpage-1)*limit,limit:limit});
    }
    function deleteBorrow(id){
        parent.$(".Content-Main").load("buy/deleteApply",{start:start,limit:limit,orderId:id});
    }
    
    
    </script>
</head>

<body >
<div style="height:480px; overflow: auto" >
<table class="table" style="height:auto;width: 100%;table-layout:fixed"  >
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;color:black; background: #ffffff;">
        <th>书名</th>
        <th>作者</th>
        <th>出版日期</th>
        <th>购买链接</th>
        <th>推荐理由</th>
    </tr>
    </thead>
    <tbody>
    <%    
	List<BookApply> books=(List)request.getAttribute("books");
    for(int i=0;i<books.size();i++){
    	BookApply book=books.get(i);%>
    	<tr>  
        <td><%=book.getBookName()%></td>  
        <td><%=book.getAuthorname() %></td> 
        <td><%=book.getIssuedate()%></td>   
        <td> <a href="<%=book.getUrllink()%>"><%=book.getUrllink()%></a></td>   
        <td><%=book.getRecommendreason()%></td>   
      </tr>  
      <%} %>
       
     </tbody>
</table>
</div>
<h4 style="text-align: center;height:16px" ><%=request.getAttribute("page")%>页</h4>
<div style="text-align: right;margin-right: 30px">
<ul class="pagination" >
    <li class="previous" onclick="prePage();"><a href="#">&larr; 前一页</a></li>
    <li id="firstpage" onclick="firstPage();"><a href="#">首页</a></li>
    <li><a href="#" onclick="lastPage();">末页</a></li>
    <li class="next" onclick="nextPage();"><a href="#">后一页 &rarr;</a></li></ul>
</div>
</body>

</html>