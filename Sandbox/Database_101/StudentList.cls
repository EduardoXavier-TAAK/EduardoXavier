/*
The method insertStudents takes as input two lists of strings studentNames and studentEmails. 
The two lists will always have the same size, with studentNames[i] and studentEmails[i] 
(for any in-range value of i) representing a student's name and email.
Write an implementation of the method that creates apxio__Student__c 
records for each entry in the lists with the Name and apxio__Email__c fields filled out.
You will be working with the following custom object and field names for this problem:
*/

public void insertStudents(List<String> studentNames, List<String> studentEmails) {
    List<apxio__Student__c> stds = new List<apxio__Student__c>();
    
    for(Integer i = 0; i < studentNames.size(); i++){
        apxio__Student__c newStd = new apxio__Student__c(
            Name = studentNames.get(i),
            apxio__Email__c = studentEmails.get(i)
            
        );

        stds.add(newStd);

    }

    Insert stds;
}