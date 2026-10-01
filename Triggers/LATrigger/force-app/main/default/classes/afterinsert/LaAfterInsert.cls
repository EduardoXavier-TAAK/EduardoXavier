public with sharing class LaAfterInsert implements TriggerAction.AfterInsert {
    public LaAfterInsert() { }

    public void afterInsert(List<AssociatedLocation> triggernew){
        List<AccountTeamMember> resultAtm = new List<AccountTeamMember>();

        for(AssociatedLocation i : triggernew){
            List<AccountTeamMember> atms = [SELECT UserId FROM AccountTeamMember WHERE UserId = :i.User__c AND AccountId = :i.ParentRecordId LIMIT 1];

            if(atms.isEmpty()){
                AccountTeamMember atm = new AccountTeamMember(
                    UserId = i.User__c,
                    AccountId = i.ParentRecordId,
                    TeamMemberRole = 'Sales Rep'
                );

                resultAtm.add(atm);
            }

        }
        
        if(!resultAtm.isEmpty()){ insert resultAtm; }

        
    }
}