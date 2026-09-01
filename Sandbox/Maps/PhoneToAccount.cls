

public Map<String, Account> phoneToAccount(List<Account> accounts) {
    Map<String, Account> newMap = new Map<String, Account>();

    for(Account i: accounts){

        if(!String.isBlank(i.Phone)){
            newMap.put(i.Phone, i);
        }
    }

    return newMap;   
}