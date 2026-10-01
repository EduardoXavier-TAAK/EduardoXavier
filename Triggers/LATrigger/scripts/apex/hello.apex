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

AssociatedLocation saved = [SELECT User__c 
                            FROM AssociatedLocation 
                            WHERE User__c =: acc.Representative__c 
                            AND ParentRecordId =: ass.ParentRecordId].get(0);

    
List<AccountTeamMember> atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember];
    
 
System.debug('Associated User after Insert: ' + saved.User__c + ' - Account Name: ' + acc.Name);

System.debug('Account Team Members: ' + atm.size().toString());

for(AccountTeamMember i: atm){
    System.debug('  Account Team Members Id: ' + i.UserId);
}

System.debug('Teste de Update: Usuario');

User user = [SELECT Id FROM User WHERE Username =: 'mariojunio@gmail.com' LIMIT 1].get(0);

saved.User__c = user.Id;

update saved;

System.debug('Usuario tem mais de um LA?: ');
try{
    AssociatedLocation oldUser = [SELECT User__c 
                                  FROM AssociatedLocation 
                                  WHERE User__c =: acc.Representative__c 
                                  AND ParentRecordId =: ass.ParentRecordId].get(0);
    
    atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember WHERE UserId =: oldUser.User__c];

    System.debug('Sim: ');
    System.debug('Ultimo ATM foi apagado? ');

    if(atm.isEmpty()){
        System.debug('Sim! vish');

    } else {
        System.debug('Não!');
        System.debug('Ultimo ATM: ' + Atm.get(0).UserId);

    }


    atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember WHERE UserId =: saved.User__c];
    System.debug('Novo ATM: ' + atm.get(0).UserId);

} catch(ListException e){
    System.debug(e.getMessage());

    System.debug('Não: ');

    atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember WHERE UserId =: user.Id];
    System.debug('Novo ATM: ' + atm.get(0).UserId);

    atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember WHERE UserId =: acc.Representative__c];
    System.debug('Ultimo ATM foi apagado? ');
    
    if(atm.isEmpty()){
        System.debug('Sim!');

    } else {
        System.debug('Não!');
        System.debug('Ultimo ATM: ' + Atm.get(0).UserId);

    }

    
}

System.debug('Teste de Update: Conta');
