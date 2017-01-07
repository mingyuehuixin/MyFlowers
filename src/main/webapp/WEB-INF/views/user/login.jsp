<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="Expand, contract, animate forms with jQuery wihtout leaving the page"/>
    <meta name="keywords" content="expand, form, css3, jquery, animate, width, height, adapt, unobtrusive javascript"/>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="../static/css/style.css"/>
    <script type="text/javascript" language="javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript">
    	function checkEmpNo(){
    		var re = /^[0-9]+.?[0-9]*$/;
			 if (!re.test($('#empno').val())){
		       $('#empno').val("员工号格式不对");
		       $('#empno').css("border","1px solid red");
		     }else if($('#empno').val().length!=8){
		    	$('#empno').val("员工号格式不对");
		    	$('#empno').css("border","1px solid red");
		     }else{
		    	 $('#empno').css("border","1px solid green");
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
		

		
		function login(){
			var empname = $('#empno').val();
 			var password = $('#password').val();
 			var flag = 0;
 			if(empname=="员工号"||empname==""||empname=="员工号格式不对"){
 				flag=1;
 				$('#empno').css("border","1px solid red");
 			}
 			if(password=="密码"||password==""||password=="密码长度6~12位字符"){
 				flag=1;
 				$('#password').css("border","1px solid red");
 			}
 			if(flag==1){
 				return;
 			}
 			//alert("zhe");
 			//parent.$(".Content-Main").load("user/login",{"empname":empname,"password":password});
 			$.ajax({
 				 type:"post",
 				 url:"login",
 				 data:{"empno":empname,"password":password},
 				 timeout:1000,
 				 success:function(result){
 					if(result=="\"0\""){
 						$('#password').css("border","1px solid red");
 						$('#empname').css("border","1px solid red");
 						$('#errorNotify').text( "员工号或者密码错误!" );
 						$('#errorNotify').css("color","red");
 					}else if(result=="\"1\""){
 						window.location.href = "../index.jsp";
 					}
 				},
 				error:function(e){	
 					alert(e);
 				}
 			 });
		}
    </script>
</head>
<body>
<div class="wrapper" style="margin-top: 100px">
    <div class="content">
        <div id="form_wrapper" class="form_wrapper">
            <form class="login active" action="index.html">
                <h3>登录</h3>
                <div>
                    <label>员工号:</label>
                    <input type="text" id="empno" class="form-control" value="员工号" onfocus="javascript:if(this.value=='员工号'||this.value=='员工号格式不对')this.value=''" onblur="if(this.value =='') this.value ='员工号'" onchange="checkEmpNo()"/>
                    <span class="error">错误</span>
                </div>
                <div>
                     <!-- <a href="forgotPassword" rel="forgot_password"
                                  class="forgot linkform">忘记密码</a>-->
                    <label>密码:</label> 
                     <input type="text" id="password" class="form-control" value="密码" onfocus="javascript:if(this.value=='密码'||this.value=='密码长度6~12位字符')this.value=''" onblur="if(this.value =='') this.value ='密码'" onchange="checkEmpPwd()"/>
                    <span class="error">错误</span>
                </div>
                <div style="text-align: center">
                	<asp:Label ID="errorNotify" ></asp:Label>
                </div>
                <div class="bottom" style="height: 100px">
                    <div class="remember" style="margin-top: 40px;"><input type="checkbox"/><span>记住密码</span></div>            
                   <!-- <a href="register.html" rel="register" class="linkform">你还没有注册，注册一个？</a> -->
                   <input type="button" style="width: 170px;height:40px;padding: 10px;margin-top: 30px" value="登录" onclick="login()"/>
                    <div class="clear"></div>
                </div>
               
            </form>
        </div>
        <div class="clear"></div>
    </div>
</div>


<!-- The JavaScript -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>