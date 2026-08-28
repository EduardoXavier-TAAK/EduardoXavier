/*
Given a list of decimals, 
return the average rounded to two decimal places.
*/

public Decimal average(List<Decimal> numbers){
    Decimal total = 0.00;

    for(Decimal i: numbers){ total+= i; }

    return (total/Decimal.valueOf(numbers.size())).setScale(2);
}