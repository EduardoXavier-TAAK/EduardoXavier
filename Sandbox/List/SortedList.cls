/*
A list is considered to be sorted ascending when no element in the 
list is smaller than the preceding element if one is present. Similarly, 
a list is considered sorted descending if no element in the list is larger than the preceding element if any.
*/

public boolean isSorted(List<Integer> numbers) {
    Integer ascendente = 0;
    Integer descendente = 0;

    if(numbers.size() == 0){ return true; }

    for(Integer i = 0; i < numbers.size()-1; i++){
            if(numbers.get(i) <= numbers.get(i+1)){ descendente++; }

            if(numbers.get(i) >= numbers.get(i+1)){ ascendente++; } 
        }


    if(descendente == numbers.size() -1){ return true; }

    if(ascendente == numbers.size() -1){ return true; }

    return false;
}