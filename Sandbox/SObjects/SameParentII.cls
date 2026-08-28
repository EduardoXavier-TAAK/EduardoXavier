/*
Implement the method sameParent that takes as input an account acc, a contact con, and an opportunity 
opp and returns true if both the opportunity and contact have the given account as the parent.
*/

public Boolean sameParent(Account acc, Contact con, Opportunity opp) {
    if(con.AccountId == null || opp.AccountId == null){ return false; }
    if(con.AccountId.equals(opp.AccountId) && con.AccountId.equals(acc.Id)){ return true; }

    return false;
} 