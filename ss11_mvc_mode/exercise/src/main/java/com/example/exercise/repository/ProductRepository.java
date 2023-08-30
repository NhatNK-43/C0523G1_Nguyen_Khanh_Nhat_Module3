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
//        for (int i=0; i<productList.size();i++){
//            if (productList.get(i).getId()==id){
//                return i;
//            }
//        }
//        return -1;
    }
    @Override
    public void update(int id, Product product) {
        productList.set(findById(id),product);
    }

    @Override
    public void delete(int id) {
        productList.remove(findById(id));
    }

    @Override
    public Product productDetails(int id) {
        return productList.get(findById(id));
    }

    @Override
    public List<Product> searchListByName(String searchName) {
        List<Product> searchList = new ArrayList<>();
        for(Product product:productList){
            if(product.getName().toLowerCase().contains(searchName.toLowerCase())){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
