/*
A prime number is a number greater than 1 that is not evenly divisible by any number greater 
than one and smaller than itself.
 For example, 13 is a prime number because it is not evenly divisible by any number from 2 to 12.
*/

public Integer nextPrime(Integer num) {
    boolean isPrime = true;

if(num < 0){ num = 1; }

    for(integer i = num+1; i > num; i++){
        isPrime = true;

        for(Integer j = 2; j < num; j++){
            if(Math.mod(i, j) == 0){ isPrime = false; }
        }

        if(isPrime == true) { return i; }
    }

    return -1;
}