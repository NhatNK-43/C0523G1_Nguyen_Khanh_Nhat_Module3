<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 11:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/product?action=delete" method="post">
        <h2>Xóa sản phẩm</h2>
        <label for="idDelete">Id sản phẩm cần xóa</label>
        <input id="idDelete" type="text" name="idDelete">
        <button type="submit">Xóa</button>
    </form>
</body>
</html>
