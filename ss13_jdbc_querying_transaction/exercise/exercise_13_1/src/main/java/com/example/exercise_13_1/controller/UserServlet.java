package com.example.exercise_13_1.controller;

import com.example.exercise_13_1.model.User;
import com.example.exercise_13_1.service.IUserService;
import com.example.exercise_13_1.service.UserService;

import javax.servlet.http.HttpServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
            case "showFormUpdate":
                showFormUpdate(request,response);
                break;
            case "showListSort":
                showListSort(request,response);
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

    private void showListSort(HttpServletRequest request, HttpServletResponse response) {
        List<User> userListSort = userService.showListSort();
        request.setAttribute("userList",userListSort);
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
            case "update":
                update(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "searchByCountry":
                searchByCountryList(request,response);
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

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response){
        int idUpdate = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(idUpdate);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response){
        int idUpdate = Integer.parseInt(request.getParameter("idUpdate"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userService.update(idUpdate, new User(name,email,country));
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response){
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        userService.delete(idDelete);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchByCountryList(HttpServletRequest request, HttpServletResponse response) {
        String countrySearch = request.getParameter("countrySearch");
        List<User> searchByCountryList = userService.searchByCountryList(countrySearch);
        request.setAttribute("userList", searchByCountryList);
        request.setAttribute("countrySearch",countrySearch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user-list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
