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
<form action="/product?action=searchById" method="post">
  <h2>Chi tiết sản phẩm</h2>
  <label for="idSearch">Id sản phẩm cần xem</label>
  <input id="idSearch" type="text" name="idSearch">
  <button type="submit">Hiển thị</button>
</form>
</body>
</html>
