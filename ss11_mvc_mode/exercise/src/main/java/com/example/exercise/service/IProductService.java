package com.example.exercise.service;

import com.example.exercise.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showList();
    void add(Product product);
    void update(int id, Product product);
    String delete(int id);
    Product productDetails(int id);
    List<Product> searchListByName(String searchName);
}
