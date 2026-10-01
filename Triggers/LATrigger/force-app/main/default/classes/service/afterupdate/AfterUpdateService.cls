public with sharing class AfterUpdateService {
    public AfterUpdateService() {}
    
    public AssociatedLocation fieldChange(AssociatedLocation newLa, AssociatedLocation old, String type){

        switch on type {
            when  'User' {
                if(newLa.User__c != old.User__c){
                    
                    AccountTeamMember atm = new AccountTeamMember(UserId = newLa.User__c,
                    AccountId = newLa.ParentRecordId,
                    TeamMemberRole = 'Sales Rep');
                    
                    insert atm;

                    return old;
                }

                return null;

            }
            when 'Account' {
                if(newLa.ParentRecordId != old.ParentRecordId){
                    AccountTeamMember atm = new AccountTeamMember(
                    UserId = newLa.User__c,
                    AccountId = newLa.ParentRecordId,
                    TeamMemberRole = 'Sales Rep');
                    
                    insert atm;

                    return old;
                }

                return null;

            }
            when else {
                throw new IllegalArgumentException('Tipo de campo inválido!');
            }
        }
        
    }


    
    public Boolean moreThanOneLa(AssociatedLocation ls, String type){
        switch on type {
            when 'Account' {
                List<AssociatedLocation> moreLa = [SELECT Id, ParentRecordId, User__c
                                                    FROM AssociatedLocation 
                                                    WHERE ParentRecordId = :ls.ParentRecordId 
                                                    AND  User__c = : ls.User__c];
                
                return isMoreThanOne(moreLa);
            }
            
            when 'User' {
                List<AssociatedLocation> moreLa = [SELECT Id, User__c
                                                    FROM AssociatedLocation 
                                                    WHERE User__c = :ls.User__c 
                                                    AND  Id != : ls.Id];
                return isMoreThanOne(moreLa);
            }
            
            when else {
                throw new IllegalArgumentException('Tipo de campo inválido easteregg Xavier');
            }
        }
    }
    

    
    private Boolean isMoreThanOne(List<AssociatedLocation> ls){
        if(ls.isEmpty()){ return false; }
        
        else { return true; }
        
    }
}