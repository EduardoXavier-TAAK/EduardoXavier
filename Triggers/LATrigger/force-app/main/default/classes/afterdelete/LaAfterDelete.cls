public with sharing class LaAfterDelete implements TriggerAction.AfterDelete {
    private AfterUpdateService service = new AfterUpdateService();
    
    public LaAfterDelete() { }
    
    public void afterDelete(List<AssociatedLocation> triggerold){
        
        for(AssociatedLocation i : triggerold){
            if(!service.moreThanOneLa(i, 'Account')){

                Account acc = [SELECT Id, Representative__c FROM Account WHERE Id = :i.ParentRecordId LIMIT 1].get(0);
                
                AccountTeamMember atm = [SELECT Id FROM AccountTeamMember WHERE UserId = :i.User__c LIMIT 1].get(0);
                
                acc.Representative__c = null;
                
                update acc;
                delete atm;

            }
        }
        
    }
}