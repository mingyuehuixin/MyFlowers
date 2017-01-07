<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style>
        .form-group {
            margin-left: 100px;
            width: 200px;
            float: left;

        }
    </style>
    <script type="text/javascript" language="javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript">
 	$(function(){
     	$('#statusItem').find('li').each(function(){
     		$(this).click(function(){
     			$('#status').val($(this).text());
     		})
     	})
     	
     	$('#sexItem').find('li').each(function(){
     		$(this).click(function(){
     			$('#sex').val($(this).text());
     		})
     	})
     	$('#isadminItem').find('li').each(function(){
     		$(this).click(function(){
     			$('#isadmin').val($(this).text());
     		})
     	})    
     	});
 		
 		function checkEmpName(){
 			if($('#empname').val().length>10){
 				$('#empname').val("名字长度小于10位字符");
 		    	$('#empname').css("border","1px solid red");
 			}else{
 				$('#empname').css("border","1px solid green");
 			}
 			
 		}
 		
 		function checkEmpPwd(){
 			if(6<=$('#password').val().length&&$('#password').val().length<=12){
 		    	$('#password').css("border","1px solid green");
 			}else{
 				$('#password').val("密码长度6~12位字符");
 		    	$('#password').css("border","1px solid red");
 			}
 			
 		}
 		
 		function checkEmpPhone(){
 			if (!$("#phonenumber").val().match(/^1[3,5,8]\d{9}$/)){
 				$('#phonenumber').val("手机格式错误");
 		    	$('#phonenumber').css("border","1px solid red");
 			}else{
 				$('#phonenumber').css("border","1px solid green");
 			}
 		}
 		
 		function checkEmpNo(){
 			var re = /^[0-9]+.?[0-9]*$/;
 			 if (!re.test($('#empno').val())){
 		       $('#empno').val("员工号为8位数字");
 		       $('#empno').css("border","1px solid red");
 		     }else if($('#empno').val().length!=8){
 		    	$('#empno').val("员工号为8位数字");
 		    	$('#empno').css("border","1px solid red");
 		     }else{
 			 var empno = $('#empno').val();
 			 $.ajax({
 				 type:"post",
 				 url:"employeeM/addEmployeeCheck",
 				 data:{"empno":empno},
 				 timeout:1000,
 				success:function(result){
 					if(result=="\"1\""){
 						$('#empno').css("border","1px solid green");
 					}else{
 						$('#empno').val("员工号已添加");
 						$('#empno').css("border","1px solid yellow");
 					}
 				},
 				error:function(){
 					
 				}
 			 });
 		     }
		}
 		
 		function checkEmpEmail(){
 			if(!$("#emaill").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
 				$('#emaill').val("邮箱格式错误");
  		       $('#emaill').css("border","1px solid red");
 			}else{
 				var email = $('#emaill').val();
 	 			 $.ajax({
 	 				 type:"post",
 	 				 url:"employeeM/addEmployeeCheck",
 	 				 data:{"email":email},
 	 				 timeout:1000,
 	 				success:function(result){
 	 					if(result=="\"1\""){
 	 						$('#emaill').css("border","1px solid green");
 	 					}else{
 	 						$('#emaill').val("邮箱已添加");
 	 						$('#emaill').css("border","1px solid yellow");
 	 					}
 	 				},
 	 				error:function(){	
 	 				}
 	 			 });
   		       
 			}
 		}

     	
 		$('#addEmployee').click(function(){
 			var url = "employeeM/addEmployee";
 			//var dates = getEmpDates();
 			var empname = $('#empname').val();
 			var empno = $('#empno').val();
 			var email = $('#emaill').val();
 			var password = $('#password').val();
 			var sex = $('#sex').val();
 			var status = $('#status').val();
 			var phonenumber = $('#phonenumber').val();
 			var isadmin = $('#isadmin').val();
 			var flag = 0;
 			if(empname=="姓名"||empname==""||empname=="名字长度小于10位字符"){
 				flag=1;
 				$('#empname').css("border","1px solid red");
 			}
 			if(empno=="员工号"||empno==""||empno=="员工号为8位数字"||empno=="员工号已添加"){
 				flag=1;
 				$('#empno').css("border","1px solid red");
 			}
 			if(email=="邮箱"||email==""||email=="邮箱格式错误"||email=="邮箱已添加"){
 				flag=1;
 				$('#emaill').css("border","1px solid red");
 			}
 			if(password=="密码"||password==""||password=="密码长度6~12位字符"){
 				flag=1;
 				$('#password').css("border","1px solid red");
 			}
 			if(sex=="性别"||sex==""){
 				flag=1;
 				$('#sex').css("border","1px solid red");
 			}
 			if(status=="状态"||status==""){
 				flag=1;
 				$('#status').css("border","1px solid red");
 			}
 			if(phonenumber=="手机号码"||phonenumber==""||phonenumber=="手机格式错误"){
 				flag=1;
 				$('#phonenumber').css("border","1px solid red");
 			}
 			if(isadmin=="是否是管理员"||isadmin==""){
 				flag=1;
 				$('#isadmin').css("border","1px solid red");
 			}
 			if(flag==1){
 				return;
 			}
 			status = status.substr(0,1);
 			isadmin = isadmin.substr(0,1);
 			//alert(dates);
 			$.ajax({
 				type:"post",
 				url:url,
 				data:{"empname":empname,"empno":empno,"emaill":email,"password":password,"sex":sex,"status":status,"phonenumber":phonenumber,"isadmin":isadmin},
 				timeout:1000,
 				success:function(url){
 					//alert(dates);
 					//location.reload(dates);
 					url=url.substr(1,url.length-2)
 					$('#Emp').load(url);
 				},
 				error:function(err){
 					alert(err);
 				}
 			});
 			//parent.$(".Content-Main").load("booksBorrow/allBooksListByLimit",{start:"0",limit:"2"}); 
 		});
    </script>
