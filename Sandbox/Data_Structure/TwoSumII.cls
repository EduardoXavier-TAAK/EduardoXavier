/*


*/

public List<Integer> twoSum(List<Integer> nums, Integer target){
    nums.sort();
    List<Integer> indexes = new List<Integer>();
    
    for(Integer i: nums){
        Integer diferenca = target - i;
        Integer diffIndex = nums.indexOf(diferenca);

        if(diffIndex != -1 && diffIndex != nums.indexOf(i)){
            indexes.add(nums.indexOf(i));
            indexes.add(diffIndex);
            return indexes;
        }
    }

     return indexes;
}