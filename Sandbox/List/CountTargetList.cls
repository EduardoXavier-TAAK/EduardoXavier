/*
Given a list of Integers nums and an Integer target,
 count number of times target is found in nums. 
 If the target is not in the list, simply return 0.
*/

public Integer findTargetCount(List<Integer> nums, Integer target) {
    Integer total = 0;

    for(Integer i: nums){
        if(i == target){ total++; }
    }

    if(total == 0){ return 0; }
    
    return total;
}