package com.example.exercise_9_1.service;

public class DiscountService {
    public Double discountAmount(Double price, Double discountPercent) {
        return price * discountPercent * 0.01;
    }

    public Double discountPrice(Double price, Double discountPercent){
        return price - discountAmount(price,discountPercent);
    }
}
