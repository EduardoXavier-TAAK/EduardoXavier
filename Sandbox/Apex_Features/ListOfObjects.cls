/*
Implement the method getListOfsObject(), 
which accepts two parameters, a list of accounts, and a 
list of contacts, as an input and returns a list of sObjects. If both lists are empty or null,
 return an empty list of sObject.
*/

public List<sObject> getListOfsObject(List<Account> accounts, List<Contact> contacts)
{
    List<sObject> lsFinal = new List<sObject>();

    

    if(accounts != null){for(Account i: accounts){ lsFinal.add(i); }}

    if(contacts != null){for(Contact i: contacts){ lsFinal.add(i); }}

    return lsFinal;
}