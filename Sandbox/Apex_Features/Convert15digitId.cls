
/*
Implement the method convert15to18DigitId() , which accepts a String of 
length 15 digit and returns a new String with 18 digit salesforce Id. 
If the input string length is not equal to 15 digits, then return '-1'.
*/

public String convert15to18DigitId(String fifteenDigit)
{
    if(fifteenDigit != null){
        if(fifteenDigit.length() != 15){ return '-1'; }

        Id newId = Id.valueOf(fifteenDigit);

        return String.valueOf(newId);

    }

    return null;
}