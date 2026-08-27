/*
Implement the method getFieldsValue, which accepts the following inputs:
An account acc
A list of strings fields, with each string in the list representing a valid field on the account object.
The method should return a list of values from the account record for fields listed in the list fields 
in the correct order
*/

public List<String> getFieldsValue(Account acc, List<String> fields)
{
    List<String> lista = new List<String>();

    for(String i: fields){
        lista.add(acc.get(i)?.toString());
    }

    return lista;
}