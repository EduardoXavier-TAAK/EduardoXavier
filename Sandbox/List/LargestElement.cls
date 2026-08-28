/*
Implement the method findLargest that takes as input
 a non-empty list of Integers nums, and returns the largest Integer in the list.
*/

public static Integer findLargest(List<Integer> nums) {
	Integer maior = nums.get(0);

    for(Integer i: nums){
        if(i > maior){
            maior = i;
        }
    }

    return maior;
}