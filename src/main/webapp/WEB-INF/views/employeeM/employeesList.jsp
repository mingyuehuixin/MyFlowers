<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="com.lyh.flowers.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        td{
            vertical-align: middle !important;
        }
    </style>
    <script>
    	/*
        $(document).ready(function(){
            $("td .edit").click(function(){
                $(".Content-Main").load("employeeM/editEmployees");
            });
        });*/
        function editEmp(empno){
        	parent.$(".Content-Main").load("employeeM/editEmployees",{"empno":empno});
        }
        
        function deleteEmp(empno){
        	parent.$(".Content-Main").load("employeeM/deleteEmployees",{"empno":empno});
        }
        var limit=<%=request.getAttribute("limit")%>
        var start=<%=request.getAttribute("start")%>
        var allpage=<%=request.getAttribute("allpage")%>
        var alllist=<%=request.getAttribute("alllist")%>
    	var quert_empname ="<%=request.getAttribute("quert_empname")%>"
    	var quert_empemail ="<%=request.getAttribute("quert_empmail")%>"

        function prePage(){
        	start=start-limit;
        	if(isQuert()){
        		parent.$(".Content-Main").load("employeeM/allEmpsQuertListByLimit",{start:start,limit:limit,"quert_empname":quert_empname,"quert_empemail":quert_empemail});
        	}else{
            	parent.$(".Content-Main").load("employeeM/allEmpsListByLimit",{start:start,limit:limit});
        	}
        }
        function nextPage(){
        	start=start+limit;
        	if(isQuert()){
        		parent.$(".Content-Main").load("employeeM/allEmpsQuertListByLimit",{start:start,limit:limit,"quert_empname":quert_empname,"quert_empemail":quert_empemail});
        	}else{
            	parent.$(".Content-Main").load("employeeM/allEmpsListByLimit",{start:start,limit:limit});
        	}
        }
        function firstPage(){
        	if(isQuert()){
        		parent.$(".Content-Main").load("employeeM/allEmpsQuertListByLimit",{start:0,limit:limit,"quert_empname":quert_empname,"quert_empemail":quert_empemail});
        	}else{
        		parent.$(".Content-Main").load("employeeM/allEmpsListByLimit",{start:0,limit:limit});	
        	}
        }
        function lastPage(){
        	if(isQuert()){
        		parent.$(".Content-Main").load("employeeM/allEmpsQuertListByLimit",{start:(allpage-1)*limit,limit:limit,"quert_empname":quert_empname,"quert_empemail":quert_empemail});
        	}else{
            	parent.$(".Content-Main").load("employeeM/allEmpsListByLimit",{start:(allpage-1)*limit,limit:limit});
        	}
        }
        
        function isQuert(){
        	if(("null"==quert_empemail&&"null"==quert_empname)||(quert_empname==null&&quert_empemail==null)){
        		return 0;
        	}else{
        		if(quert_empname==null||quert_empname=="null"){
        			quert_empname=-1;
        		}
        		if(quert_empemail==null||quert_empname=="null"){
        			quert_empemail=-1;
        		}
        		return 1;
        	}
        }
        
        function checkEmpName(){
 			if($('#queryEmpname').val().length>10){
 				$('#queryEmpname').val("名字长度小于10位字符");
 		    	$('#queryEmpname').css("border","1px solid red");
 			}else{
 				$('#queryEmpname').css("border","1px solid green");
 			}
 			
 		}
        
        function checkEmpEmail(){
 			if(!$("#queryEmpemail").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
 				$('#queryEmpemail').val("邮箱格式错误");
  		       $('#queryEmpemail').css("border","1px solid red");
 			}else{
 				$('#queryEmpemail').css("border","1px solid green");
 			}
 		}
        
        function queryEmp(){
        	var queryEmpname = $('#queryEmpname').val();
 			var queryEmpmail = $('#queryEmpemail').val();
 			var flag = 0;
 			if(queryEmpname=="查询姓名"){
 				queryEmpname = "-1";
 			}
 			if(queryEmpmail=="查询邮箱"){
 				queryEmpmail= "-1";
 			}
 			if(queryEmpname==""||queryEmpname=="名字长度小于10位字符"){
 				flag=1;
 				$('#queryEmpname').css("border","1px solid red");
 			}
 			if(queryEmpmail==""||queryEmpmail=="邮箱格式错误"){
 				flag=1;
 				$('#queryEmpemail').css("border","1px solid red");
 			}if(flag==1){
 				return;
 			}
 			parent.$(".Content-Main").load("employeeM/queryEmployeesSubmit",{"queryName":queryEmpname,"queryMail":queryEmpmail});
        }
    </script>
