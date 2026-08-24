package week_1_exercises;
/* 
Given three Integers, return the largest
*/

public class LargestOfThree {
    public static Integer findLargest(Integer num1, Integer num2, Integer num3) {
        List<Integer> ints = new List<Integer>();


        ints.add(num1);
        ints.add(num2);
        ints.add(num3);

        Integer ref = num1;
        for(Integer i : ints){
            if(i > ref){
                ref = i;
            }
        }

        return ref;
    }  
}
