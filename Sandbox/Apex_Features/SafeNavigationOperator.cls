/*
Implement the method getAccountBillingCityWithSafeNavigation, 
which accepts a list of accounts as an input and returns the BillingCity
 in upper case of the first account in the list.
 Use the Safe Navigation (?.) to ensure null is returned in case the BillingCity is null.

*/

public String getAccountBillingCityWithSafeNavigation(List<Account> accounts){
    return accounts.get(0).BillingCity?.toUpperCase();
}
