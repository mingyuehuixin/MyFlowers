<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>修改图书</title>
    <style>
        .addform {
            margin-top: 10px;
            margin-left: 100px;
            margin-right: 100px;
        }

        .form-group {
            margin-right: 180px;
        }
    </style>
    <script>
    
    $(function(){
     	$('#classifyItem').find('li').each(function(){
     		$(this).click(function(){
     			$('#classify').val($(this).text());
     		})
     	});
     	$('#statusItem').find('li').each(function(){
     		$(this).click(function(){
     			$('#status').val($(this).text());
     		});
     	});
     	});
    
   	function editBook(id){
   		var limit=<%=request.getAttribute("limit")%>
        var start=<%=request.getAttribute("start")%>
   		
    	var bookname = $('#bookname').val();
    	var authorname =$('#authorname').val();
    	var classify =$('#classify').val();
    	var issuedate =$('#issuedate').val();
    	var status =$('#status').val();
    	var description=$('#description').val();
    	var flag = 0;
		if(classify=="书籍的分类"||classify==""){
			flag=1;
			$('#classify').css("border","1px solid red");
		}
		if(bookname=="书名"||bookname==""||bookname=="书名长度小于15位字符"){
			flag=1;
			$('#bookname').css("border","1px solid red");
		}
		if(issuedate==""){
			flag=1;
			$('#issuedate').css("border","1px solid red");
		}
		if(status==""){
			flag=1;
			$('#status').css("border","1px solid red");
		}
		if(description=="书的简介"||description==""||description=="简介太长啦"||description=="写点什么吧"){
			flag=1;
			$('#description').css("border","1px solid red");
		}
		if(authorname=="作者"||authorname==""||authorname=="名字过长"){
			flag=1;
			$('#authorname').css("border","1px solid red");
		}
		if(flag==1){
			return;
		}
    	if(status=="在库"){
    		status="1";
    	}else if(status=="已选"){
    		status="2";
    	}else if(status=="借出"){
    		status="3";
    	}else if(status=="遗失"){
    		status="4";
    	}else if(status=="损坏"){
    		status="5";
    	}else if(status=="不可用"){
    		status="6";
    	}
    	parent.$(".Content-Main").load("booksM/doeditbook/"+id,
    			{start:start,limit:limit,"bookname":bookname,"authorname":authorname,
    		"issuedate":issuedate,"classify":classify,
    		"status":status,"description":description});
    }
   	
   	//检验信息
   	function checkbookName(){
   		if($('#bookname').val().length>15){
				$('#bookname').val("书名长度小于15位字符");
		    	$('#bookname').css("border","1px solid red");
			}else{
				$('#bookname').css("border","1px solid green");
			}
   	}
   	
   	function checkauthorName(){
   		if($('#authorname').val().length>10){
			$('#authorname').val("名字过长");
	    	$('#authorname').css("border","1px solid red");
		}else{
			$('#authorname').css("border","1px solid green");
		}
   	}
    </script>
</head>

<body>
<h3 style="margin-left: 110px">编辑图书</h3>

<form  class="addform" method="post" >

    
    <table class="table">
        <tr>
            <td>
                <div class="form-group">
                    <label for="bookname">书籍的名称</label>
                    <input type="text" value="${book.bookname }" name="bookname" class="form-control" id="bookname" onfocus="javascript:if(this.value=='书名'||this.value=='书名长度小于15位字符')this.value=''" onblur="if(this.value =='') this.value ='书名'" onchange="checkbookName()">
                </div>
            </td>
            <td>
                <div class="form-group">
                    <label for="bookauther">书籍的作者</label>
                    <input type="text" value="${book.authorname}" name="authorname" class="form-control" id="authorname" onfocus="javascript:if(this.value=='作者'||this.value=='名字过长')this.value=''" onblur="if(this.value =='') this.value ='作者'" onchange="checkauthorName()">
                </div>
            </td>
        </tr>
        <tr>
            <td>
            	 <div class="form-group">
                    <label for="classify">书籍的分类</label>
                   <div class="btn-group">
                    <input type="text" name="classify" id="classify" class="form-control dropdown-toggle" style="background: #fff" readonly="true" data-toggle="dropdown" value="${book.classify }" onblur="if(this.value !=' ') this.style ='border:1px solid green'"/>
                    <ul class="dropdown-menu" id="classifyItem">
                        <li><a href="#">文学</a></li>
                        <li><a href="#">小说</a></li>
                        <li><a href="#">计算机与互联网</a></li>
                        <li><a href="#">历史</a></li>
                        <li><a href="#">哲学</a></li>
                        <li><a href="#">经济</a></li>
                    </div>
                </div>
            
               <!--<div class="form-group">
                    <label for="puttype">书籍的分类</label>
                    <div class="btn-group">
                        <select name="classify" id="classify">
                     	<option value="${book.classify }">${book.classify }</option> 
                    	<option value="文学">文学</option>
                    	<option value="小说">小说</option>
                    	<option value="经济">经济</option>
                    	<option value="计算机与互联网">计算机与互联网</option>
                    	<option value="历史">历史</option>
                    	<option value="哲学">哲学</option>
                    </select>
                    </div>
                </div>-->
            </td>
            <td>
                <div class="form-group">
                    <label for="puttime">出版时间</label>
                    <input value="${book.issuedate }" type="date" id="issuedate" name="issuedate" class="form-control" id="issuedate" placeholder="出版时间">
                </div>
            </td>
        </tr>
        
         <tr>
            <td >
            <div class="form-group">
                    <label for="classify">书籍状态</label>
                   <div class="btn-group">
                    <input type="text" name="status" id="status" class="form-control dropdown-toggle" style="background: #fff" readonly="true" data-toggle="dropdown" value="${book.status}" onblur="if(this.value !=' ') this.style ='border:1px solid green'"/>
                    <ul class="dropdown-menu" id="statusItem">
                        <li value="1"><a href="#">在库</a></li>
                        <li value="2"><a href="#">已选</a></li>
                        <li value="3"><a href="#">借出</a></li>
                        <li value="4"><a href="#">遗失</a></li>
                        <li value="5"><a href="#">损坏</a></li>
                        <li value="6"><a href="#">不可用</a></li>
                    </div>
                </div>
                
            	<!--  <div class="form-group">
                    <label for="status">书籍状态</label>
                    <select name="status" id="status">
                     	<option value="">${book.status}</option> 
                    	<option value="1">在库</option>
                    	<option value="2">已选</option>
                    	<option value="3">借出</option>
                    	<option value="4">遗失</option>
                    	<option value="5">损坏</option>
                    	<option value="6">不可用</option>
                    </select>                 
                </div> --> 
            </td>
            <td >
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
                <div class="form-group">
                    <textarea class="form-control" rows="4" id="description" name="description" placeholder="内容简介" onfocus="javascript:if(this.value=='书的简介'||this.value=='写点什么吧'||this.value=='简介太长啦')this.value=''" onblur="if(this.value =='') this.value ='书的简介'" onchange="checkDescription()">${book.description}</textarea>
                </div>
       		 </td>
        </tr>

       
        <tr>
            <td colspan="2">
                <button type="button" onclick="editBook(${book.id})" id="save" class="btn btn-default" >保存</button>
            </td>
        </tr>
    </table>
</form>
    
</body>

</html>