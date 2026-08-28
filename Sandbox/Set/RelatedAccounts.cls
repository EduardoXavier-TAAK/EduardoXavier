/*
Implement the method accountIds that
takes as input a list of Opportunity records, and returns a set containing IDs of related accounts.
*/

public Set<Id> accountIds(List<Opportunity> opps) {
    Set<Id> ls = new Set<Id>();

    for(Opportunity i: opps){
        if(i.AccountId != null){ ls.add(i.AccountId); }
        
    }

    return ls;
}