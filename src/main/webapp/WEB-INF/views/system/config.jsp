<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function save(){
	var booknums=$("#booknums").val();
	var days=$("#days").val();
    parent.$(".Content-Main").load("system/saveConfig",{booknums:booknums,days:days},function(responseTxt,statusTxt,xhr){
    	<% String result=(String)request.getAttribute("result");
    	if(result!=null){%>
    	if(statusTxt=="success"){
        	alert('<%=request.getAttribute("result")%>');
    	}
    	<%}%>
    });

}
</script>
</head>
<body>
<div class="form" style="margin:40px">
                <div class="form-group" style="width:200px">
                    <label for="booknums">个人可借阅书籍总数</label>
                    <input type="number" name="booknums" class="form-control" id="booknums" value="<%=request.getAttribute("booknums")%>">
                </div>
                
                <div class="form-group" style="width:200px">
                    <label for="days">借阅归还天数</label>
                    <input type="number" name="days" class="form-control" id="days" value="<%=request.getAttribute("days")%>">
                </div>
                <button type="button" class="btn btn-default" onclick="save()">保存</button>
                
</div>

</body>
</html>