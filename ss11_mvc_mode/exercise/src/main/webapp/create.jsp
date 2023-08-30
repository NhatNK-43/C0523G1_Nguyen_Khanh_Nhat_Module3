<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 29/08/2023
  Time: 3:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
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
  <form action="/product?action=create" method="post">
    <fieldset>
      <legend>Nhập thông tin sản phẩm thêm mới</legend>
        <table>
          <tr>
            <td>Mã sản phẩm</td>
            <td><input id="id" name="id" placeholder="Mã sản phẩm"></td>
          </tr>
          <tr>
            <td>Tên sản phẩm</td>
            <td><input id="name" name="name" placeholder="Tên sản phẩm"></td>
          </tr>
          <tr>
            <td>Giá</td>
            <td><input id="price" name="price" placeholder="Giá"></td>
          </tr>
          <tr>
            <td>Mô tả</td>
            <td><input id="description" name="description" placeholder="Mô tả"></td>
          </tr>
          <tr>
            <td>Hãng sản xuất</td>
            <td><input id="manufacturer" name="manufacturer" placeholder="Hãng sản xuất"></td>
          </tr>
        </table>
      <button type="submit">Thêm mới</button>
    </fieldset>
  </form>
</body>
</html>
