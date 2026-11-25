@RestResource(urlMapping='/totvs/*')
global with sharing class IntegrationInbound {
    
    @HttpPost
    global static void orderInbound() {
        Boolean hasAnyErrors = false;
        String errorMessage = '';
        List<String> externalIdList = new List<String>();
        Order orderRecord = new Order();

        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        String payloadIN = request.requestBody.toString();
        String payloadOUT = response.responseBody.toString();
        
        try{
            orderRecord = (Order) JSON.deserialize(payloadIN, Order.class);
            
            if (orderRecord.ExternalId__c != null) externalIdList.add(String.valueOf(orderRecord.ExternalId__c));
            
            upsert orderRecord;

        } catch (Exception e) {
            hasAnyErrors = true;
            errorMessage = e.getMessage();
            System.debug('Erro ao processar o pedido => ' + e.getMessage());
        }

        IntegrationLog.createLog(
                'Order',
                externalIdList,
                'IN',
                payloadIN,
                payloadOUT,
                errorMessage,
                request.requestURI,
                response.statusCode,
                hasAnyErrors,
                false,
                orderRecord.Id
        );
        
    }

 /*   private static void insertDetails(String exAcc, String exAddress, String exPayment, String exPricebook){
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        String URL = 'https://resilient-badger-nr022u-dev-ed.trailblaze.my.salesforce.com';
        String URI = '/services/data/v68.0/composite';

        request.setEndpoint(URL + URI);
        
        String token = AcessToken.getAcessToken(2);
        request.setHeader('Authorization', 'Bearer ' + token);

        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        
        String payload = JSON.serialize(new Map<String, Object>{
            'allOrNone' => true,
            'compositeRequest' => new List<Object>{
                new Map<String, Object>{
                    'method' => 'GET',
                    'url' => URL + '/services/data/v68.0/sobjects/Account/ExternalId__c/' + exAcc,
                    'referenceId' => 'refAccount'
                },        
                new Map<String, Object>{
                    'method' => 'GET',
                    'url' => URL + '/services/data/v68.0/sobjects/Address__c/ExternalId__c/' + exAddress,
                    'referenceId' => 'refAddress'
                },
                new Map<String, Object>{
                    'method' => 'GET',
                    'url' => URL + '/services/data/v68.0/sobjects/Payment_Method__c/ExternalId__c/' + exPayment,
                    'referenceId' => 'refPayment'
                },
                new Map<String, Object>{
                    'method' => 'GET',
                    'url' => URL + '/services/data/v68.0/sobjects/Pricebook2/ExternalId__c/' + exPricebook,
                    'referenceId' => 'refPricebook'
                }
            }
        });

        request.setBody(payload);

        HttpResponse response = http.send(request);

        System.debug(response + response.getBody());
       
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> records = results.get('records');

        Account acc = (Account) records[0];
        Account_Address__c address = (Account_Address__c) records[1];
        Payment_Condition__c pay = (Payment_Condition__c) records[2];
        Pricebook2 price = (Pricebook2) records[3];

       insert acc;
       insert address;
       insert pay;
       insert price;

    } */
    
}