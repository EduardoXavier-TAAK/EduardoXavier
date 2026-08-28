/*
The first two numbers in the fibonacci sequence are 1, and all other numbers 
in the sequence are defined as the sum of the two preceding fibonacci numbers.
 The first 10 numbers in the fibonacci sequence are 1, 1, 2, 3, 5, 8, 13, 21, 34, and 55.
*/

public List<Integer> fibonacciSeries(Integer n) {
    List<Integer> fibo = new List<Integer>();

    if(n == 1){
        fibo.add(1);
        return fibo;

    } else if(n == 2) { 

        fibo.add(1);
        fibo.add(1);
        return fibo; 
    }

    fibo.add(1);
    fibo.add(1);

    for(Integer i = 2; i < n; i++){
        fibo.add(fibo.get(i-1) + fibo.get(i-2));
    }

    return fibo;

}