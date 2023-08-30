<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 1:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
  <style>
    fieldset{
      width: 300px;
    }
    legend{
      color: red;
      font-weight: bold;
    }
    td{
      padding: 5px;
    }
    a{
      text-decoration: none;
      color: black;
    }
  </style>
</head>
<body>
<fieldset>
  <legend>Chi tiết sản phẩm có mã sản phẩm: ${product.id}</legend>
  <table>
    <tr>
      <td>Mã sản phẩm:</td>
      <td><c:out value="${product.id}"/></td>
    </tr>
    <tr>
      <td>Tên sản phẩm:</td>
      <td><c:out value="${product.name}"/></td>
    </tr>
    <tr>
      <td>Giá:</td>
      <td><c:out value="${product.price}"/></td>
    </tr>
    <tr>
      <td>Mô tả:</td>
      <td><c:out value="${product.description}"/></td>
    </tr>
    <tr>
      <td>Hãng sản xuất:</td>
      <td><c:out value="${product.manufacturer}"/></td>
    </tr>
  </table>
</fieldset>
<button type="button"><a href="/menu.jsp">Quay trở lại menu</a></button>
</body>
</html>
