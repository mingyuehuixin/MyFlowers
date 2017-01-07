<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./static/css/navi.css">
    <script src="./static/js/jquery.min.js"></script>
    <script src="./static/bootstrap/js/bootstrap.min.js"></script>
    <style>
        html { overflow-y: scroll; }
        body{background-image: url("./static/image/bg.jpg");}
    </style>
    <script>
        $(document).ready(function(){
            $("#allbooks").click(function(){
                $(".Content-Main").load("booksBorrow/allBooksList");
            });
        });
        $(document).ready(function(){
            $("#forreturn").click(function(){
                $(".Content-Main").load("booksBorrow/forReturnBooks");
            });
        });
        $(document).ready(function(){
            $("#borrowed").click(function(){
                $(".Content-Main").load("booksBorrow/myBooks");
            });
        });
        $(document).ready(function(){
            $("#addbooks").click(function(){
                $(".Content-Main").load("booksM/addBook");
            });
        });
        $(document).ready(function(){
            $("#editbooks").click(function(){
                $(".Content-Main").load("booksM/editBookList");
            });
        });
        $(document).ready(function(){
            $("#quirybooks").click(function(){
                $(".Content-Main").load("booksM/queryBooksList");
            });
        });
        $(document).ready(function(){
            $("#borrowapplylist").click(function(){
                $(".Content-Main").load("borrowM/applyedList");
            });
        });
        $(document).ready(function(){
            $("#borrowedlist").click(function(){
                $(".Content-Main").load("borrowM/borrowedList");
            });
        });
        $(document).ready(function(){
            $("#addemployee").click(function(){
                $(".Content-Main").load("employeeM/addEmployee");
            });
        });

        $(document).ready(function(){
            $("#editemployee").click(function(){
                $(".Content-Main").load("employeeM/employeesList");
            });
        });
        $(document).ready(function(){
            $("#buyapply").click(function(){
                $(".Content-Main").load("booksBorrow/buyApply");
            });
        });
        $(document).ready(function(){
            $("#systemconfig").click(function(){
                $(".Content-Main").load("system/config");
            });
        });
        
        $(document).ready(function(){
            $("#buyapplylist").click(function(){
                $(".Content-Main").load("buy/applyList");
            });
        });
        
        
        function quitIndex(){
        		window.location.href = "/org.lyh.flowers/user/login";
        }
    </script>
</head>
<body>
<div class="Container">
    <div class="Header">
        <ul class="naviul">
            <li class="navili">
                <img src="./static/image/bookhead.png" width="40px" height="40px">
            </li>
            <li class="navili">
                <a href="#" class="lititle"> HPE图书系统</a>
                <p style="float: left;margin-left: 10px"><strong>--书读百遍，其义自见</strong></p>
            </li>
          <li class="navili">
                <a href="#" class="lilogin"></a>
            </li> 
            <li class="navili">
                <img src="./static/image/exit.png" width="36px" height="36px">
                <a href="#" onclick="quitIndex()">退出</a>
            </li>
        </ul>
    </div>
    <div class="Headdetail">
        <ul class="nav nav-tabs" style="height: 40px">
        <%String adminstatus = (String)session.getAttribute("adminStatus");
			if("1".equals(adminstatus)||adminstatus==null||"".equals(adminstatus)){    %>
            <li><p style="font-size: 10px;margin-left: 20px;margin-top: 10px"><strong>您好管理员:<%=(String)session.getAttribute("loginUser")%></strong></p></li>
            <%}else{%>
             <li><p style="font-size: 10px;margin-left: 40px;margin-top: 10px"><strong>您好:<%=(String)session.getAttribute("loginUser")%></strong></p></li>	
            <% }%>
            <li style="float: right;font-size: 12px"><a href="#" style="color: #0f0f0f">联系我们</a></li>
            <li style="float: right;font-size: 12px"><a href="#" style="color: #0f0f0f">帮助</a></li>
            <li style="float: right;margin-right: 10px">
                <div class="btn-group" style="margin-top: 4px">
                    <p type="button" class="btn btn-default dropdown-toggle"
                       data-toggle="dropdown">
                        DDC <span class="caret"></span>
                    </p>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">DDC</a></li>
                        <li><a href="#">I&A</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>