</head>
<body>
<div style="height: 480px;overflow:auto">
<table class="table" width="1460px" border="0" style="font-weight: 100;">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px;color:black;background: #FFFFFF;text-align: center;">
    	<td colspan="1"><strong>姓名:</strong></td>
    	<td  colspan="3"><input type="text" id="queryEmpname" class="form-control" value="查询姓名" onfocus="javascript:if(this.value=='查询姓名'||this.value=='名字长度小于10位字符')this.value=''" onblur="if(this.value =='') this.value ='查询姓名'" onchange="checkEmpName()"/></td>
    	<td colspan="1"><strong>邮箱:</strong></td>
    	<td  colspan="3"><input type="text" id="queryEmpemail" class="form-control" value="查询邮箱" onfocus="javascript:if(this.value=='查询邮箱'||this.value=='邮箱格式错误')this.value=''" onblur="if(this.value =='') this.value ='查询邮箱'" onchange="checkEmpEmail()"/></td>
    	<td colspan="3"><button  type="button" style="background: :#c0c0c0;width: 200px" class="edit btn btn-default btn-sm" onclick="queryEmp()"><strong>查询</strong></button></td>
    </tr>
    <tr style="font-size: 14px;color:black;background: #FFFF99;">
        <th><strong>姓名</strong></th>
        <th><strong>工号</strong></th>
        <th><strong>邮箱</strong></th>
        <th><strong>电话</strong></th>
        <th><strong>性别</strong></th>
        <th><strong>状态</strong></th>
        <th style="font-size: 9px"><strong>是否是管理员</strong></th>
        <th><strong>创建时间</strong></th>
        <th style="font-size: 11px"><strong>最后更新时间</strong></th>
        <th colspan="2"><strong>操作</strong></th>
    </tr>
    </thead>
    <tbody>
    <%List<Employee> allEmp = (List<Employee>)request.getAttribute("lEmps");
		for (Employee emp: allEmp) {       
		if("不可用".equals(emp.getStatus())){%>    
		<tr style="background: #99CC99;readonly:true" >
        <td><%=emp.getEmpname()%></td>
        <td><%=emp.getEmpno()%></td>
        <td><%=emp.getEmail()%></td>
        <td><%=emp.getPhonenumber()%></td>
        <td><%=emp.getSex()%></td>
        <td ><%=emp.getStatus()%></td>
        <td><%=emp.getIsadmin()%></td>
        <td><%=emp.getCreatetime()%></td>
        <td><%=emp.getLastupdatetime()%></td>
        <td><button  type="button" style="background: #FFFF99" class="edit btn btn-default btn-sm" onclick="editEmp(<%=emp.getEmpno()%>)"><strong>编辑</strong></button></td>
        <td><button style="background: #666666;color:#aaffff;" type="button" class="btn btn-default btn-sm" onclick="deleteEmp(<%=emp.getEmpno()%>)"><strong>删除</strong></button></td>        
        </tr>
        <%}else{%>
        	<tr style="background: #CCCC99">
            <td><%=emp.getEmpname()%></td>
            <td><%=emp.getEmpno()%></td>
            <td><%=emp.getEmail()%></td>
            <td><%=emp.getPhonenumber()%></td>
            <td><%=emp.getSex()%></td>
            <td><%=emp.getStatus()%></td>
            <td><%=emp.getIsadmin()%></td>
            <td><%=emp.getCreatetime()%></td>
        	<td><%=emp.getLastupdatetime()%></td>
            <td><button  type="submit" style="background: #FFFF99" class="edit btn btn-default btn-sm" onclick="editEmp(<%=emp.getEmpno()%>)"><strong>编辑</strong></button></td>
            <td><button style="background: #666666;color:#aaffff;" type="button" class="btn btn-default btn-sm" onclick="deleteEmp(<%=emp.getEmpno()%>)"><strong>删除</strong></button></td>
            </tr>
        <%}}%>

</div>
    </tbody>
</table>
</div>
        <h4 style="text-align: center;height:16px" ><%=request.getAttribute("page")%></h4>
	<div style="text-align: right;margin-right: 30px">
	<ul class="pagination" >
    <li class="previous" onclick="prePage();"><a href="#">&larr; 前一页</a></li>
    <li id="firstpage" onclick="firstPage();"><a href="#">首页</a></li>
    <li><a href="#" onclick="lastPage();">末页</a></li>
    <li class="next" onclick="nextPage();"><a href="#">后一页 &rarr;</a></li></ul>
</body>
</html>