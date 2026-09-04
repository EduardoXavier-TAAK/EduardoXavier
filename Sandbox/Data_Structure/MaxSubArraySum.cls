/*
Given a list of Integers that can contain positive and negative 
values and an Integer target, calculate the maximum subarray of the length of the target.
*/

public static Integer maxSubArraySum(List<Integer> nums, Integer target){
    Integer maxSum = 0;
    Integer windowSum = 0;

    for(Integer i = 0; i < target; i++){
        windowSum += nums[i];
    }

    maxSum = windowSum;

    for(Integer i = target; i < nums.size(); i++){
        windowSum += nums[i] - nums[i - target];
        maxSum = Math.max(maxSum, windowSum);
    }

    return maxSum;
} 