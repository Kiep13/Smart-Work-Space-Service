public with sharing class AccessSensorCenter {
    
    public static String SERVER_BASE_URL = 'https://resilient-koala-ulbvbp-dev-ed.my.salesforce.com';

    private static String CONSUMER_KEY = '3MVG9n_HvETGhr3BLBsdZMtDcWRUcmgun97a1nxbQU6yp85sPtCzBLTtlzL_YCDD6_cwiLnnBOz4dtNMMnTj3';
    private static String CONSUMER_SECRET = 'EE6F606354BB8E5907F3EB97690BA2E9509BB23BA814C56310BBFD455E4EAEFB';
    private static String USERNAME = 'nina-smirnova-2000@resilient-koala-ulbvbp.com';
    private static String PASSWORD = '1bAwcNzd';

    private static String TOKEN_URL = 'https://login.salesforce.com/services/oauth2/token';

    public static String getToken() {
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setEndpoint(TOKEN_URL);

        String requestBody = 'grant_type=password&client_id='+ CONSUMER_KEY + 
                                '&client_secret=' + CONSUMER_SECRET + 
                                '&username='+ EncodingUtil.urlEncode(USERNAME, 'UTF-8') + 
                                '&password='+ PASSWORD;

        request.setBody(requestBody);

        Http http = new Http();
        HTTPResponse response = http.send(request);
        
        OAuth2 authInfo = (OAuth2) JSON.deserialize(response.getBody(), OAuth2.class);
        return authInfo.access_token;
    }
}
