package com.example.exercise.repository;

import com.example.exercise.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{

    private static final List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Tivi S1",500,"49 inch","Samsung"));
        productList.add(new Product(2,"Tivi S2",700,"60 inch","Samsung"));
        productList.add(new Product(3,"Tivi LG",420,"51 inch","LG"));
        productList.add(new Product(4,"Laptop D1",650,"i5-13400H","Dell"));
    }
    @Override
    public List<Product> showList() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public int findById(int id) {
        return productList.indexOf(new Product(id));
    }
    @Override
    public void update(int id, Product product) {
        productList.set(findById(id),product);
    }

}
