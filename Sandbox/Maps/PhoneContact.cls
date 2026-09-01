/*

Implement the method phonebook that takes as input a list of Contacts, and returns a Map containing 
the full names as keys,
 and the contact's phone number as values. Do not include contacts without a phone number into the phonebook.
*/

public Map<String, String> phonebook(List<Contact> contacts) {
    Map<String, String> newMap = new Map<String, String>();

    for(Contact i: contacts){
        if(!String.isBlank(i.Phone)){
            newMap.put(i.Name, i.Phone);
        }

    }

    return newMap;  
}