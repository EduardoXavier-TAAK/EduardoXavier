public with sharing class LaAfterUpdateInsertAtm implements TriggerAction.AfterUpdate {
    private AfterUpdateService service = new AfterUpdateService();
    
    public LaAfterUpdateInsertAtm() {}
    
    public void afterUpdate(List<AssociatedLocation> triggernew, List<AssociatedLocation> triggerold){
        
        List<AssociatedLocation> oldUsers = new List<AssociatedLocation>();
        
        for(Integer i = 0; i < triggernew.size(); i++){
            try{
                oldUsers.add(service.fieldChange(triggernew[i], triggerold[i], 'User'));
                
            } catch(NullPointerException e){
                System.debug('Campo não foi alterado');
                continue;
            }
        }
        
        for(AssociatedLocation i : oldUsers){
            if(!service.moreThanOneLa(i, 'User')){ 
                List<AccountTeamMember> atms = [SELECT Id
                                                FROM AccountTeamMember
                                                WHERE UserId = :i.User__c 
                                                AND AccountId = :i.ParentRecordId
                                                LIMIT 1];

                if(!atms.isEmpty()){
                    delete atms[0];
                }
            }
        }
        
    }
}