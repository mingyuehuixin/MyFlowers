<%@page import="com.lyh.flowers.pojo.MyBooks"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            font-weight: 500;
            width: 100px;
        }

        tbody tr:hover {
            background-color: rgba(47, 47, 47, 0.63);
            color: #FFF;;
        }

        td {
            vertical-align: middle !important;
        }

    </style>
    <script>
        function sureBack(orderid){
            parent.$(".Content-Main").load("borrowM/sureBack",{orderId:orderid,start:start,limit:limit});
        	
        }
        function sureLost(orderid){
            parent.$(".Content-Main").load("borrowM/sureLost",{orderId:orderid,start:start,limit:limit});

        }
        function sureBroken(orderid){
            parent.$(".Content-Main").load("borrowM/sureBroken",{orderId:orderid,start:start,limit:limit});
        }
        var limit=<%=request.getAttribute("limit")%>
        var start=<%=request.getAttribute("start")%>
        var allpage=<%=request.getAttribute("allpage")%>
        function prePage(){
        	start=start-limit;
            parent.$(".Content-Main").load("borrowM/borrowedListByLimit",{start:start,limit:limit});
        }
        function nextPage(){
        	start=start+limit;
            parent.$(".Content-Main").load("borrowM/borrowedListByLimit",{start:start,limit:limit});
        }
        function firstPage(){
            parent.$(".Content-Main").load("borrowM/borrowedListByLimit",{start:0,limit:limit});
        }
        function lastPage(){
            parent.$(".Content-Main").load("borrowM/borrowedListByLimit",{start:(allpage-1)*limit,limit:limit});
        }
    </script>
</head>
<body>
<div style="height:480px; overflow: auto">

<table class="table" width="1460px" border="1">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px">
        <th>申请编号</th>
        <th>申请人</th>
        <th>借阅图书名</th>
        <th>作者</th>
        <th>申请时间</th>
        <th>借出时间</th>
        <th>预计归还时间</th>
        <th>是否预期</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%    
	List<MyBooks> books=(List)request.getAttribute("books");
    for(int i=0;i<books.size();i++){
    	MyBooks book=books.get(i);
    	if(book.getOrderStatus().equals("2")){%>
    	
    	<tr style="background:rgba(102, 204, 204, 0.5)">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td> 
        
        <td><%=book.getBorrowDate()%></td>   
        <td><%=book.getExpectReturnDate()%></td>  
        <%
        if(book.getReturnDate().equals("2001-01-01")){
        	%><td>未归还<%
        }
        else{
        	%><td><%=book.getReturnDate()%></td><%
        }
        %>
         
        <td>
            <div class="btn-group">
            
            <% 
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm ">未归还</button>
                <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已归还</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="sureBack('<%=book.getId()%>');"><a href="#">确认还书</a></li>
                    <li onclick="sureLost('<%=book.getId()%>');"><a href="#">确认遗失</a></li>
                    <li onclick="sureBroken('<%=book.getId()%>');"><a href="#">确认损坏</a></li>
                </ul>
                
            </div>
        </td>
      </tr>   

    	<% 
    	} else if(book.getOrderStatus().equals("4")){%>
    	
    	<tr style="background:rgba(204, 255, 204, 0.5)">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td> 
        
        <td><%=book.getBorrowDate()%></td>   
        <td><%=book.getExpectReturnDate()%></td>  
        <%
        if(book.getReturnDate().equals("2001-01-01")){
        	%><td>未归还<%
        }
        else{
        	%><td><%=book.getReturnDate()%></td><%
        }
        %>
         
        <td>
            <div class="btn-group">
            
            <% 
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm ">未归还</button>
                <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已归还</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="sureBack('<%=book.getId()%>');"><a href="#">确认还书</a></li>
                    <li onclick="sureLost('<%=book.getId()%>');"><a href="#">确认遗失</a></li>
                    <li onclick="sureBroken('<%=book.getId()%>');"><a href="#">确认损坏</a></li>
                </ul>
                
            </div>
        </td>
      </tr>   

    	<% 
    	}
    }
    %>
   
    
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