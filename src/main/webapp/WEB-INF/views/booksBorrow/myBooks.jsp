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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<title>Insert title here</title>-->
    <!--<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">-->
    <!--<link rel="stylesheet" href="../static/css/navi.css">-->
    <!--<script src="../static/js/jquery.min.js"></script>-->
    <!--<script src="../static/bootstrap/js/bootstrap.min.js"></script>-->


    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            font-weight: 500;
            width: 100px;
        }
"src/main/webapp/WEB-INF/views/booksBorrow/myBooks.jsp"
        tbody tr:hover {
            background-color: rgba(47, 47, 47, 0.63);
            color: #000;;
        }
        td{
            vertical-align: middle !important;
        }
    </style>
    <script type="text/javascript">
    var limit=<%=request.getAttribute("limit")%>
    var start=<%=request.getAttribute("start")%>
    var allpage=<%=request.getAttribute("allpage")%>
    function prePage(){
    	start=start-limit;
        parent.$(".Content-Main").load("booksBorrow/myBooksByLimit",{start:start,limit:limit});
    }
    function nextPage(){
    	start=start+limit;
        parent.$(".Content-Main").load("booksBorrow/myBooksByLimit",{start:start,limit:limit});
    }
    function firstPage(){
        parent.$(".Content-Main").load("booksBorrow/myBooksByLimit",{start:0,limit:limit});
    }
    function lastPage(){
        parent.$(".Content-Main").load("booksBorrow/myBooksByLimit",{start:(allpage-1)*limit,limit:limit});
    }
    function deleteBorrow(id){
        parent.$(".Content-Main").load("booksBorrow/deleteBorrow",{start:start,limit:limit,orderId:id});
    }
    
    
    </script>
</head>
<body>
<div style="height:480px; overflow: auto">
<table class="table" width="1460px"  style="table-layout:fixed"">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;background:#FFF">
        <th>书名</th>
        <th>作者</th>
        <th>出版时间</th>
        <th>简介</th>
        <th>分类</th>
        <th>借出时间</th>
        <th>预计归还时间</th>
        <th>实际归还时间</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
   <%    
	List<MyBooks> books=(List)request.getAttribute("books");
    for(int i=0;i<books.size();i++){
    	MyBooks book=books.get(i);
    	if(book.getOrderStatus().equals("3")){
    	%>
    	
    	<tr style="background-color: rgba(246, 25, 13, 0.7)">  
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getIssueDate()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getClassify()%></td>   

        <td>无</td>   
        <td>无</td>   
        
        <td>无</td>  
         
        <%
        String status=book.getOrderStatus();
        if(status.equals("1")){
        	%><td >申请中</td>  
        	<%
        }
        if(status.equals("2")){
        	%>
        	<td >进行中</td>
        	<%
        }
        if(status.equals("3")){
        	%>
        	<td >已驳回</td>
        	<%
        }
        if(status.equals("4")){
        	%>
        	<td >已完成</td>
        	<%
        }
        %> 
      </tr>   

    	<% 
    	}
    	else if(book.getOrderStatus().equals("1")){
    		%>
    		<tr style="background-color:#f6e573;">  
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getIssueDate()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getClassify()%></td>   

        <td>正在申请</td>   
        <td>未同意</td>   
       
        <td>未借出</td>   
        <%
        String status=book.getOrderStatus();
        if(status.equals("1")){
        	%><td >
        	        	
        	
        	 <div class="btn-group">
        	 <button type="button" class="btn btn-default btn-sm disabled">申请中</button>
        	 
        	<button type="button" class="btn btn-default btn-sm dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li onclick="deleteBorrow('<%=book.getId()%>');"><a>取消申请</a></li>
                </ul>
                </div></td>  
        	<%
        }
        if(status.equals("2")){
        	%>
        	<td >进行中</td>
        	<%
        }
        if(status.equals("3")){
        	%>
        	<td >已驳回</td>
        	<%
        }
        if(status.equals("4")){
        	%>
        	<td >已完成</td>
        	<%
        }
        %> 
      </tr> 
    		<%
    	}
    	else if(book.getOrderStatus().equals("2")){
    		%>
    		<tr style="background-color:rgba(204, 255, 204, 0.5)">  
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getIssueDate()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getClassify()%></td>   

        <td><%=book.getBorrowDate()%></td>  
                <td><%=book.getExpectReturnDate()%></td>   
         
        <td style="color:red">未归还</td>   
        <%
        String status=book.getOrderStatus();
        if(status.equals("1")){
        	%><td >申请中</td>  
        	<%
        }
        if(status.equals("2")){
        	%>
        	<td style="color:blue">已同意</td>
        	<%
        }
        if(status.equals("3")){
        	%>
        	<td >已驳回</td>
        	<%
        }
        if(status.equals("4")){
        	%>
        	<td >已完成</td>
        	<%
        }
        %> 
      </tr> 
    		<%
    	}
    	else {
    		%>
    		<tr style="background:rgba(102, 204, 204, 0.5)">  
        <td><%=book.getBookName()%></td>   
        <td><%=book.getAuthorName()%></td>   
        <td><%=book.getIssueDate()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getClassify()%></td>   

        <td><%=book.getBorrowDate()%></td>   
                        <td><%=book.getExpectReturnDate()%></td>   
        
        <td><%=book.getReturnDate()%></td>   
        <%
        String status=book.getOrderStatus();
        if(status.equals("1")){
        	%><td >申请中</td>  
        	<%
        }
        if(status.equals("2")){
        	%>
        	<td >进行中</td>
        	<%
        }
        if(status.equals("3")){
        	%>
        	<td >已驳回</td>
        	<%
        }
        if(status.equals("4")){
        	%>
        	<td >已归还</td>
        	<%
        }
        %> 
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