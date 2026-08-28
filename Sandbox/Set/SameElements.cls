/*
Implement the method sameElements that takes as input two lists of integers nums1 and nums2, and returns true 
if and only if every integer in one of the lists is also contained by the other list. 
This means that for sameElements to return true, 
there should be no integer in nums1 that is not present in nums2, and no integer in nums2 that is not present in nums1.

*/

public Boolean sameElements(List<Integer> nums1, List<Integer> nums2) {
    Set<Integer> st1 = new Set<Integer>(nums1);
    Set<Integer> st2 = new Set<Integer>(nums2);

    return st1.equals(st2);
}