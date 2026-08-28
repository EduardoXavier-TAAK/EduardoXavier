/*
Implement the method 
arraySum that takes as input a non-empty list of Integers numbers, 
and returns the sum of all numbers in the list.
*/

public static Integer arraySum(List<Integer> numbers) {
    Integer total = 0;

    for(Integer i: numbers){ total+=i; }

    return total;
}