/*
Finalmente usei o switch feliz dms :)

For this problem, we define minimum annual revenue thresholds an account must meet to be considered a key account. 
The annual revenue thresholds are defined by industry:
Banking: 600,000
Technology: 800,000
Retail: 2,000,000
All others: 500,000
*/

public Boolean isKeyAccount(Account a) {
    Switch on a.Industry {
        when 'Banking'{
            if(a.AnnualRevenue >= 600000){ return true; }
        }

        when 'Technology'{
            if(a.AnnualRevenue >= 800000) { return true; }
        }

        when 'Retail' {
            if(a.AnnualRevenue >= 2000000) { return true; }
        }

        when else {
            if(a.AnnualRevenue >= 500000) { return true; }
        }
    }

    return false;
}