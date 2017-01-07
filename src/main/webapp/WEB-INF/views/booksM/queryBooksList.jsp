<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查询图书列表</title>
</head>
<body>
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
        var bookname=<%=request.getAttribute("bookname")%>
        var authorname=<%=request.getAttribute("authorname")%>
        var issuedate=<%=request.getAttribute("issuedate")%>
        var status=<%=request.getAttribute("status")%>
        var classify=<%=request.getAttribute("classify")%>
      
        function prePage(){
        	start=start-limit;
            parent.$(".Content-Main").load("booksM/queryBooksListLimit",{start:start,limit:limit,bookname:bookname,
    	  		authorname:authorname,issuedate:issuedate,status:status,classify:classify});
        }
        function nextPage(){
        	start=start+limit;
            parent.$(".Content-Main").load("booksM/queryBooksListLimit",{start:start,limit:limit,bookname:bookname,
    	  		authorname:authorname,issuedate:issuedate,status:status,classify:classify});
        }
        function firstPage(){
            parent.$(".Content-Main").load("booksM/queryBooksListLimit",{start:0,limit:limit,bookname:bookname,
    	  		authorname:authorname,issuedate:issuedate,status:status,classify:classify});
        }
        function lastPage(){
            parent.$(".Content-Main").load("booksM/queryBooksListLimit",{start:(allpage-1)*limit,limit:limit,bookname:bookname,
    	  		authorname:authorname,issuedate:issuedate,status:status,classify:classify});
        }
        function searchBook() {
        	
        	var bookname =$('#bookname').val();
    	  	var authorname =$('#authorname').val();
    	  	var issuedate =$('#issuedate').val();
    	  	var status =$('#status').val();
    	  	var classify =$('#classify').val();
    	  	if(bookname=="查询姓名"){
    	  		bookname = "";
    	  	}
    	  	if(authorname=="查询作者"){
    	  		authorname ="";
    	  	}
    	  	 /*  
    	  	if((""==bookname&&""==authorname&&""==issuedate&&""==status&&""==classify)
    	  			||(bookname==null&&authorname==null)&&issuedate==null&&status==null&&classify==null){
        		return 0;
        	}else{
        		 if(null==bookname||""==bookname){
        			 bookname="-1";
        		 }
        		 if(null==authorname||""==authorname){
        			 authorname="-1";
        		 }
         		 if(null==classify||""==classify){
         			 classify="-1";
         		 }
         		 if(null==status||""==status) {
         			 status="-1";
         		 }
         		 if(null==issuedate||""==issuedate){
         			 issuedate="-1";  
         		 }
        		return 1;
        	}
        }
    */
    	  	parent.$(".Content-Main").load("booksM/searchBooks",{start:0,limit:limit,bookname:bookname,
    	  		authorname:authorname,issuedate:issuedate,status:status,classify:classify});
    		}
        
    </script>   
 
</head>
<body >
<!-- 
<div> 
<form id="searchForm" method="post">
			
			<span>
				<label>书名:</label>
				<input type="text" id="bookname" name="bookname">
			</span>
			<span><label>作者:</label>
				<input type="text" id="authorname" name="authorname">
			</span>
			<span><label>出版时间:</label>
				<input type="date" id="issuedate" name="issuedate">
			</span>
			<span>
                <label for="status">书籍状态</label>
                    <select name="status" id="status">
                    	<option></option>
                    	<option value="1">在库</option>
                    	<option value="2">已选</option>
                    	<option value="3">借出</option>
                    	<option value="4">遗失</option>
                    	<option value="5">损坏</option>
                    	<option value="6">不可用</option>
                    </select>
			</span>
			<span>
				<label for="puttype">书籍的分类</label>
                        <select name="classify" id="classify">
                        <option ></option>
                    	<option value="文学">文学</option>
                    	<option value="小说">小说</option>
                    	<option value="经济">经济</option>
                    	<option value="计算机与互联网">计算机与互联网</option>
                    	<option value="历史">历史</option>
                    	<option value="哲学">哲学</option>
                   		</select>
			</span>
			<span><input type="button" id="bquiry" onclick="searchBook()" value="查询"/>
			</span>
</form>
</div>-->

<div style="height:460px; overflow: auto">
<table class="table" width="1460px"  border="0">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;color:black;background: #FFFFFF;text-align: center;">
    	<td  colspan="2"><input type="text" id="bookname" class="form-control" value="查询姓名" onfocus="javascript:if(this.value=='查询姓名'||this.value=='名字长度小于10位字符')this.value=''" onblur="if(this.value =='') this.value ='查询姓名'" /></td>
    	<td  colspan="2"><input type="text" id="authorname" class="form-control" value="查询作者" onfocus="javascript:if(this.value=='查询作者')this.value=''" onblur="if(this.value =='') this.value ='查询作者'" /></td>
    	<td  colspan="1"><input type="date" id="issuedate" class="form-control"/></td>
    	<td colspan="1" style="font-size: 12px"><strong>书籍状态:</strong></td>
    	<td  colspan="1" ><select name="status" id="status">
                    	<option></option>
                    	<option value="1">在库</option>
                    	<option value="2">已选</option>
                    	<option value="3">借出</option>
                    	<option value="4">遗失</option>
                    	<option value="5">损坏</option>
                    	<option value="6">不可用</option>
                    </select>
        </td>
        <td colspan="1" style="font-size: 12px"><strong>书籍的分类:</strong></td>
    	<td  colspan="1"><select name="classify" id="classify">
                        <option ></option>
                    	<option value="文学">文学</option>
                    	<option value="小说">小说</option>
                    	<option value="经济">经济</option>
                    	<option value="计算机与互联网">计算机与互联网</option>
                    	<option value="历史">历史</option>
                    	<option value="哲学">哲学</option>
                   		</select>
        </td>
        <td colspan="1"><input type="button" id="bquiry" style="background: :#c0c0c0;width: 80px" class="edit btn btn-default btn-sm" onclick="searchBook()" value="查询"/></td>
    </tr>
    <tr style="font-size: 14px;color:black;background: #FFFF99;">
        <th>书名</th>
        <th>作者</th>
        <th colspan="3">简介</th>
        <th>分类</th>
        <th>出版时间</th>
        <th>状态</th>
        <th>创建时间</th>
        <th colspan="2">最后更新时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
    <tr style="background: #99CC99;readonly:true">
        <td>${book.bookname }</td>
        <td>${book.authorname }</td>
        <td colspan="3">${book.description }</td>
        <td>${book.classify }</td>
        <td>${book.issuedate }</td>
        <td>${book.status }</td>
        <td>${book.createtime }</td>
        <td colspan="2">${book.lastupdatetime }</td>
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