/*


*/

public class Stack {
    List<Object> ls = new List<Object>();
    
    public void push(Object obj) {
        ls.add(obj);
    }
    
    public Object pop() {
        if(ls.size() > 0){ return ls.remove(ls.size() - 1); }

        return null;
    }
    
    public Integer size() {
        return ls.size();
    }
    
    public Object peek(){
        return ls.get(ls.size() - 1);
    }
    
    public Boolean isEmpty() {
        if(ls.size() == 0){ return true; }

        return false;
    }
}