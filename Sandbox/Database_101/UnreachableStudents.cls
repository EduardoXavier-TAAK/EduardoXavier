
/*
Implement the method selectUnreachableStudents that queries for and returns a list of all 
active apxio__Student__c records that are unreachable because they are missing both an email and a phone number. 
Make sure to include the Id and Name fields in the result. The returned list should be sorted A-Z on Name.
*/

public List<apxio__Student__c> selectUnreachableStudents() {
List<apxio__Student__c> allStd = [SELECT Id, Name, apxio__Active__c 
                                      FROM apxio__Student__c 
                                      WHERE apxio__Active__c = :true 
                                      AND apxio__Email__c = :null
                                      AND apxio__Phone__c = :null
                                      ORDER BY NAME ASC
                                      ];
    
    return allStd;

}