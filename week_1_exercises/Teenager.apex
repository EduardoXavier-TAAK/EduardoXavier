package week_1_exercises;
/* 
Given a person's age, return true if the person is a teenager (age 13 - 19).
isTeenager(5) = false
isTeenager(15) = true
*/

public class Teenager {
    public Boolean isTeenager(Integer age) {
        if(age >= 13 && age <= 19) {return true;}

        return false;
    }

}
