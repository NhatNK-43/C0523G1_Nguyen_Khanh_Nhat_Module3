<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
</head>
<body>
  <form action="/discount" method="post">
    <label for="description">Product Description</label>
    <input type="text" id="description" name="description">
    <br>

    <label for="price">List Price</label>
    <input type="number" id="price" name="price" min="0">
    <br>

    <label for="discountPercent">Discount Percent</label>
    <input type="number" id="discountPercent" name="discountPercent" min="0">
    <br>

    <button type="submit">Calculate Discount</button>
<%--    <a href="display-discount.jsp" role="button">Calculate Discount</a>--%>
  </form>
</body>
</html>