package com.example.exercise.service;

import com.example.exercise.model.Product;
import com.example.exercise.repository.IProductRepository;
import com.example.exercise.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> showList() {
        return productRepository.showList();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id,product);
    }

    @Override
    public String delete(int idDelete) {
        String location;
        if (productRepository.findById(idDelete)==-1){
            location = "/not-found-404.jsp";
        } else {
            productRepository.delete(idDelete);
            location = "/product";
        }
        return location;
    }

    @Override
    public Product productDetails(int idSearch) {
        if (productRepository.findById(idSearch)==-1){
            return null;
        } else {
            return productRepository.productDetails(idSearch);
        }
    }

    @Override
    public List<Product> searchListByName(String searchName) {
        return productRepository.searchListByName(searchName);
    }
}
