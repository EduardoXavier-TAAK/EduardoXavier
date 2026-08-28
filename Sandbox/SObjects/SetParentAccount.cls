/*
Implement the method setParent that takes as input an account acc, a contact con,
 and an opportunity opp and sets the account is the parent for both the opportunity and contact. 
Make sure to not take any action if the provided account or its Id is null.
*/

public void setParent(Account acc, Contact con, Opportunity opp) {
    if(acc != null){
        if(!String.isBlank(acc.Id)){ 
            con.AccountId = acc.Id;
            opp.AccountId = acc.Id; 
        }
    }
}

