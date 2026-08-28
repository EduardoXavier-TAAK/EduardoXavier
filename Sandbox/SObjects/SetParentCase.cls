/*
Implement the method linkParent that takes as input two cases c1 and c2,
 and sets the case created first as the parent of the case created later only if both cases look up to the same Contact.
 Ensure to handle the special case where the cases do not have any related contacts.
*/

public void linkParent(Case c1, Case c2) {
    DateTime data = c1.CreatedDate;
    DateTime data2 = c2.CreatedDate;

    if(c1 != null && c2 != null){

        if(c1.ContactId != null || c2.ContactId != null){

            if(c1.ContactId.equals(c2.ContactId)){

                if(data > data2){ c1.ParentId = c2.Id; } else
                if(data2 > data){ c2.ParentId = c1.Id; }

            } 
        }
        

    }

}