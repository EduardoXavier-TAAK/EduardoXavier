/*
Given a string str and an Integer k, return the size of the largest substring of str consisting of k 
distinct characters.

Example 1
input: str = 'araaaci' k = 2
output: 4; largest substring with 2 distinct characters = 'araa';
Example 2
input: str = 'string', k = 10
output: 6, there are fewer than 10 distinct characters
Example 3
input: str = 'araaci', k = 1
output: 2, longest substring with 1 distinct character is aa
*/

public static Integer longestDistinctSubstring(String str, Integer k){ 
    Map<String, Integer> substrings = new Map<String, Integer>();
    Integer maior = 0;
    Integer inicio = 0;

    for(Integer i = 0; i < str.length(); i++){
        String c = str.substring(i, i+1);
        substrings.put(c, substrings.containsKey(c) ? substrings.get(c) + 1 : 1);

        while(substrings.size() > k){
            String saiu = str.substring(inicio, inicio + 1);
            Integer n = substrings.get(saiu) - 1;
            if(n == 0){ substrings.remove(saiu); } else { substrings.put(saiu, n); }
            inicio++;
        }

        maior = Math.max(maior, i - inicio + 1);
    }

    return maior;

}