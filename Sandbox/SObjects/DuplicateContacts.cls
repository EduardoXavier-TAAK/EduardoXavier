/*
For this problem, we consider two Contacts as duplicates if they have the same phone number or the same email address.
Implement the method duplicateContacts that takes as input two Contact records c1 and c1, returns 
true if they are duplicates, and returns false otherwise.
*/

public Boolean duplicateContacts(Contact c1, Contact c2) {

    if(!String.isBlank(c1.Email) && !String.isBlank(c2.Email)){
        if(c1.Email.equals(c2.Email)){ return true; }
    }
    if(!String.isBlank(c1.Phone) && !String.isBlank(c2.Phone)){
        if(c1.Phone.equals(c2.Phone)){ return true; }

    }

    return false;
}