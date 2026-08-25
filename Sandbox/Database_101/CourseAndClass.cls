/*
The method createCourseAndClass takes as input string parameters courseName and description, and returns void. 
Provide an implementation of the method that first inserts a apxio__Course__c record with the provided name and 
description (if provided) copied into the Name and apxio__Course_Details__c fields, and then inserts a 
child apxio__Class__c record with the same name and description copied into the Name and apxio__Description__c fields
*/

public void createCourseAndClass(String name, String description) {
    apxio__Course__c cs = new apxio__Course__c(
        Name = name,
        apxio__Course_Details__c = description
    );

    Insert cs;
    
    apxio__Class__c cls = new apxio__Class__c(
        Name = cs.Name,
        apxio__Course__c = cs.Id,
        apxio__Description__c = description?.left(255)
    );

    Insert cls;
}