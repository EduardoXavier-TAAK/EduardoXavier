/*
Implement a function reverseWordsInASentence that will take a 
String containing words separated by spaces as an argument, 
and return a string with the order of the words reversed.
*/

public String reverseWordsInASentence(String sentence){
    if(sentence != null){
        String [] reverse = sentence.split(' ');
        String finalString = '';


        for(Integer i = (reverse.size() - 1); i >= 0; i--){
            finalString += ' ' + reverse[i];
    } 

        return finalString.normalizeSpace();

    } 

        return null;
}