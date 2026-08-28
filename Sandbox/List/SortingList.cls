/*
Implement the method getNamesInAscOrder(), 
which accepts a list of fullnames as input and returns the list sorted in ascending order. 
Use the standard library method to sort.
*/

public List<String> getNamesInAscOrder(List<String> accountNames)
{
    if(accountNames != null){
        accountNames.sort();
        return accountNames;
    }

    return null;
}
