/*
A String is a considered a valid palindrome
 if it reads the same forwards and backwards. 
 For the purpose of this problem, we consider 
 a String to be a valid palindrome if it reads the same forwards and backwards 
after after converting all characters to lowercase, and removing all characters that are not a number or a letter.
*/

public Boolean isPalindrome(String str){
    Pattern pattern = Pattern.compile('[,():?!. ]');

    Matcher matcher = pattern.matcher(str.toLowerCase());

    String compare = matcher.replaceAll('');

    Integer reverseIndex = compare.length();

    for(Integer i = 0; i < compare.length(); i++){
        reverseIndex--;

        if(!compare.charAt(i).equals(compare.charAt(reverseIndex))){
            return false;
        } 

    }

    return true;
    
}