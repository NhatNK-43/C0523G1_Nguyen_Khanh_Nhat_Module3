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
<form action="/product?action=searchByIdUpdate" method="post">
  <h2>Chỉnh sửa sản phẩm</h2>
  <label for="idUpdate">Id sản phẩm cần sửa</label>
  <input id="idUpdate" type="text" name="idUpdate">
  <button type="submit">Hiển thị</button>
</form>
</body>
</html>
