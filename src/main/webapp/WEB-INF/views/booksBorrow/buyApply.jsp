<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   
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

 
 function submitApply(){
	 var bookname=$("#bookname").val();
	 var bookauther=$("#bookauther").val();
	 var issuetime=$("#issuetime").val();
	 var buyUrl=$("#buyUrl").val();
	 var descripe=$("#descripe").val();
     parent.$(".Content-Main").load("booksBorrow/buyApplySubmit",
    		 {bookname:bookname,bookauther:bookauther,issuetime:issuetime,buyUrl:buyUrl,descripe:descripe});
 
     alert("提交成功");
 }
 
 </script>
        
</head>
<body>
<h3 style="margin-left: 110px">购买图书申请</h3>
<form role="form" class="addform">
    <table class="table">
        <tr>
            <td>
                <div class="form-group">
                    <label for="bookname">书籍的名称</label>
                    <input type="text" class="form-control" id="bookname" placeholder="书名">
                </div>
            </td>
            <td>
                <div class="form-group">
                    <label for="bookauther">书籍的作者</label>
                    <input type="text" class="form-control" id="bookauther" placeholder="作者">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group">
                    <div class="btn-group">
                       <label for="issuetime">出版时间</label>
                       <input type="date" class="form-control" id="issuetime" placeholder="时间">
                    </div>
                </div>
            </td>
            <td>
                <div class="form-group">
                    <label for="buyUrl">购书URL</label>
                    <input type="text" class="form-control" id="buyUrl" placeholder="URL">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="form-group">
                    <textarea class="form-control" id="descripe" rows="4" placeholder="书籍的简介"></textarea>
                </div>
        </tr>

        
        <tr>
            <td colspan="2">
                <button type="button" class="btn btn-default" onclick="submitApply()">提交</button>
            </td>
        </tr>
    </table>

</form>
</body>
</html>