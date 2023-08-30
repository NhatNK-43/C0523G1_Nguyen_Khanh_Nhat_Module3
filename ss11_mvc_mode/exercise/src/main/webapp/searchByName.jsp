<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 2:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=displaySearch" method="post">
  <h2>Tìm kiếm sản phẩm</h2>
  <label for="searchName">Tên sản phẩm cần tìm</label>
  <input id="searchName" type="text" name="searchName">
  <button type="submit">Tìm kiếm</button>
</form>
</body>
</html>
