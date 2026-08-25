package week_1_exercises;
/* 
Implement a function diff that calculates the absolute difference between two integers.
diff(5, 2) = 3
diff(2, 5) = 3
*/

public class NumberDiff {
    public Integer diff(Integer a, Integer b) {
    Integer result = a - b;

    if(result < 0){result = result * -1;}

    return result;
}
}
