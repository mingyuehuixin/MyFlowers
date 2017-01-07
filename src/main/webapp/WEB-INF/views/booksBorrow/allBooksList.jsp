<%@page import="com.lyh.flowers.pojo.BookSelectType"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="com.lyh.flowers.pojo.Book"%>
<%@page import="com.lyh.flowers.controller.BooksBorrowController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<title>Insert title here</title>-->

    <!--<script src="../static/js/bootstrap-paginator.min.js"></script>-->

 
 
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
    function setState(state){
    	var result="";
    	if(state==1){
    		result="借阅";
    		
    	}
    	return result;
    	
    }
    var limit=<%=request.getAttribute("limit")%>
    var start=<%=request.getAttribute("start")%>
    var allpage=<%=request.getAttribute("allpage")%>
<% BookSelectType select=(BookSelectType)request.getAttribute("bookSelectType");%>
    function prePage(){
    	start=start-limit;
    	if(<%=select%>!=null){
        parent.$(".Content-Main").load("booksBorrow/searchBooks",{start:start,limit:limit,
        	bookname:bookname,
        	bookAuthor:bookAuthor,
        	date:date,
        	type:type,
        	status:status});
    	}else{
    		parent.$(".Content-Main").load("booksBorrow/allBooksListByLimit",{start:start,limit:limit});	
    	}
    }
    function nextPage(){
    	start=start+limit;
    	if(<%=select%>!=null){
            parent.$(".Content-Main").load("booksBorrow/searchBooks",{start:start,limit:limit,bookname:bookname,bookAuthor:bookAuthor,
        	date:date,type:type,status:status});
    	}else{
    		parent.$(".Content-Main").load("booksBorrow/allBooksListByLimit",{start:start,limit:limit});	
    	}
    }
    function firstPage(){
    	if(<%=select%>!=null){
        parent.$(".Content-Main").load("booksBorrow/searchBooks",{start:0,limit:limit,bookname:bookname,bookAuthor:bookAuthor,
        	date:date,type:type,status:status});
    }else{
		parent.$(".Content-Main").load("booksBorrow/allBooksListByLimit",{start:0,limit:limit});	
	}
    }
    function lastPage(){
    	if(<%=select%>!=null){
        parent.$(".Content-Main").load("booksBorrow/searchBooks",{start:(allpage-1)*limit,limit:limit,bookname:bookname,bookAuthor:bookAuthor,
        	date:date,type:type,status:status});
         }else{
		parent.$(".Content-Main").load("booksBorrow/allBooksListByLimit",{start:(allpage-1)*limit,limit:limit});	
	}
    }
    
    function borrowBook(id){
        parent.$(".Content-Main").load("booksBorrow/borrowBook",{start:start,limit:limit,id:id},function(responseTxt,statusTxt,xhr){
        	<% String result=(String)request.getAttribute("resultMsg");
        	if(result!=null){%>
        	if(statusTxt=="success"){
            	alert('<%=request.getAttribute("resultMsg")%>');
        	}
        	<%}%>
        	
        	
        	

        });
    	
    }
   
    function search(){
    	start="0";
    	var bookname=$("#bookname").val();
        var bookAuthor=$("#bookAuthor").val();
    	var date=$("#date").val();
    	var type=$("#type").val();
    	var status=$("#status").val();

        parent.$(".Content-Main").load("booksBorrow/searchBooks",{bookname:bookname,bookAuthor:bookAuthor,
        	date:date,type:type,status:status,start:start,limit:limit});

   // 	alert(bookname);
    	
    }
    
    </script>
</head>
<body >
<div style="margin:10px;height:30px">
<table>
    <thead>
<tr>
<th style="width:120px">
<input  style="width:150px;margin-left: 20px;"   type="text" class="form-control" id="bookname" placeholder="书名">
</th>
<th >
<input style="width:150px;margin-left: 20px;"  type="text" class="form-control" id="bookAuthor" placeholder="作者">
</th>
<th >
<input style="width:150px;margin-left: 20px;" type="date" class="form-control" id="date" placeholder="出版日期">
</th>
<th >
<input style="width:120px;margin-left: 20px;" type="text" class="form-control" id="type" placeholder="分类">
</th>
<th >
<input style="width:120px;margin-left: 20px;"  type="text" class="form-control" id="status" placeholder="状态">
</th>
<th>
<input style="width:100px;margin-left: 50px;"  type="button" class="form-control" onclick="search();" id="search" value="搜索">
</th>
</tr>
</thead>
</table>
</div>

<div style="height:440px; overflow: auto" >
<table class="table" style="height:auto;width: 100%;table-layout:fixed"  >
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;color:black; background: #ffffff;">
        <th>书名</th>
        <th>作者</th>
        <th>简介</th>
        <th>分类</th>
        <th>出版时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%    
	List<Book> books=(List)request.getAttribute("books");
    for(int i=0;i<books.size();i++){
    	Book book=books.get(i);
    	if(book.getStatus().equals("1")){%>
    	
    	<tr style="background-color:rgba(204, 255, 204, 0.5)">  
        <td><%=book.getBookname()%></td>   
        <td><%=book.getAuthorname()%></td>   
        <td><%=book.getClassify()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getIssuedate()%></td>   
        <td>
        <button type="button" onclick="borrowBook(<%=book.getId()%>)" id="bt-bw<%=book.getId()%>"class="btn btn-default btn-sm">借阅            
        </button>
        </td>  
      </tr>   

    	<% 
    	}else{
    		%>
    		<tr style="background:rgba(102, 204, 204, 0.5);">  
        <td><%=book.getBookname()%></td>   
        <td><%=book.getAuthorname()%></td>   
        <td><%=book.getClassify()%></td>   
        <td style="white-space:nowrap;overflow:hidden;width:100px;text-overflow:ellipsis"><%=book.getDescription()%></td>   
        <td><%=book.getIssuedate()%></td>   
        <td><button type="button" class="btn btn-default btn-sm disabled">不可借阅         
            </button>
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

<script type="text/javascript">

</script>

</body>
</html>