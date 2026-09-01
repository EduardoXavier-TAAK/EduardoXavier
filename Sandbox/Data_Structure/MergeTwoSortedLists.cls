/*

A classic computer science problem is to merge to sorted lists.
 In this problem you must write a method that accepts two sorted lists of integers: 
list1, and list2 and returns a list sorted in ascending order containing all the values in list1 and lis2.

*/

public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2){
    List<Integer> list3 = new List<Integer>();
    list3.addAll(list1);
    list3.addAll(list2);

    list3.sort();
    return list3; 
}