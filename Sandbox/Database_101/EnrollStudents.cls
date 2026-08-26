/*
Implement the method enrollStudents that takes as input a list of strings emails and a string className.
 The method should enroll all students with the provided emails into a class with the given name 
 by creating apxio__Class_Enrollment__c records.
*/

public void enrollStudents(List<String> emails, String className) {
    List<apxio__Class_Enrollment__c> clsEnroll = new List<apxio__Class_Enrollment__c>();

    List<apxio__Student__c> stds = [SELECT Id, apxio__Email__c FROM apxio__Student__c]; 
    apxio__Class__c cls = [SELECT Id FROM apxio__Class__c WHERE Name = :className];

    for(String i: emails){
        for(apxio__Student__c c: stds){
        
            if(c.apxio__Email__c.equals(i)){

                apxio__Class_Enrollment__c newEnroll = new apxio__Class_Enrollment__c(
                    apxio__Offered_Class__c = cls.Id, 
                    apxio__Student__c = c.Id
                );

                clsEnroll.add(newEnroll);
            }
        }
    }

    insert clsEnroll;
                                       
}