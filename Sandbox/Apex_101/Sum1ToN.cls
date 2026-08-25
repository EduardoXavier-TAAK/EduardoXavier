/*
Implement the method sumToN that calculates and returns the sum of all numbers (inclusive) from 1 to n. 
Assume that n will be non-zero positive integer.
*/

public Integer sumToN(Integer n) {
    Integer total = 0;
    
    for(Integer i = 1; i <= n; i++){
        total += i;
    }

    return total;
}