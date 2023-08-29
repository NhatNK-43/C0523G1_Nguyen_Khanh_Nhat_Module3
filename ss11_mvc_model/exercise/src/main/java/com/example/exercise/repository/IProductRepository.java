package com.example.exercise.repository;

import com.example.exercise.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showList();
    void add(Product product);
    int findById(int id);

    void update(int id, Product product);
}
