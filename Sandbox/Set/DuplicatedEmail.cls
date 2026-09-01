/*
The method ContactDeduplicator takes as input a list of contacts with their emails. 
The method should check for duplicate emails and return a list of Contacts with unique emails.
This method should:
Accept one parameter: a List of Contact Records.
Return a List that contains only the unique contacts from the original list, based on their Email field.
The deduplication must be case-insensitive (e.g., 'test@example.com' and 'Test@Example.com' are considered
 the same email).
If multiple contacts have the same email, only the first contact found in the original list should be kept.
Contacts with a null or blank email ('') should also be deduplicated. Only the first contact with a blank email 
should be kept


*/

public static List<Contact> ContactDeduplicator(List<Contact> contacts) {
   if(contacts == null || contacts.isEmpty()){
        return new List<Contact>();
    }

    Set<String> seenEmails = new Set<String>();
    List<Contact> result = new List<Contact>();
    Boolean blankEmailAdded = false;
    
    for(Contact c : contacts){
        String email = c.Email;
        if(String.isBlank(email)){
            if(!blankEmailAdded){
                result.add(c);
                blankEmailAdded = true;
            }
        } else {
            String normalisedEmail = email.trim().toLowerCase();
             if(!seenEmails.contains(normalisedEmail)){
                seenEmails.add(normalisedEmail);
                result.add(c);
            }
        }
    }
    return result;
}



