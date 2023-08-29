package com.example.exercise.service;

import com.example.exercise.model.Product;
import com.example.exercise.repository.IProductRepository;
import com.example.exercise.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> showList() {
        return productRepository.showList();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public int findById(int id) {
        return productRepository.showList().indexOf(new Product(id));
    }

    @Override
    public void update(int id, Product product) {
        if(findById(id)==-1){

        }
        productRepository.showList().set(findById(id),product);
    }
}
