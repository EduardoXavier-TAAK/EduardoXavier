public with sharing class LaBeforeInsertTrigger implements TriggerAction.BeforeInsert {
    public LaBeforeInsertTrigger() {}


    public void beforeInsert(List<AssociatedLocation> triggernew){
        
        for(AssociatedLocation i : triggernew){
            i.User__c = [SELECT Representative__c FROM Account WHERE Id = :i.ParentRecordId LIMIT 1].get(0).Representative__c;
        }
    }
}