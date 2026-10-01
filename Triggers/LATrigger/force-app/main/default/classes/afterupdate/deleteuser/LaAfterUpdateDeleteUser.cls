public with sharing class LaAfterUpdateDeleteUser {
    private AfterUpdateService service;

    public LaAfterUpdateDeleteUser() {}

    public void afterUpdate(List<AssociatedLocation> triggernew, List<AssociatedLocation> triggerold){
        
        List<AssociatedLocation> oldUsers = new List<AssociatedLocation>();
        
        for(Integer i = 0; i < triggernew.size(); i++){
            try{
                oldUsers.add(service.fieldChange(triggernew[i], triggerold[i], 'Account'));

                Account acc = [SELECT Id, Representative__c FROM Account WHERE Id = :triggernew[i].ParentRecordId LIMIT 1].get(0);

                acc.Representative__c = triggernew[i].User__c;

                update acc;

            } catch(IllegalArgumentException e){
                System.debug('Campo não foi alterado');
                continue;
            }
        }
        
        for(AssociatedLocation i : oldUsers){
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