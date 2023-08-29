<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 29/08/2023
  Time: 2:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <style>
        fieldset{
            width: 200px;
        }
        button{
            margin: 5px;
        }
        legend{
            color: red;
            font-weight: bold;
        }
        a{
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <fieldset>
        <legend>Quản lý sản phẩm</legend>
        1.&nbsp;<button><a href="/product?action=display" role="button">Hiển thị</a></button><br>
        2.&nbsp;<button><a href="/create.jsp" role="button">Thêm mới</a></button><br>
        3.&nbsp;<button><a href="#" role="button">Cập nhật thông tin</a></button><br>
        4.&nbsp;<button><a href="#" role="button">Xóa sản phẩm</a></button><br>
        5.&nbsp;<button><a href="#" role="button">Xem chi tiết sản phẩm</a></button><br>
        6.&nbsp;<button><a href="#" role="button">Tìm kiếm sản phẩm</a></button>
    </fieldset>
<%--    <a href="/index.jsp">Quay lại trang chủ</a>--%>
</body>
</html>
