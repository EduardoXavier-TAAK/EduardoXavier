/*
Given a list of integers sorted in ascending 
order return a list of integers that contains the square of each value in the input list sorted in ascending order.
*/

public static List<Integer> squareList(List<Integer> nums){
    List<Integer> squared = new List<Integer>();

    for(Integer i: nums){
        if(i < 0){ i *= -1; }

        squared.add(i * i);
    }

    squared.sort();
    return squared;
    
}