</head>
<body>
<div style="margin-top: 10px" id="Emp">
    <form role="form" style="float:left;padding: 20px">
        <h3 style="margin-left: 100px">添加新员工</h3>
        <hr/>
        <div style="width: 100%" >
            <div class="form-group">
                <label for="empname">员工姓名</label>
                <input type="text" id="empname" class="form-control" value="姓名" onfocus="javascript:if(this.value=='姓名'||this.value=='名字长度小于10位字符')this.value=''" onblur="if(this.value =='') this.value ='姓名'" onchange="checkEmpName()"/>
            </div>
            <div class="form-group">
                <label for="empno">员工号</label>
                <input type="text" id="empno" class="form-control" value="员工号" onfocus="javascript:if(this.value=='员工号为8位数字'||this.value=='员工号'||this.value=='员工号已添加')this.value=''" onblur="if(this.value =='') this.value ='员工号'" onchange="checkEmpNo()"/>
            </div>
        </div>
        <div style="width: 100%">
            <div class="form-group">
                <label for="email">个人邮箱</label>
                 <input type="text" id="emaill" class="form-control" value="邮箱" onfocus="javascript:if(this.value=='邮箱'||this.value=='邮箱格式错误'||this.value=='邮箱已添加')this.value=''" onblur="if(this.value =='') this.value ='邮箱'" onchange="checkEmpEmail()"/>
            </div>
            <div class="form-group">
                <label for="password">密码</label>
				 <input type="text" id="password" class="form-control" value="密码" onfocus="javascript:if(this.value=='密码'||this.value=='密码长度6~12位字符')this.value=''" onblur="if(this.value =='') this.value ='密码'" onchange="checkEmpPwd()"/>

            </div>
        </div>

        <div style="width: 100%">
                <div class="form-group">
                <label for="phonenumber">手机号码</label>
				 <input type="text" id="phonenumber" class="form-control" value="手机号码" onfocus="javascript:if(this.value=='手机号码'||this.value=='手机格式错误')this.value=''" onblur="if(this.value =='') this.value ='手机号码'" onchange="checkEmpPhone()"/>
        		</div>

            <div class="form-group">
                <label for="status">状态</label>
                <div class="btn-group" style="margin-top: 4px">
                    <input type="text" id="status" class="form-control dropdown-toggle" style="border:1px solid red;background: #fff" readonly="true" data-toggle="dropdown" value="状态" onfocus="javascript:if(this.value=='状态')this.value=''" onblur="if(this.value !=' ') this.style ='border:1px solid green'"/>
                    <ul class="dropdown-menu" id="statusItem">
                        <li><a href="#">1.在职</a></li>
                        <li><a href="#">2.离职</a></li>
                        <li><a href="#">3.锁定:借书逾期未还</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="width: 100%">
		            <div class="form-group">
                <label for="sex">性别</label>
                <div class="btn-group" style="margin-top: 4px">
                     <input type="text" id="sex" class="form-control dropdown-toggle" style="border:1px solid red;background: #fff" readonly="true" data-toggle="dropdown" value="性别" onfocus="javascript:if(this.value=='性别')this.value=''" onblur="if(this.value!=' ') this.style ='border:1px solid green'"/>
                    <ul class="dropdown-menu" id="sexItem">
                        <li><a href="#">男</a></li>
                        <li><a href="#">女</a></li>
                    </ul>
                </div>
            </div>
       <div class="form-group">
                <label for="isadmin">是否是管理员</label>
                <div class="btn-group" style="margin-top: 4px">
                     <input type="text" id="isadmin" class="form-control dropdown-toggle" readonly="true" style="border:1px solid red;background: #fff" data-toggle="dropdown" value="是否是管理员" onfocus="javascript:if(this.value=='是否是管理员')this.value=''" onblur="if(this.value !=' ') this.style ='border:1px solid green'"/>
                    <ul class="dropdown-menu" id="isadminItem">
                        <li><a href="#">0.不是</a></li>
                        <li><a href="#">1.是</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="form-group">
            <button type="button" id="addEmployee" style="width: 200px;text-align: center;margin-top:21px;color:green" class="btn btn-default">添加</button>
        </div>
    </form>
