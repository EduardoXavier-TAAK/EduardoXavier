/*
Given a List of Integers containing only binary numbers (0 and 1),
 return the maximum number of consecutive 1s appearing in the List.

*/

public Integer maxConsecutiveOnes(Integer[] numbers) {
    List<Integer> historico = new List<Integer>();
    
    Integer total = 0;
    Integer maior = 0;
    

    for(Integer i: numbers){
        if(i == 1){ total++; historico.add(total); }

        if(i == 0){ total = 0; }
    }

    for(Integer i: historico){
        if(i > maior){
            maior = i;
        }
    }

    return maior;
}