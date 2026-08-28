/*
    Find the last occurrence of 
    Integer target in a list of integers nums and return its index. If the target is not found, return -1
*/

public static Integer findLast(List<Integer> nums, Integer target) {
   Integer index = -1;

   Integer num = 0;

   for(Integer i = 0; i < nums.size(); i++){
       num = nums.get(i);
       if(num == target){ index = i; }
   }

   return index;
}