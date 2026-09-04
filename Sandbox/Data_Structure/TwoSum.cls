/*
You are given a list of unsorted integers and a target value. 
If the list contains two values that add up to target, 
return a list containing the indexes of the two numbers.
 You may not use a number more than once. Every input will have a solution.
Tests will include lists of up to 10,000 members. Only solutions that run in linear time will pass.

*/

public static List<Integer> twoSum(List<Integer> nums, Integer target) {

     List<Integer> indexes = new List<Integer>();
     List<Integer> duplicados = new List<Integer>();


     for(Integer i = 0; i < nums.size(); i++){
        Integer n2 = target - nums[i];
        Integer ind = nums.indexOf(n2);

        if((ind != -1 && ind != i) && (!duplicados.contains(n2) && !duplicados.contains(nums[i]))){

            indexes.add(i);
            indexes.add(nums.indexOf(n2));

            duplicados.add(nums[i]);
            duplicados.add(ind);

        }
     }


     return indexes;
}