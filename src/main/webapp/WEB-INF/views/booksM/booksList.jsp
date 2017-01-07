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

        td {
            vertical-align: middle !important;
        }
    </style>
    <script>
        $(document).ready(function(){
            $("td .edit").click(function(){
                $(".Content-Main").load("booksM/editBooks");
            });
        });
    </script>
</head>
<body>
<table class="table" width="1460px" border="1">
    <!--<caption>基本的表格布局</caption>-->
    <thead>
    <tr style="font-size: 14px">
        <th>书名</th>
        <th>作者</th>
        <th>简介</th>
        <th>分类</th>
        <th>出版时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>老人与海</td>
        <td>海明威</td>
        <td>主人公桑提亚哥是个贫困倒运的老渔夫,他年迈体衰但仍保持着年轻时坚韧、勇敢、好胜和自豪的性格。他已经84天没捕到鱼,第.</td>
        <td>文学</td>
        <td>2016/9/12</td>
        <td>
            <button type="submit" class="edit btn btn-default btn-sm">编辑</button>
            <button type="button" class="btn btn-default btn-sm">删除</button>

        </td>
    </tr>
    <tr>
        <td>平凡的世界</td>
        <td>路遥</td>
        <td></td>
        <td>文学</td>
        <td>2016/9/10</td>
        <td>
            <button type="button" class="edit btn btn-default btn-sm">编辑</button>
            <button type="button" class="btn btn-default btn-sm">删除</button>
        </td>
    </tr>
    </tbody>
</table>

</body>
</html>