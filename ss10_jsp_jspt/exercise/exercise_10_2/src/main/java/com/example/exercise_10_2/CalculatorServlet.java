package com.example.exercise_10_2;

import com.sun.org.apache.bcel.internal.generic.ATHROW;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "calculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    Double firstNumber;
    Double secondNumber;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
        secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
        String operator = request.getParameter("operator");
        Calculator calculator = new Calculator();
        String result = "";
        if(calculator.calculator(secondNumber,operator)!=null){
            result = "Error division by 0!";
        } else {
            switch (operator){
                case "Addition":
                    result= firstNumber + " + " + secondNumber +" = "+ (firstNumber+secondNumber);
                    break;
                case "Subtraction":
                    result= firstNumber + " - " + secondNumber +" = "+ (firstNumber-secondNumber);
                    break;
                case "Multiplication":
                    result= firstNumber + " * " + secondNumber +" = "+ (firstNumber*secondNumber);
                    break;
                case "Division":
                        result= firstNumber + " / " + secondNumber +" = "+ (firstNumber/secondNumber);
                        break;
            }
        }

        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-result.jsp");
        requestDispatcher.forward(request,response);
    }
}