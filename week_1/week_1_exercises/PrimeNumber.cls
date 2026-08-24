/*
A prime number is a number greater than 1 that is not evenly divisible 
by any number greater than one and smaller than itself. 
For example, 13 is a prime number because it is not evenly divisible by any number between 1 and 13.
Implement the function isPrime that takes as input an integer greater than 1, r
eturns true if the integer is a prime number, and returns false otherwise. 
Assume that the input will always be greater than 1.
*/

public Boolean isPrime(Integer num) {

    for(Integer i = 1; i <= num; i++){

        if(Math.mod(num, i) == 0){
            if(i != num && i != 1){ return false; }
        }
        
    }

    return true;
}