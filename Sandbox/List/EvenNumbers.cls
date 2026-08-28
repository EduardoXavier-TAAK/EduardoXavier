/*
Given a non-zero positive integer n,
return a list of the first n non-zero positive even numbers, ordered ascending. 
*/

public List<Integer> evenNumbers(Integer n) {
    List<Integer> evens = new List<Integer>();

    for(Integer i = 1; i <= n+n; i++){

        if(Math.mod(i, 2) == 0){ evens.add(i); }

    }

    evens.sort();

    return evens;
}