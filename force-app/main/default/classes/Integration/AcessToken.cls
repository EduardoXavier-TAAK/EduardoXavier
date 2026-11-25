public with sharing class AcessToken {

    public static String getAcessToken(Integer changer){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        
        String endpoint = '';
        String clientId = '';
        String clientSecret = '';

        if(changer == 1){
            endpoint = 'https://resilient-badger-nr022u-dev-ed.trailblaze.my.salesforce.com/services/oauth2/token';
            clientId = '3MVG9XgkMlifdwVBT11EF6sisWKmBKrUTrhLAxLTSc6VU_9veE1kn_JrstHHwz6z_E0iA.21V5hB2cXeUZi6Y';
            clientSecret = '';

        } else if(changer == 2){
            endpoint = 'https://orgfarm-5a3394e2fe-dev-ed.develop.my.salesforce-setup.com//services/oauth2/token';
            clientId = '3MVG94bpcMC_ekBjd9AuP7PMWsREA6cx4GwslApaA03ros0dimNofqW49T9lAh1tF0ZGNBQXrTLIYDKVnHSM1';
            clientSecret = '';
        }

        request.setEndpoint(endpoint);

        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        String body = 'grant_type=client_credentials' +
              '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8') +
              '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8');

        request.setBody(body);

        HttpResponse response = http.send(request);

        Map<String, Object> resultados = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

        return (String) resultados.get('access_token');
    }
}