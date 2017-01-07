<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<title>Insert title here</title>-->
    <!--<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">-->
    <!--<link rel="stylesheet" href="../static/css/navi.css">-->
    <!--<script src="../static/js/jquery.min.js"></script>-->
    <!--<script src="../static/bootstrap/js/bootstrap.min.js"></script>-->


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
</head>
<body>

<table class="table" width="1460px" >
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px">
        <th>书名</th>
        <th>分类</th>
        <th>借出时间</th>
        <th>归还时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>平凡的世界</td>
        <td>文学类</td>
        <td>2016/9/10</td>
        <td>2016/9/20</td>
        <td>
            <button type="button" class="btn btn-default btn-sm">归还</button>
        </td>
    </tr>
    </tbody>
</table>

</body>
</html>