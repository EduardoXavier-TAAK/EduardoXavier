public with sharing class ProductTriggerHandler extends TriggerHandler {
    private List<Product2> products;

    public ProductTriggerHandler(){
        this.products = (List<Product2>) Trigger.new;
    }
    
    public override void AfterInsert(){
        
        PriceBook2 standardPriceBook = [SELECT Id FROM PriceBook2 WHERE IsStandard = true LIMIT 1];
        
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        
        for(Product2 p : this.products){
            
            pbeList.add(this.createPricebookEntry(p, standardPriceBook, 'BRL'));
            
            pbeList.add(this.createPricebookEntry(p, standardPriceBook, 'USD'));
        }
        
        insert pbeList;
    }
    
    private PriceBookEntry createPricebookEntry(Product2 p, PriceBook2 standardPriceBook, String currencyIsoCode) {
        PricebookEntry pbe = new PricebookEntry();
        pbe.Product2Id = p.Id;
        pbe.Pricebook2Id = standardPriceBook.Id;
        pbe.UnitPrice = 0;
        pbe.IsActive = true;
        pbe.CurrencyIsoCode = currencyIsoCode;
        
        return pbe;
    }
    
}