package service;

public class SolveQuadraticEquations {
    public String calculator(Double a, Double b, Double c){
        String result = "";
        if(a==0){
            if(b==0){
                if(c==0){
                    result = "Phương trình vô số nghiệm";
                } else {
                    result = "Phương trình vô nghiệm";
                }
            } else {
                result = "Phương trình có nghiệm x = " + (c/b);
            }
        } else {
            Double delta = Math.pow(b,2)-4*a*c;
            if(delta<0){
                result = "Phương trình vô nghiệm";
            } else if (delta ==0){
                result = "Phương trình có nghiệm x1 = x2 = " + (-b/(2*a));
            } else {
                result = "Phương trình có 2 nghiệm:<br>" + "x1 = " + ((-b+Math.sqrt(delta))/(2*a))+
                        "<br>x2 = " + ((-b-Math.sqrt(delta))/(2*a));
            }
        }
        return result;
    }
}
