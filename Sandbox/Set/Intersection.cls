/*
An intersection between two sets A and B is a set that contains all elements present in both A and B. For example, the 
intersection of sets {1, 5, 10} and {1, 3, 5} is {1, 5}, since 1 and 5 are the only two elements present in both sets.
*/

public Set<Integer> setIntersection(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> set3 = new Set<Integer>();

    for(Integer i: set1){
        for(Integer j: set2){ if(i == j){ set3.add(j); } }
    }

    return set3;

    
