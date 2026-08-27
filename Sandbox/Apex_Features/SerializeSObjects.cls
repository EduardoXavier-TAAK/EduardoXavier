/*
Implement the method getAccountsInJSONFormat(), 
a list of accounts and returns a list of accounts in string JSON format.
*/


public String getAccountsInJSONFormat(List<Account> accounts){
    return JSON.serialize(accounts);
}
