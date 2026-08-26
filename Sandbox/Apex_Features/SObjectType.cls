/*
Implement the method isTypeAccount(), 
which accepts a sObject as input and returns a true if type of input is Account object else it should return as false.
*/

public Boolean isTypeAccount(sObject record)
{
    return record instanceof Account;
}