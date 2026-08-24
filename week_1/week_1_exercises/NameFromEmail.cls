/*
Implement a function nameFromEmail that takes as input a valid email address in the format firstname.lastname@example.com.
 The function should extract the first name and last name from this email address and return a capitalized 
 full name (i.e. FirstName LastName). 
 Assume that the input will always be a valid email address with both the first name and last name separated by 
 a period (.).

*/

public String nameFromEmail(String email) {
    String firstName = email.substringBefore('.').toLowerCase();
    String lastName = email.substringBetween('.', '@').toLowerCase();

    String result = firstName.capitalize() + ' ' + lastName.capitalize();

    return result;

}