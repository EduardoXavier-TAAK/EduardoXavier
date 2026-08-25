/*
Implement the method selectActiveStudents that returns a list of all apxio__Student__c 
records with apxio__Active__c field checked. Make sure the students have a value in the Id and Name fields.
*/


public List<apxio__Student__c> selectActiveStudents() {
    List<apxio__Student__c> allStd = [SELECT Id, Name, apxio__Active__c 
                                      FROM apxio__Student__c WHERE apxio__Active__c = :true];

    return allStd;
}