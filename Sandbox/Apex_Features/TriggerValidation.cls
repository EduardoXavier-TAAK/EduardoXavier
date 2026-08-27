/*
Implement the method validateInsert, which accepts a newly inserted list of 
opportunities as an input and adds errors to the opportunity fields as follows: 
if the opportunity record's StageName is 'Closed Won' and the Description is null or empty, 
add an error on the Description field of that record with the error message set to 
'Description should not be empty for Closed Won opportunity.'.
*/

public void validateInsert(List<Opportunity> opportunities){
    for(Opportunity i: opportunities){
        if(i.StageName.equals('Closed Won') && String.isBlank(i.Description)){
            i.Description.addError('Description should not be empty for Closed Won opportunity.');
        }
    }
}