/*
Given a Contact with the Birthdate field set to some date, return true 
if today is the Contact's birthday and return false if not. 
Assume that a future date will not be set on the Birthdate field.
*/

public Boolean isBirthday(Contact c) {
    Integer hojeDia = Date.today().day();
    Integer hojeMes = Date.today().month();

    Date niverDoCara = Date.valueOf(c.Birthdate);

    Integer niverDia = niverDoCara.day();
    Integer niverMes = niverDoCara.month();

    if(hojeDia ==  niverDia && hojeMes == niverMes){ return true; } 

    return false;
}