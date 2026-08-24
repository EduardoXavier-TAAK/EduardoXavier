package week_1_exercises;

/* 
Given a work, prepend it with the correct indefinite article ("a" or "an") followed by a space based on the following rule: words starting with a vowel (a, e, i, o, or u) are prepended with "an", while words starting with any other letter are prepended with "a".
aOrAn('apple') = 'an apple'
aOrAn('banana') = 'a banana'
*/

public class AorAn {
public String aOrAn(String word) {
    List<String> charr = new List<String>();

    charr.add('a')
    charr.add('e')
    charr.add('i')
    charr.add('o')
    charr.add('u')
    
    for(String i : charr){
        if(word.startsWith(i)) {
            return 'an ' + word;
        } else {
            return 'a ' + word;
        }

    }

}
}
