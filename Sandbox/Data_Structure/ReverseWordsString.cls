/*
Given a string that contains a sequence of words separated by spaces, 
write a method that reverses the order of the characters in each word.
You must maintain white space and the order of the words.

*/

public static String reverseWords(String str){
    String [] lsString = str.split(' ');


    for(Integer i = 0; i < lsString.size(); i++){
        str = str.replace(lsString[i], lsString[i].reverse());

    }

    return str;
}