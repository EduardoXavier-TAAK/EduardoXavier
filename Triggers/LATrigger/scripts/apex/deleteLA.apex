AssociatedLocation la = [SELECT Id, User__c, ParentRecordId FROM AssociatedLocation].get(0);

delete la;

System.debug('Lista de LAs da conta antiga');
for(AssociatedLocation i : [SELECT User__c, ParentRecordId, Id FROM AssociatedLocation WHERE ParentRecordId =: la.ParentRecordId]){
    System.debug('User: ' + i.User__c + ' - Id do LA: ' + i.Id);
}


System.debug('Usuario tem mais de um LA na conta antiga?');
try{
    AssociatedLocation la2 = [SELECT Id, User__c, ParentRecordId 
                              FROM AssociatedLocation 
                              WHERE User__c = :la.User__c AND ParentRecordId = :la.ParentRecordId].get(0);

    System.debug('Sim!');

    System.debug('Usuario foi excluido da conta?');

    Account acc = [SELECT Representative__c FROM Account WHERE Id =: la.ParentRecordId].get(0);

    if(acc.Representative__c == null){
        System.debug('Sim! vish');

        System.debug('Representante da conta: ' + acc.Representative__c);

    } else {
        System.debug('Não!');

        System.debug('Representante da conta: ' + acc.Representative__c);
    }
    
}catch(ListException e){
    System.debug('Não!');

    System.debug('Usuario foi excluido da conta?');

    Account acc = [SELECT Representative__c FROM Account WHERE Id =: la.ParentRecordId].get(0);

    if(acc.Representative__c == null){
        System.debug('Sim!');

        System.debug('Representante da conta: ' + acc.Representative__c);
        
    } else {
        System.debug('Não! vish');

        System.debug('Representante da conta: ' + acc.Representative__c);
    }
}


