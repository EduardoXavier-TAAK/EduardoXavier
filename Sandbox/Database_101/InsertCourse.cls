/*
The method insertCourse takes as input strings name and details, an integer credits, and returns a record ID. 
Implement the method to insert a apxio__Course__c record 
with the Name and apxio__Course_Details__c and apxio__Credits__c fields filled out, 
and return the Id of the new record.
*/


/

public Id insertCourse(String name, String details, Integer credits) {
    apxio__Course__c cs = new apxio__Course__c();

    if(credits >= 1 && credits <= 4){
        cs.Name = name;
        cs.apxio__Course_Details__c = details;
        cs.apxio__Credits__c = String.valueOf(credits);
        Insert cs;

        return cs.Id;
    }

    return null;
}
