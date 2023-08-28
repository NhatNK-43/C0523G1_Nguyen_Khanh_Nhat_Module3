<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Customers</title>
</head>
<body>
<table>
  <caption style="font-size: 20px; font-weight: bold">Danh sách khách hàng</caption>
  <thead>
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  </thead>
  <tbody>
    <c:forEach var="customer" items="${customerList}">
      <tr>
        <td><c:out value="$customer.name"/></td>
        <td><c:out value="$customer.dateOfBirth"/></td>
        <td><c:out value="$customer.address"/></td>
        <td><img src="<c:out value='$customer.image'/>" alt="..."></td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</body>
</html>