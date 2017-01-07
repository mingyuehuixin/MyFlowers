<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>增加新图书</title>
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
     	})  
     	});
    
   	function addBook(){
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
    	parent.$(".Content-Main").load("booksM/doaddBook",
    			{"bookname":bookname,"authorname":authorname,
    		"issuedate":issuedate,"classify":classify,"status":status,
    		"description":description});
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
   	
   	function checkDescription(){
   		if($('#description').val().length==0){
			$('#description').val("写点什么吧");
	    	$('#description').css("border","1px solid red");
		}else if($('#description').val().length>100){
			$('#description').val("简介太长啦");
	    	$('#description').css("border","1px solid red");
		}else{
			$('#description').css("border","1px solid green");
		}
   	}
   	
   	function checkIssuedate(){
   		if($('#issuedate').val().length<0){
	    	$('#issuedate').css("border","1px solid red");
		}else{
			$('#issuedate').css("border","1px solid green");
		}
   	}
    </script>
    
</head>

<body>
<h3 style="margin-left: 110px">添加图书</h3>

<form role="form" class="addform" method="post" >
    <table class="table">
        <tr>
            <td>
                <div class="form-group">
                    <label for="bookname">书籍的名称</label>
                    <input type="text" name="bookname" class="form-control" id="bookname" value="书名" onfocus="javascript:if(this.value=='书名'||this.value=='书名长度小于15位字符')this.value=''" onblur="if(this.value =='') this.value ='书名'" onchange="checkbookName()">
                </div>
            </td>
            <td>
                <div class="form-group">
                    <label for="bookauther">书籍的作者</label>
                    <input type="text" name="authorname" class="form-control" id="authorname" value="作者" onfocus="javascript:if(this.value=='作者'||this.value=='名字过长')this.value=''" onblur="if(this.value =='') this.value ='作者'" onchange="checkauthorName()">
                </div>
            </td>
        </tr>
        <tr>
            <td>                
                <div class="form-group">
                    <label for="classify">书籍的分类</label>
                   <div class="btn-group">
                    <input type="text" name="classify" id="classify" class="form-control dropdown-toggle" style="border:1px solid red;background: #fff" readonly="true" data-toggle="dropdown" value="书籍的分类" onfocus="javascript:if(this.value=='书籍的分类')this.value=''" onblur="if(this.value !=' ') this.style ='border:1px solid green'"/>
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
                    <label for="classify">书籍的分类</label>
                    <div class="btn-group">
                    <select name="classify" id="classify">
                    	<option value="文学">文学</option>
                    	<option value="小说">小说</option>
                    	<option value="计算机与互联网">计算机与互联网</option>
                    	<option value="历史">历史</option>
                    	<option value="哲学">哲学</option>
                    	<option value="经济">经济</option>
                    </select>
                    </div>
                </div>-->
            </td>
            <td>
                <div class="form-group">
                    <label for="puttime">出版时间</label>
                    <input type="date" class="form-control" name="issuedate" id="issuedate" placeholder="出版时间" onchange="checkIssuedate()">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="form-group">
                    <textarea class="form-control" id="description" id="description" name="description" rows="4" placeholder="书的简介" onfocus="javascript:if(this.value=='书的简介'||this.value=='写点什么吧'||this.value=='简介太长啦')this.value=''" onblur="if(this.value =='') this.value ='书的简介'" onchange="checkDescription()"></textarea>
                </div>
        	</td>
        </tr>

        <tr>
            <td colspan="2">
                <button type="button" class="btn btn-default" onclick="addBook()">添加</button>
            </td>
        </tr>
    </table>
  </form>
</body>

</html>