<%
	adminstatus = (String)session.getAttribute("adminStatus");
	if("0".equals(adminstatus)||adminstatus==null||"".equals(adminstatus)){    %>
<div class="Content">
    <div class="Content-Left">
        <div class="sidebar-menu">

            <div>
                <a href="#systemMenu" class="nav-header menu-first collapsed" data-toggle="collapse">系统</a>
                <ul id="systemMenu" class="nav nav-list collapse menu-second">
                    <li id="email"><a href=#"> 系统邮件</a></li>
                    <!-- <li id="systemconfig"><a href="#">默认配置</a></li> -->
                </ul>
            </div>
            <!-- 
            <div>
                <a href="#booksManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">图书管理</a>
                <ul id="booksManMenu" class="nav nav-list collapse menu-second">
                    <li id="addbooks"><a href=#"> 新增图书</a></li>
                    <li id="editbooks"><a href=#"> 查询修改图书</a></li>
                </ul>
            </div>
                <div>
                    <a href="#borrowManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">借阅管理</a>
                    <ul id="borrowManMenu" class="nav nav-list collapse menu-second">
                        <li id="borrowapplylist"><a href=#"> 借阅申请列表</a></li>
                        <li id="borrowedlist"><a href=#"> 已借图书列表</a></li>
                    </ul>
                </div>
                <div>
                    <a href="#employeeManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">员工管理</a>
                    <ul id="employeeManMenu" class="nav nav-list collapse menu-second">
                        <li id="addemployee"><a href=#"> 新增员工</a></li>
                        <li id="editemployee"><a href=#"> 查询修改员工</a></li>
                    </ul>
                </div>-->
            <div> 
                <a href="#booksMenu" class="nav-header menu-first collapsed" data-toggle="collapse">书籍借阅</a>
                <ul id="booksMenu" class="nav nav-list collapse menu-second">
                    <li id="allbooks"><a href="#"> 图书浏览</a></li>
                    <li id="borrowed"><a href="#">我的图书</a></li>
                    <li id="buyapply"><a href="#">购书申请</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="Content-Main">Content-Main</div>
</div>
</div>
<%}else{%>

<div class="Content">
    <div class="Content-Left">
        <div class="sidebar-menu">

            <div>
                <a href="#systemMenu" class="nav-header menu-first collapsed" data-toggle="collapse">系统</a>
                <ul id="systemMenu" class="nav nav-list collapse menu-second">
                    <li id="email"><a href="#"> 系统邮件</a></li>
                    <li id="systemconfig"><a href="#">默认配置</a></li>
                </ul>
            </div>
            <div>
                <a href="#booksManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">图书管理</a>
                <ul id="booksManMenu" class="nav nav-list collapse menu-second">

                    <li id="addbooks"><a href=#"> 新增图书</a></li>
                    <li id="editbooks"><a href=#"> 编辑图书</a></li>
                    <li id="quirybooks"><a href=#"> 查询图书</a></li>
                </ul>
            </div>
                <div>
                    <a href="#borrowManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">借阅管理</a>
                    <ul id="borrowManMenu" class="nav nav-list collapse menu-second">
                        <li id="borrowapplylist"><a href="#"> 借阅申请列表</a></li>
                        <li id="borrowedlist"><a href="#"> 已借图书列表</a></li>
                        <li id="buyapplylist"><a href="#"> 购买图书列表</a></li>
                        
                    </ul>
                </div>
                <div>
                    <a href="#employeeManMenu" class="nav-header menu-first collapsed" data-toggle="collapse">员工管理</a>
                    <ul id="employeeManMenu" class="nav nav-list collapse menu-second">
                        <li id="addemployee"><a href="#"> 新增员工</a></li>
                        <li id="editemployee"><a href="#"> 查询修改员工</a></li>
                    </ul>
                </div>
            <div>
                <a href="#booksMenu" class="nav-header menu-first collapsed" data-toggle="collapse">书籍借阅</a>
                <ul id="booksMenu" class="nav nav-list collapse menu-second">
                    <li id="allbooks"><a href="#"> 图书浏览</a></li>
                    <li id="borrowed"><a href="#">我的图书</a></li>
                    <li id="buyapply"><a href="#">购书申请</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="Content-Main">Content-Main</div>

</div>
<%}%>

</body>
</html>