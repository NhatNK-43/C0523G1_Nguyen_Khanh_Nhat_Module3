<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 29/08/2023
  Time: 3:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
  <style>
    table, tr, th, td {
      border: 1px solid;
      border-collapse: collapse;
    }
    td,th{
      padding: 5px;
    }
    a{
      text-decoration: none;
      color: black;
    }
    b{
      color: blue;
    }
    thead{
      background: gainsboro;
    }
  </style>
</head>
<body>
  <table>
    <caption><b>Danh sách sản phẩm có tên sản phẩm là ${searchName}</b></caption>
    <thead>
      <tr>
        <th>Stt</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Hãng</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="product" items="${searchList}" varStatus="pCount">
        <tr>
          <td><c:out value="${pCount.count}"/></td>
          <td><c:out value="${product.name}"/></td>
          <td><c:out value="${product.price}"/></td>
          <td><c:out value="${product.description}"/></td>
          <td><c:out value="${product.manufacturer}"/></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  <button type="button"><a href="/menu.jsp">Quay trở lại menu</a></button>
</body>
</html>
