<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/solve-quadratic-equations" method="post">
    <h3>Giải phương trình bậc hai: ax<sup>2</sup> + bx + c = 0</h3>
    <table>
        <tr>
            <td><label for="numberA">a: </label></td>
            <td><input type="number" name="numberA" id="numberA"></td>
        </tr>
        <tr>
            <td><label for="numberB">b: </label></td>
            <td><input type="number" name="numberB" id="numberB"></td>
        </tr>
        <tr>
            <td><label for="numberC">c: </label></td>
            <td><input type="number" name="numberC" id="numberC"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Giải phương trình</button>
            </td>
        </tr>
    </table>
</form>
<h4>Kết quả: </h4> ${result}
</body>
</html>