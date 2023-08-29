package com.example.exercise_10_2.service;

public class Calculator {
    public String calculator(Double firstNumber,Double secondNumber, String operator){
        String result = "";
        if(operator.equals("Division") && secondNumber==0){
            result = "Error division by 0!";
        }else {
            switch (operator){
                case "Addition":
                    result= firstNumber + " + " + secondNumber +" = "+ (firstNumber+secondNumber);
                    break;
                case "Subtraction":
                    result= firstNumber + " - " + secondNumber +" = "+ (firstNumber-secondNumber);
                    break;
                case "Multiplication":
                    result= firstNumber + " * " + secondNumber +" = "+ (firstNumber*secondNumber);
                    break;
                case "Division":
                    result= firstNumber + " / " + secondNumber +" = "+ (firstNumber/secondNumber);
                    break;
            }
        }
        return result;
    }
}
