<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>图书列表</title>
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
        var limit=<%=request.getAttribute("limit")%>
        var start=<%=request.getAttribute("start")%>
        var allpage=<%=request.getAttribute("allpage")%>
        function editBook(id){
        	$(".Content-Main").load("booksM/editBooks/"+id,{start:start,limit:limit});
        }
        
        function deleteBook(id) {
        	
        	parent.$(".Content-Main").load("booksM/delete/"+id,{start:start,limit:limit});
		}
        
 
        function prePage(){
        	start=start-limit;
            parent.$(".Content-Main").load("booksM/editBooksListByLimit",{start:start,limit:limit});
        }
        function nextPage(){
        	start=start+limit;
            parent.$(".Content-Main").load("booksM/editBooksListByLimit",{start:start,limit:limit});
        }
        function firstPage(){
            parent.$(".Content-Main").load("booksM/editBooksListByLimit",{start:0,limit:limit});
        }
        function lastPage(){
            parent.$(".Content-Main").load("booksM/editBooksListByLimit",{start:(allpage-1)*limit,limit:limit});
        }
    </script>
</head>
<body>
<div style="height:480px; overflow: auto">
<table class="table" width="1460px"  border="0">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;color:black;background: #FFFF99;">
        <th><strong>书名</strong></th>
        <th><strong>作者</strong></th>
        <th><strong>简介</strong></th>
        <th><strong>分类</strong></th>
        <th><strong>出版时间</strong></th>
        <th><strong>状态</strong></th>
        <th><strong>操作</strong></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
    <tr style="background: #99CC99;readonly:true">
        <td>${book.bookname }</td>
        <td>${book.authorname }</td>
        <td>${book.description }</td>
        <td>${book.classify }</td>
        <td>${book.issuedate }</td>
        <td>${book.status }</td>
         <td>
            <button type="button" style="background: #FFFF99" class="edit btn btn-default btn-sm" onclick="editBook(${book.id});"><strong>编辑</strong></button>
            <button type="button" style="background: #666666;color:#aaffff;" class="btn btn-default btn-sm" onclick="deleteBook(${book.id})"><strong>删除</strong></button>
        </td>        
    </tr>
    </c:forEach>
    
    </tbody>
</table>
</div>
<h4 style="text-align: center;height:16px" ><%=request.getAttribute("page")%>页</h4>
<div style="text-align: right;margin-right: 30px">
<ul class="pagination" >
    <li class="previous" onclick="prePage();"><a href="#">&larr;上一页</a></li>
    <li id="firstpage" onclick="firstPage();"><a href="#">首页</a></li>
    <li><a href="#" onclick="lastPage();">末页</a></li>
    <li class="next" onclick="nextPage();"><a href="#">下一页 &rarr;</a></li></ul>
</div>

</body>
</html>