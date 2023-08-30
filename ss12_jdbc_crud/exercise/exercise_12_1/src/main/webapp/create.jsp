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
    <title>Title</title>
</head>
<body>
    <h1>Add user</h1>
    <form action="/user?action=create" method="post">
        <fieldset>
            <legend>Information add</legend>
            <table>
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
                    <td><button type="button"><a href="/user">Cancel</a></button></td>
                    <td><button type="submit">Add</button></td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
