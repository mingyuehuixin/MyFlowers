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
            color: #000000;;
        }
        td{
            vertical-align: middle !important;
        }
    </style>
    <script>
       var limit=<%=request.getAttribute("limit")%>
       var start=<%=request.getAttribute("start")%>
       var allpage=<%=request.getAttribute("allpage")%>
        function agreeBorrow(orderid){
            parent.$(".Content-Main").load("borrowM/agreeBorrow",{orderId:orderid,start:start,limit:limit});
        	
        }
        function registBorrow(orderid){
            parent.$(".Content-Main").load("borrowM/registerBorrow",{orderId:orderid,start:start,limit:limit});

        }
        
        
        function prePage(){
        	start=start-limit;
            parent.$(".Content-Main").load("borrowM/applyedListByLimit",{start:start,limit:limit});
        }
        function nextPage(){
        	start=start+limit;
            parent.$(".Content-Main").load("borrowM/applyedListByLimit",{start:start,limit:limit});
        }
        function firstPage(){
            parent.$(".Content-Main").load("borrowM/applyedListByLimit",{start:0,limit:limit});
        }
        function lastPage(){
            parent.$(".Content-Main").load("borrowM/applyedListByLimit",{start:(allpage-1)*limit,limit:limit});
        }
    </script>
</head>
<body>
<div style="height:480px; overflow: auto">

<table class="table" width="1460px" border="1" >
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;background:#FFF">
        <th>申请编号</th>
        <th>申请人</th>
        <th>借阅图书名</th>
        <th>作者</th>
        <th>申请时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%    
	List<MyBooks> books=(List)request.getAttribute("books");
    for(int i=0;i<books.size();i++){
    	MyBooks book=books.get(i);
    	if(book.getOrderStatus().equals("1")){%>
    	
    	<tr style="background:#f6e573">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td>    
        <td>
            <div class="btn-group">
            
            <% if(book.getOrderStatus().equals("1")) {
            	%>
            	 <button type="button" class="btn btn-default btn-sm">申请中</button>
            	<%
            }
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm disabled">已经同意</button>
                <% 
                }
                if(book.getOrderStatus().equals("3"))
                {
                 %>
                <button type="button" class="btn btn-default btn-sm disabled">已驳回</button>
                 <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已完成</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="agreeBorrow('<%=book.getId()%>');"><a>确认借出</a></li>
                    <li onclick="registBorrow('<%=book.getId()%>');"><a>驳回</a></li>
                </ul>
                
            </div>
        </td>
      </tr>   

    	<% 
    	} else if(book.getOrderStatus().equals("3")){%>
    	
    	<tr style="background:rgba(246, 25, 13, 0.7)">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td>    
        <td>
            <div class="btn-group">
            
            <% if(book.getOrderStatus().equals("1")) {
            	%>
            	 <button type="button" class="btn btn-default btn-sm">申请中</button>
            	<%
            }
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm disabled">已经同意</button>
                <% 
                }
                if(book.getOrderStatus().equals("3"))
                {
                 %>
                <button type="button" class="btn btn-default btn-sm disabled">已驳回</button>
                 <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已完成</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="agreeBorrow('<%=book.getId()%>');"><a>确认借出</a></li>
                    <li onclick="registBorrow('<%=book.getId()%>');"><a>驳回</a></li>
                </ul>
                
            </div>
        </td>
      </tr>   

    	<% 
    	}else if(book.getOrderStatus().equals("2")){%>
    	
    	<tr style="background:rgba(102, 204, 204, 0.5)">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td>    
        <td>
            <div class="btn-group">
            
            <% if(book.getOrderStatus().equals("1")) {
            	%>
            	 <button type="button" class="btn btn-default btn-sm">申请中</button>
            	<%
            }
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm disabled">已经同意</button>
                <% 
                }
                if(book.getOrderStatus().equals("3"))
                {
                 %>
                <button type="button" class="btn btn-default btn-sm disabled">已驳回</button>
                 <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已完成</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="agreeBorrow('<%=book.getId()%>');"><a>确认借出</a></li>
                    <li onclick="registBorrow('<%=book.getId()%>');"><a>驳回</a></li>
                </ul>
                
            </div>
        </td>
      </tr>   

    	<% 
    	}
          else if(book.getOrderStatus().equals("4")){%>
    	
    	<tr style="background:rgba(204, 255, 204, 0.5)">  
        <td><%=book.getOrderNumber()%></td>   
        <td><%=book.getEmpName()%></td>   
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getApplyDate()%></td>    
        <td>
            <div class="btn-group">
            
            <% if(book.getOrderStatus().equals("1")) {
            	%>
            	 <button type="button" class="btn btn-default btn-sm">申请中</button>
            	<%
            }
                if(book.getOrderStatus().equals("2")){
                %>
                 <button type="button" class="btn btn-default btn-sm disabled">已经同意</button>
                <% 
                }
                if(book.getOrderStatus().equals("3"))
                {
                 %>
                <button type="button" class="btn btn-default btn-sm disabled">已驳回</button>
                 <% 
                }
                if(book.getOrderStatus().equals("4"))
                {
                 %>
                 <button type="button" class="btn btn-default btn-sm disabled">已完成</button>
                 <% 
                }
            %>
            <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="agreeBorrow('<%=book.getId()%>');"><a>确认借出</a></li>
                    <li onclick="registBorrow('<%=book.getId()%>');"><a>驳回</a></li>
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