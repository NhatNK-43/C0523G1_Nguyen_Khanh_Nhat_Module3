<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 5:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body{
            margin: 0 50px;
        }
        tbody tr:nth-child(odd){
            background: gainsboro;
        }
        table{
            border: 1px solid gainsboro;
            width: 100%;
        }
        th, td{
            width: 16.67%;
            height: 60px;
            padding-left: 10px;
            /*border-bottom: 1px solid gainsboro;*/
            border-collapse: collapse;
        }
        b{
            width: 50%;
            display: block;
            font-size: 20px;
            padding: 10px;
        }
        span{
            width: 50%;
            display: block;
            text-align: right;
            padding: 10px;
        }
    </style>
</head>
<body>
    <table>
        <div class="d-flex">
        <b>User list</b><span><a class="btn btn-primary" role="button" href="/user?action=showFormCreate">Add</a></span>
        </div>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}" varStatus="id">
                <tr>
                    <td><c:out value="${id.count}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td><button type="button" class="btn btn-outline-primary">Edit</button></td>
                    <td><button type="button" class="btn btn-outline-danger">Delete</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
