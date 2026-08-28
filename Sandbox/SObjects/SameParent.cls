/*
Implement the method sameParent that takes as input an opportunity opp and a contact c, 
and returns true if both the opportunity and contact have the same parent account.
*/

public Boolean sameParent(Contact c, Opportunity opp) {
    if(c.AccountId == null || opp.AccountId == null){ return false; }
    if(c.AccountId.equals(opp.AccountId)){ return true; }

    return false;
}

