public with sharing class IntegrationOutbound {
    
    @Future(callout=true)
    public static void orderOutbound(Id id){
        Boolean hasAnyErrors = false;
        String errorMessage = '';
        List<String> externalIdList = new List<String>();
        Order order = new Order();

        String payloadIn = '';
        String payloadOut = '';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        
        String URL = 'https://resilient-badger-nr022u-dev-ed.trailblaze.my.salesforce.com';
        String URI = '/services/apexrest/EduardoOliveira';
        
        try {
            order = [
            SELECT 
                    AccountId,
                    Account.ExternalId__c, 
                    Account_Address__c,
                    Account_Address__r.ExternalId__c,
                    Payment_Condition__c,
                    Payment_Condition__r.ExternalId__c,
                    Pricebook2Id,
                    Pricebook2.ExternalId__c,
                    Shipping_Type__c,
                    EffectiveDate,
                    Delivery_Date__c,
                    Description,
                    ExternalId__c,
                    Status
                FROM Order
                WHERE Id =: id].get(0);

                if (order.ExternalId__c != null) externalIdList.add(String.valueOf(order.ExternalId__c));
            
                request.setEndpoint(URL + URI);
                
                String token = AcessToken.getAcessToken(1);
                request.setHeader('Authorization', 'Bearer ' + token);
                
                request.setMethod('POST');
                request.setHeader('Content-Type', 'application/json');
                
                request.setBody(JSON.serialize(new Map<String, Object>{
                    'externalId' => 'PED-EXT-001',
                    'status' => 'Draft',
                    'observation' => order.Description,
                    'accountId' => order.Account.ExternalId__c,
                    'effectiveDate' => order.EffectiveDate,
                    'customerId' => order.Account.ExternalId__c,
                    'paymentConditionId' => order.Payment_Condition__r.ExternalId__c,
                    'shippingMethod' => order.Shipping_Type__c,
                    'addressId' => order.Account_Address__r.ExternalId__c,
                    'distributionCenterId' => '1',
                    'deliveryData' => order.Delivery_Date__c,
                    'freightType' => order.Shipping_Type__c,
                    'deliveryDate' => order.Delivery_Date__c
                }));
                
                response = http.send(request);
                
                System.debug(response.getBody());
        
                payloadIn = request.getBody();
                payloadOut = response.toString();

        } catch (Exception e) {
            hasAnyErrors = true;
            errorMessage = e.getMessage();
            System.debug('Erro ao enviar o pedido => ' + e.getMessage());
        }

        IntegrationLog.createLog(
        'Order',
        externalIdList,
        'OUT',
        response.getBody(),
        payloadIn,
        payloadOut,
        URI,
        response.getStatusCode(),
        hasAnyErrors,
        false,
        order.Id
    );

    }
    
}