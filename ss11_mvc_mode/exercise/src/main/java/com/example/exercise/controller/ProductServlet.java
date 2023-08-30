package com.example.exercise.controller;

import com.example.exercise.model.Product;
import com.example.exercise.service.IProductService;
import com.example.exercise.service.ProductService;

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

@WebServlet(name = "productServlet", value = "/product")
public class ProductServlet extends HttpServlet {

    private IProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "display":
                showList(request, response);
                break;
            default:
                showMenu(request, response);
        }
    }

    private void showMenu(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/menu.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.showList();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showSearchList(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        List<Product> searchList = productService.searchListByName(searchName);
        request.setAttribute("searchList", searchList);
        request.setAttribute("searchName", searchName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-search.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "searchById":
                showProductDetails(request, response);
                break;
            case "searchByIdUpdate":
                showFormUpdate(request, response);
                break;
            case "displaySearch":
                showSearchList(request, response);
                break;
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(id, name, price, description, manufacturer);
        productService.add(product);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        String location = productService.delete(idDelete);
        try {
            response.sendRedirect(location);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showProductDetails(HttpServletRequest request, HttpServletResponse response) {
        int idSearch = Integer.parseInt(request.getParameter("idSearch"));
        Product product = productService.productDetails(idSearch);
        if (product == null) {
            try {
                response.sendRedirect("/not-found-404.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("product", product);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-details.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int idUpdate = Integer.parseInt(request.getParameter("idUpdate"));
        Product product = productService.productDetails(idUpdate);
        if (product == null) {
            try {
                response.sendRedirect("/not-found-404.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("product", product);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int idUpdate = Integer.parseInt(request.getParameter("idUpdate"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product productUpdate = new Product(name, price, description, manufacturer);
        productService.update(idUpdate, productUpdate);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}