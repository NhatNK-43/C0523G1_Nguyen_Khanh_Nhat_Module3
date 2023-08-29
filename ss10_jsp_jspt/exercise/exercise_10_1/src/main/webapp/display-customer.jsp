<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Customers</title>
  <style>
    table{
      border: 2px solid lightblue;
      box-shadow: 10px 10px 5px lightblue;
    }
    img{
      width: 50px;
      height: 50px;
      background-size: cover;
    }
    tr, th, td{
      border-bottom: 2px solid gray;
    }
  </style>
</head>
<body>
<table>
  <caption style="font-size: 20px; font-weight: bold">Danh sách khách hàng</caption>
  <thead>
  <tr>
    <th style="width: 200px">Tên</th>
    <th style="width: 100px">Ngày sinh</th>
    <th style="width: 100px">Địa chỉ</th>
    <th style="width: 100px">Ảnh</th>
  </tr>
  </thead>
  <tbody>
    <c:forEach var="customer" items="${customerList}">
      <tr>
        <td><c:out value="${customer.name}"/></td>
        <td><c:out value="${customer.dateOfBirth}"/></td>
        <td><c:out value="${customer.address}"/></td>
        <td style="text-align: center"><img src="${customer.image}" alt="..."></td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</body>
</html>