/*
Implement the method containsDuplicates that takes as input a list of integers, returns true 
if the list has more than one occurence of the same number, and 
returns false if every element in the list is unique.
*/

public Boolean containsDuplicates(List<Integer> nums) {
    Set<Integer> st = new Set<Integer>();

    for(Integer i: nums){
        if(st.contains(i)){ return true; }

        st.add(i);
    }

    return false;
}

