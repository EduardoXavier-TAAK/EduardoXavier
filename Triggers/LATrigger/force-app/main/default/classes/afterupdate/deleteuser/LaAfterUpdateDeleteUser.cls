public with sharing class LaAfterUpdateDeleteUser implements TriggerAction.AfterUpdate {
    private AfterUpdateService service = new AfterUpdateService();

    public LaAfterUpdateDeleteUser() {}

    public void afterUpdate(List<AssociatedLocation> triggernew, List<AssociatedLocation> triggerold){
        
        List<AssociatedLocation> oldUsers = new List<AssociatedLocation>();
        
        for(Integer i = 0; i < triggernew.size(); i++){
            try{
                AssociatedLocation oldAccount = service.fieldChange(triggernew[i], triggerold[i], 'Account');
                if(oldAccount != null){
                    oldUsers.add(oldAccount);

                    Account acc = [SELECT Id, Representative__c FROM Account WHERE Id = :triggernew[i].ParentRecordId LIMIT 1].get(0);
                    acc.Representative__c = triggernew[i].User__c;
                    update acc;
                }

            } catch(NullPointerException e){
                System.debug('Campo não foi alterado');
                continue;
            }
        }
        
        for(AssociatedLocation i : oldUsers){
            if(!service.moreThanOneLa(i, 'Account')){     


                AccountTeamMember atm = [SELECT Id FROM AccountTeamMember WHERE UserId = :i.User__c LIMIT 1].get(0);

                delete atm;

            }
        }
        
    }
}