/*
A union between two sets A and B is a set that 
contains all elements from A and B. 
For example, the unions of sets {1, 5, 10} and {1, 3, 5} is {1, 3, 5, 10}.
*/

public Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> set3 = new Set<Integer>();

    for(Integer i: set1){
        set3.add(i);
    }

    for(Integer i: set2){
        set3.add(i);
    }

    return set3;
}