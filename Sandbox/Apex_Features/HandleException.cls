/*
Implement the method divide which takes two integers a and b as input, divides a by b using the / operator, 
and returns the result. If any exception occurs, the method should return the exception message
*/

public String divide(Integer a, Integer b){
    try{
        return (a / b).toString();
    } catch (Exception e){
        return e.getMessage();
    }
}