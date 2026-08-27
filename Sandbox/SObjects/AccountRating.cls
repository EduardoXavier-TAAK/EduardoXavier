/*
Implement a method setAccountRating that looks at an Account's AnnualRevenue, and sets the 
value of the Rating picklist field based on the following criteria:
Accounts with AnnualRevenue less than or equal to 100,000 get a rating of "Cold"
Accounts with AnnualRevenue less than or equal to 500,000 but greater than 100,000 get a rating of "Warm"
Accounts with AnnualRevenue greater than 500,000 get a rating of "Hot"
*/

public void setAccountRating(Account a) {
    if(a.AnnualRevenue <= 100000){ a.Rating = 'Cold'; } else
    if(a.AnnualRevenue <= 500000){ a.Rating = 'Warm'; } else
    if(a.AnnualRevenue > 500000){ a.Rating = 'Hot'; } 
    
}