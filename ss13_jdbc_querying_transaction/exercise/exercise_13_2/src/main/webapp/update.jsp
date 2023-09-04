<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 31/08/2023
  Time: 10:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update user</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            margin: 0 50px;
        }

        h1 {
            padding: 20px;
        }

        table{
            border: 1px solid gray;
        }

        tr, th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
<h5 class="text-primary fw-semibold">Update user id: ${user.id}</h5>
<form action="/user?action=update" method="post">
    <input type="hidden" id="idUpdate" name="idUpdate" value="${user.id}">
    <table>
        <tbody>
        <tr>
            <td><label for="name">Name</label></td>
            <td><input type="text" id="name" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <td><label for="email">Email</label></td>
            <td><input type="text" id="email" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <td><label for="country">Country</label></td>
            <td><input type="text" id="country" name="country" value="${user.country}"></td>
        </tr>
        <tr>
            <td><a class="btn btn-outline-secondary btn-sm" role="button" href="/user">Cancel</a></td>
            <td>
                <button type="submit" class="btn btn-outline-primary btn-sm">Save changes</button>
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
