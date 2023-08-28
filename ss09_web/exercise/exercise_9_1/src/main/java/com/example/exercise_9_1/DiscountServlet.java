package com.example.exercise_9_1;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "discountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Double price = Double.parseDouble(request.getParameter("price"));
        Double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        Double discountAmount = price * discountPercent * 0.01;
        Double discountPrice = price - discountAmount;
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }
}