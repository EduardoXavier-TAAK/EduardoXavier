/* 
Create a function that given a total bill, and an integer percentage value between 0 and 100,
 computes the tip at the specified percentage. You can assume the percentage specified will be an integer within the valid range.
For an example, computeTip(200.0, 50) evaluates to 100.0, because 50% of 200 is 100.
*/

public class ComputerTip(){
    public Decimal computeTip(Decimal total, Integer percent) {
    return total * percent/100;
}
}