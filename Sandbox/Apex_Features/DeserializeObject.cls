/*
Implement the method getAccountsFromJSONString, 
which takes a JSON string of a list of accounts as an input and returns a list of accounts. 
If the input string is empty or null, return null.
*/

public List<Account> getAccountsFromJSONString(String inputJSON){

    if(!String.isBlank(inputJSON)){
        return (List<Account>)JSON.deserialize(inputJSON, List<Account>.class);
    }
        return null;
}

