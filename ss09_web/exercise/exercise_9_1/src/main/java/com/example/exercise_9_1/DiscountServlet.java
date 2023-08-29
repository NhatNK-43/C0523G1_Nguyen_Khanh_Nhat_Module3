package com.example.exercise_9_1;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "discountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Double price = Double.parseDouble(request.getParameter("price"));
        Double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

        DiscountService discountService = new DiscountService();
        Double discountAmount = discountService.discountAmount(price,discountPercent);
        Double discountPrice = discountService.discountPrice(price,discountPercent);

        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(request,response);
    }
}