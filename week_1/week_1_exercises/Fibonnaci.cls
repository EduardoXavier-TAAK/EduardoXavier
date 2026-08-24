/*
The first two numbers in the fibonacci sequence are 1, and all other numbers in the sequence 
are defined as the sum of the last two fibonacci numbers. 
The first 10 numbers in the fibonacci sequence are 1, 1, 2, 3, 5, 8, 13, 21, 34, and 55.

*/

public Integer fibonacci(Integer n) {
    Integer [] fibo = new Integer[n];

    if(n > 1){
        fibo[0] = 1;
        fibo[1] = 1;

    } else { return 1; }

    for(Integer i = 2; i < n; i++){
        fibo[i] = fibo[i-1] + fibo[i-2];
    }

    return fibo[n-1];
}