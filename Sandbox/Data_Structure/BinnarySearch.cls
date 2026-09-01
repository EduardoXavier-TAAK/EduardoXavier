/*
Given a list of opportunities sorted by the Amount field and an Integer target, 
implement a solution to search the list and return the index of the opportunity 
with an amount that is equal to the target.
In the list does not contain a matching value return negative 1.
*/

public static Integer search(List<Opportunity> opportunities, Integer target){
    Integer start = 0;
    Integer endLs = opportunities.size() - 1;

    while(start <= endLs){

        Integer mid = (endLs+start)/2;

        if(opportunities.get(mid).Amount == target){
            return mid;
        } else 

        if(opportunities.get(mid).Amount < target){
            start = mid + 1;
        } else

        if(opportunities.get(mid).Amount > target){
            endLs = mid - 1;
        }


    }

    return -1;

}