</div>
<!--
<div style="margin-top: 10px" id="Emp">
	<form:form method="POST" modelAttribute="Employee">
	<form:input type="hidden" path="id" id="id" name="addEmployeePost"/>
    <form role="form" style="float:left;padding: 20px">
        <h3 style="margin-left: 100px">添加新员工</h3>
        <hr/>
        <div style="width: 100%" >
            <div class="form-group">
                <label for="empname">员工姓名</label>
                <form:input path="empname" id="empname" cssClass="form-control" value="姓名" onfocus="javascript:if(this.value=='姓名')this.value=''" onblur="if(this.value =='') this.value ='姓名'"/>
                <form:errors path="empname" cssClass="error"/>
            </div>
            <div class="form-group">
                <label for="empno">员工号</label>
                <form:input path="empno" id="empno" cssClass="form-control" value="员工号" onfocus="javascript:if(this.value=='员工号')this.value=''" onblur="if(this.value =='') this.value ='员工号'"/>
                <form:errors path="empno" cssClass="error"/>
            </div>
        </div>
        <div style="width: 100%">
            <div class="form-group">
                <label for="email">个人邮箱</label>
                 <form:input path="email" id="email" cssClass="form-control" value="邮箱" onfocus="javascript:if(this.value=='邮箱')this.value=''" onblur="if(this.value =='') this.value ='邮箱'"/>
                <form:errors path="email" cssClass="error"/>
            </div>
            <div class="form-group">
                <label for="password">密码</label>
				 <form:input path="password" id="password" cssClass="form-control" value="密码" onfocus="javascript:if(this.value=='密码')this.value=''" onblur="if(this.value =='') this.value ='密码'"/>
                <form:errors path="password" cssClass="error"/>
            </div>
        </div>

        <div style="width: 100%">
            <div class="form-group">
                <label for="sex">性别</label>
                <div class="btn-group" style="margin-top: 4px">
                     <form:input path="sex" id="sex" cssClass="form-control dropdown-toggle" data-toggle="dropdown" value="性别" onfocus="javascript:if(this.value=='性别')this.value=''" onblur="if(this.value =='') this.value ='性别'"/>
                     <form:errors path="sex" cssClass="error"/>
                    <ul class="dropdown-menu" role="menu" id="sexItem">
                        <li><a href="#">男</a></li>
                        <li><a href="#">女</a></li>
                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label for="status">状态</label>
                <div class="btn-group" style="margin-top: 4px">
                    <form:input path="status" id="status" cssClass="form-control dropdown-toggle" data-toggle="dropdown" value="状态" onfocus="javascript:if(this.value=='状态')this.value=''" onblur="if(this.value =='') this.value ='状态'"/>
                     <form:errors path="status" cssClass="error"/>
                    <ul class="dropdown-menu" role="menu" id="statusItem">
                        <li><a href="#">在职</a></li>
                        <li><a href="#">离职</a></li>
                        <li><a href="#">锁定:借书逾期未还</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="width: 100%">
        <div class="form-group">
                <label for="phonenumber">手机号码</label>
				 <form:input path="phonenumber" id="phonenumber" cssClass="form-control" value="手机号码" onfocus="javascript:if(this.value=='手机号码')this.value=''" onblur="if(this.value =='') this.value ='手机号码'"/>
                <form:errors path="phonenumber" cssClass="error"/>
        </div>
       <div class="form-group">
                <label for="isadmin">是否是管理员</label>
                <div class="btn-group" style="margin-top: 4px">
                     <form:input path="isadmin" id="isadmin" cssClass="form-control dropdown-toggle" data-toggle="dropdown" value="是否是管理员" onfocus="javascript:if(this.value=='是否是管理员')this.value=''" onblur="if(this.value =='') this.value ='是否是管理员'"/>
                     <form:errors path="isadmin" cssClass="error"/>
                    <ul class="dropdown-menu" role="menu" id="isadminItem">
                        <li><a href="#">是</a></li>
                        <li><a href="#">不是</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="form-group">
            <button type="button" id="addEmployee" style="width: 200px;text-align: center;margin-top:21px;color:green" class="btn btn-default">添加</button>
        </div>
    </form>
	</form:form>
</div>-->
</body>
</html>