/*
Implement the method getAccounts(), function, 
which accepts a list of accounts as input and returns a new list of accounts sorted in descending 
order based on the Annual Revenue field.
*/

public List<Account> getAccounts(List<Account> accounts) {
    AccountComparator comp = new AccountComparator();
    List<Account> sortedList = new List<Account>();

    if(accounts != null){ accounts.sort(comp); }

    return accounts;
}


public class AccountComparator implements Comparator<Account>{
    public Integer compare(Account c1, Account c2){
        Integer returnValue = 0;
        
        //coisa feia
        if(c1 == null && c2 == null){ returnValue = 0;  } else 
        if (c1 == null){ returnValue = 1; } else 
        if (c2 == null){ returnValue = -1; } else
        if (c1.AnnualRevenue == null && c2.AnnualRevenue == null){ returnValue = 0; } else
        if(c1.AnnualRevenue == null){ returnValue = 1; } else
        if(c2.AnnualRevenue == null){ returnValue = -1; } else
        if(c1.AnnualRevenue < c2.AnnualRevenue){ returnValue = 1; } else 
        if(c2.AnnualRevenue < c1.AnnualRevenue) {returnValue = -1; }

        return returnValue;


    }
}