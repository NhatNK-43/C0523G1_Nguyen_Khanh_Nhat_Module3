<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
</head>
<body>
  <form action="discount-servlet" method="post">
    <label for="decription">Product Description</label>
    <input type="text" id="decription" name="decription">
    <br>

    <label for="price">List Price</label>
    <input type="number" id="price" name="price" min="0">
    <br>

    <label for="discountPercent">Discount Percent</label>
    <input type="number" id="discountPercent" name="discountPercent" min="0">
    <br>

    <button type="button">Calculate Discount</button>
    <br>
<%--    <a href="display-discount.jsp" role="button">Calculate Discount</a>--%>
    Discount Amount: ${discountAmount}
    <br>
    Discount Price: ${discountPrice}
  </form>
</body>
</html>