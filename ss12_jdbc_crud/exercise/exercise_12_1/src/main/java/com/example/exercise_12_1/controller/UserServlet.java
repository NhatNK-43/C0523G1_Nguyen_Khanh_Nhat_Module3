package com.example.exercise_12_1.controller;

import com.example.exercise_12_1.model.User;
import com.example.exercise_12_1.service.IUserService;
import com.example.exercise_12_1.service.UserService;

import javax.servlet.http.HttpServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "userServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "showFormCreate":
                showFormCreate(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.showList();
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user-list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        String action = request.getParameter("action");

        if(action==null){
            action="";
        }
        switch (action){

            case "create":
                create(request,response);
                break;
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userService.save(new User(name,email,country));
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
