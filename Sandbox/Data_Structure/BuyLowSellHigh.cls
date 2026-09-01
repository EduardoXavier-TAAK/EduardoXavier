/*
You are given a list of integers that represent the daily closing price of a stock. 
Write a program to maximize your profit by 
choosing the best day to buy and the best to sell. price.get(i) represents the stock price on a given day i.
*/

public Integer maxProfit(List<Integer> prices){
    List<Integer> lucros = new List<Integer>();
    Integer menor = 0;

    for(Integer i = 0; i < prices.size(); i++){
        for(Integer j = i + 1; j < prices.size(); j++){
            if(prices[i] < prices[j]){
                lucros.add(prices[j] - prices[i]);
            }
        }
    }

    if(lucros.size() > 0){
        for(Integer i: lucros){
            if(menor < i){
                menor = i;
            }
        }
        
    }

    return menor;
}
