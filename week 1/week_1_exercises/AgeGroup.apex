/*
Given a person's age, return their age group as a string: 'Infant' for ages 0-1, 'Child' for ages 2 - 14, 'Youth' for ages 15 - 21, and 'Adult' for ages 22+.
ageGroup(5) = 'Child'
ageGroup(15) = 'Youth'
*/

public class AgeGroup(){
    public String ageGroup(Integer n) {
    if(n <= 1){ return 'Infant';}
    if(n <= 14){ return 'Child';}
    if(n <= 21){ return 'Youth';}
    if(n >= 22){ return 'Adult';}

    return '';
}
}