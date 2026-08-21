package week_1_exercises;
/* 
Given three Integers a, b, and c, return true if they are in ascending order. For our purposes, two equal numbers will be considered to be in an ascending order.
ascendingOrder(10, 10, 15) = true
ascendingOrder(15, 14, 13) = false
*/

public class AscendingOrder {
    public Boolean ascendingOrder(Integer a, Integer b, Integer c) {
        if(a <= b && b <= c){return true;}

        return false;
    }   
}
