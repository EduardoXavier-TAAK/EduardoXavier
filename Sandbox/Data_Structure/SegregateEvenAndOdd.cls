/*
Given a List of Integers (List<Integer>), 
write a function that segregates even and odd numbers. 
The function should put all even numbers first, and then odd numbers.
You are required to modify the list that is passed.
 Try doing so without creating any extra lists, which would mean an O(1) space complexity.

*/

public static void segregateEvenOdd(List<Integer> numbers){
    Integer count = 0;
    numbers.sort();
    if(numbers.size() >= 2){
        for(Integer i = 0; i < numbers.size(); i++){
            Integer n = numbers.get(i);

            if(Math.mod(n, 2) == 0){
                numbers.remove(i);
                numbers.add(count, n);
                count++;
            }
        }
    }

}