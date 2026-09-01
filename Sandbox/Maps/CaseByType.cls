/*
The method casesByType takes as input a list of cases and returns a Map> with case types 
(Type field on Case) as the keys,
 and a list of cases of that type as values. This map should not include cases with no Type specified
*/

public Map<String, List<Case>> casesByType(List<Case> cases) {
    Map<String, List<Case>> newCases = new Map<String, List<Case>>();

    for(Case i : cases){

        if(!String.isBlank(i.Type)){
            List<Case> cs = new List<Case>(newCases.get(i.Type));
            cs.add(i);

            newCases.put(i.Type, cs);
        }
    }

    return newCases;
public class Stack {
    List<Object> ls = new List<Object>();
    
    public void push(Object obj) {
        if(ls.size() > 0){ ls.add(ls.size() - 1, obj); } else 

        { ls.add(obj); }
        
    }
    
    public Object pop() {
        if( ls.size() > 0 ){ return ls.remove(ls.size() - 1); } else

        { return ls.remove(0); }
    }
    
    public Integer size() {
        Integer total = 0;

        for(Object i: ls){ total++; }

        return total;
    }
    
    public Object peek(){
        if(ls.size() > 0){ return ls.get(ls.size() - 1); } else

        { return ls.get(0); }
        
    }
    
    public Boolean isEmpty() {
        if(Stack.size() > 0){ return false; }

        return true;
    }
}
}

