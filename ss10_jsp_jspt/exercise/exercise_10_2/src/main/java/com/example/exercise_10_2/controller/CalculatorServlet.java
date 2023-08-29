package com.example.exercise_10_2.controller;

import com.example.exercise_10_2.service.Calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "calculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Double firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
        Double secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
        String operator = request.getParameter("operator");

        Calculator calculator = new Calculator();
        String result = calculator.calculator(firstNumber,secondNumber,operator);
        request.setAttribute("result",result);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-result.jsp");
        requestDispatcher.forward(request,response);
    }
}