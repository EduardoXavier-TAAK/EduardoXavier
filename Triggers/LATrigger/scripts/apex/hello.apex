User user = [SELECT Id, Name FROM User LIMIT 1];

Account acc = [SELECT Id, Name, Representative__c FROM Account LIMIT 1];

List<AccountTeamMember> atm = [SELECT Id, UserId, AccountId FROM AccountTeamMember];

List<SObject> loc = Database.query('SELECT Id, Name FROM Location LIMIT 1');

if(!atm.isEmpty()){
    System.debug('Account Team Members: ' + atm.size().toString() + ' - User ID: ' + atm.get(0).UserId + ' - Account ID: ' + atm.get(0).AccountId);
}


AssociatedLocation ass = new AssociatedLocation(
    ParentRecordId = acc.Id,
    User__c = user.Id,
    LocationId = loc.get(0).Id
);
    
insert ass;

System.debug('Account Representative: ' + acc.Representative__c);
System.debug('Associated User: ' + ass.User__c);
    
System.debug('Account Team Members: ' + atm.size().toString() + ' - User ID: ' + atm.get(0).UserId + ' - Account ID: ' + atm.get(0).AccountId);
