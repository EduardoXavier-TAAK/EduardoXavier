System.debug([SELECT Name FROM PriceBookEntry].size());

Product2 product = new Product2(
    Name = 'Eduardo',
    IsActive = true,
    CurrencyIsoCode = 'BRL'
);

insert product;

System.debug([SELECT Id FROM PriceBookEntry].size());

