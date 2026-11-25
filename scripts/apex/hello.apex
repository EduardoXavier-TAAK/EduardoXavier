List<IntegrationLog__c> integ = [SELECT Id FROM IntegrationLog__c];

delete integ;