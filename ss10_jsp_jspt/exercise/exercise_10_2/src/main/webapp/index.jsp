<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<br/>
<form action="/calculator" method="post">
  <fieldset>
    <legend>Calculator</legend>
    <table>
      <tr>
        <td>First operand:</td>
        <td><input type="text" id="firstNumber" name="firstNumber"></td>
      </tr>
      <tr>
        <td>Operator:</td>
        <td>
          <select id="operator" name="operator">
            <option>Addition</option>
            <option>Subtraction</option>
            <option>Multiplication</option>
            <option>Division</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Second operand:</td>
        <td><input type="text" id="secondNumber" name="secondNumber"></td>
      </tr>
      <tr>
        <td></td>
        <td><button type="submit" id="submit" name="submit">Calculate</button></td>
      </tr>
    </table>
  </fieldset>
</form>

</body>
</html>