package controller;

import service.SolveQuadraticEquations;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/solve-quadratic-equations")
public class HelloServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Double numberA = Double.parseDouble(request.getParameter("numberA"));
        Double numberB = Double.parseDouble(request.getParameter("numberB"));
        Double numberC = Double.parseDouble(request.getParameter("numberC"));
        SolveQuadraticEquations solveQuadraticEquations = new SolveQuadraticEquations();
        String result = solveQuadraticEquations.calculator(numberA,numberB,numberC);
        request.setAttribute("numberA",numberA);
        request.setAttribute("numberB",numberB);
        request.setAttribute("numberC",numberC);
        request.setAttribute("result",result);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
//        response.sendRedirect("/solve-quadratic-equations");
    }

}