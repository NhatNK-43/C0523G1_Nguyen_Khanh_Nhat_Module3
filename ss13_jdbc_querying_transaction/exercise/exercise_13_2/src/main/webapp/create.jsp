<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 9:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create user</title>
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
<h5 class="text-primary fw-semibold">Add user</h5>
<form action="/user?action=create" method="post">
        <table>
            <tbody>
            <tr>
                <td><label for="name">Name</label></td>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input type="text" id="email" name="email"></td>
            </tr>
            <tr>
                <td><label for="country">Country</label></td>
                <td><input type="text" id="country" name="country"></td>
            </tr>
            <tr>
                <th>Permission</th>
                <td>
                    <input type="checkbox" name="add" size="15"/> add |
                    <input type="checkbox" name="edit" size="15"/> edit |
                    <input type="checkbox" name="delete" size="15"/> delete |
                    <input type="checkbox" name="view" size="15"/> view
                </td>
            </tr>
            <tr>
                <td><a class="btn btn-outline-secondary btn-sm" role="button" href="/user">Cancel</a></td>
                <td>
                    <button type="submit" class="btn btn-outline-primary btn-sm">Add</button>
                </td>
            </tr>
            </tbody>
        </table>
</form>
</body>
</html>
