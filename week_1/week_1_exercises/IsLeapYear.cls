/*
A year is considered a leap year if it is evenly divisible by 4, 
with the exception of years that are also evenly divisible by 100. 
Years evenly divisible by 100 must also be evenly evenly divisible by 400 to by considered leap years. 
Implement a method isLeapYear that takes as input an Integer year and returns true if the year is a leap year, 
and false otherwise.
*/

public Boolean isLeapYear(Integer year) {

    if(Math.mod(year, 4) == 0 && Math.mod(year, 100) != 0){return true;}

    if(Math.mod(year, 4) == 0 && Math.mod(year, 100) == 0){
        if(Math.mod(year, 400) == 0){
            return true;
        }
        
        return false;
    }

        return false;
}
