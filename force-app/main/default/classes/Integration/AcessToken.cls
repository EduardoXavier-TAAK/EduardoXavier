public with sharing class AcessToken {

    public static String getAcessToken(Integer changer){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        
        String endpoint = '';
        String clientId = '';
        String clientSecret = '';

        if(changer == 1){
            endpoint = '';
            clientId = '';
            clientSecret = '';

        } else if(changer == 2){
            endpoint = '';
            clientId = '';
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