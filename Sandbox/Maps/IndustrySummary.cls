/*
The method industrySummary takes as input a list of accounts with Industry and AnnualRevenue fields populated.
 The method should sum up annual revenue by each industry 
and return a Map with each industry as a key, and sum of annual revenue for that industry as the value.
*/

public Map<String, Decimal> industrySummary(List<Account> accounts) {
    Map<String, Decimal> newMap = new Map<String, Decimal>();
    Decimal total = 0;

    for(Account i: accounts){ newMap.put(i.Industry, total); }

    for(Account i: accounts){
        if(i != null || i.Industry != null){
            total = newMap.get(i.Industry) + i.AnnualRevenue;
            newMap.put(i.Industry, total);

        }

        total = 0;
    }

    

    return newMap;
}