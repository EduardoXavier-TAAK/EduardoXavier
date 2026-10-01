List<AssociatedLocation> temp = [SELECT Id FROM AssociatedLocation];


Account acc = [SELECT Id, Name, Representative__c FROM Account LIMIT 1];

Schema.Location loc = [SELECT Id, Name FROM Location LIMIT 1].get(0);

AssociatedLocation ass = new AssociatedLocation(
    ParentRecordId = acc.Id,
    LocationId = loc.Id
);


System.debug('Account Representative: ' + acc.Representative__c);
System.debug('Associated User Before Insert: ' + ass.User__c + ' - Account Id: ' + acc.Id);

insert ass;


System.debug('MUDOU O ID AUTOMATICAMENTE?????');

AssociatedLocation saved = [SELECT User__c, ParentRecordId 
                            FROM AssociatedLocation 
                            WHERE User__c =: acc.Representative__c 
                            AND ParentRecordId =: ass.ParentRecordId].get(0);

    
List<AccountTeamMember> atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember];
    
 
System.debug('Associated User after Insert: ' + saved.User__c + ' - Account Name: ' + acc.Name);

System.debug('Account Team Members: ' + atm.size().toString());

for(AccountTeamMember i: atm){
    System.debug('  Account Team Members Id: ' + i.UserId);
}


System.debug('--------------------------- Teste de Update: Conta ---------------------------');

Account acc2 = [SELECT Id, Name, Representative__c FROM Account WHERE Id != :acc.Id LIMIT 1].get(0);

String tempId = saved.ParentRecordId;

saved.ParentRecordId = acc2.Id;

update saved;

List<AssociatedLocation> all = [SELECT User__c, ParentRecordId, Id FROM AssociatedLocation];

System.debug('Id da conta: ' + tempId);

System.debug('Lista de todos LA:');

for(AssociatedLocation i : all){  System.debug('Id: ' + i.Id + ' - User Id' + i.User__c + ' - Account Id: ' + i.ParentRecordId); }

System.debug('Usuario tem mais de um LA na conta antiga?: ');
try{
    AssociatedLocation user = [SELECT User__c, ParentRecordId
                                  FROM AssociatedLocation 
                                  WHERE User__c =: saved.User__c 
                                  AND ParentRecordId =: ass.ParentRecordId].get(0);
    
    Account accVelha = [SELECT Id, Name, Representative__c FROM Account WHERE Id =: ass.ParentRecordId].get(0);

    System.debug('Sim!');

    System.debug('Foi apagado da ultima conta? ');

    if(accVelha.Representative__c == null){
        System.debug('Sim! vish');

    } else {
        System.debug('Não!');
        System.debug('Representante da conta: ' + accVelha.Representative__c);

    }


} catch(ListException e){
    System.debug(e.getMessage());

    System.debug('Não');

    Account accVelha = [SELECT Id, Name, Representative__c FROM Account WHERE Id =: ass.ParentRecordId].get(0);

    System.debug('Sim!');

    System.debug('Foi apagado da ultima conta? ');

    if(accVelha.Representative__c == null){
        System.debug('Sim!');

        System.debug('Representante da conta: ' + accVelha.Representative__c);

    } else {
        System.debug('Não! vish');
        System.debug('Representante da conta: ' + accVelha.Representative__c);

    }
    
}
