/*
A positive integer is defined as an integer greater than zero. Implement the method positiveIntegers that takes 
as input a list of integers numbers, and returns a new list with non-positive integers removed.
*/


public List<Integer> positiveIntegers(List<Integer> numbers) {
    List<Integer> positives = new List<Integer>();

    for(Integer i: numbers){
        if(i > 0){
            positives.add(i);
        }
    }

    return positives;
}