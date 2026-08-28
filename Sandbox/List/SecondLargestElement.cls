/*
Given an list of Integers numbers, return the second 
largest integer in the list. Assume that the input list will always contain at least two distinct integers.
Example: secondLargest(new List {5, 2, 8, 4, 8, 1}) 
evaluates to 5 because 5 is the second largest Integer in the array, with 8 being the largest integer.
*/

public Integer secondLargest(List<Integer> numbers) {
    for(Integer i = 0; i < numbers.size(); i++){
        for(Integer j = i+1; j < numbers.size(); j++){

            if(numbers.get(i) == numbers.get(j)){ numbers.remove(j); j--;}

        }
    }

    numbers.sort();
    return numbers.get(numbers.size() -2);
}