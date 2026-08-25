/*
Given an Integer, return 'even' if the Integer is even, or 'odd' if the Integer is odd. Remember to use the Math.mod function.
evenOrOdd(15) = 'odd'
evenOrOdd(-64) = 'even'
*/

public class EvenOrOdd(){
        public String evenOrOdd(Integer num) {
        if(Math.mod(num, 2) == 0){return 'even';}

        return 'odd';
    }

}