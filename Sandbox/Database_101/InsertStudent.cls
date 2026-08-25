/*
he method insertStudent takes as input strings name and email, and returns a record ID. Implement the method to insert 
an apxio__Student__c record with the Name and apxio__Email__c fields filled out, 
and return the Id of the new record.
*/

public Id insertStudent(String name, String email) {
    apxio__Student__c std = new apxio__Student__c();

    std.Name = name;
    std.apxio__Email__c = email;
    Insert std;

    return std.Id;
}