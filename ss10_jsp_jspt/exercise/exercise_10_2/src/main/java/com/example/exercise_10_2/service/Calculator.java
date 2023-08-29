package com.example.exercise_10_2;

public class Calculator {
    public Exception calculator(Double secondNumber, String operator){
        Exception exception = null;
        if(operator.equals("Division") && secondNumber==0){
            exception =  new ArithmeticException();
        }
        return exception;
    }
}
