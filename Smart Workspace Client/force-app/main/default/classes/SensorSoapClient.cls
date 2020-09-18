public with sharing class SensorSoapClient {

    SensorSoapClient client = new SensorSoapClient();
    client.makeSoapRequest();

    public static String ACCOUNT_ID = '0012w00000MAglGAAT';
    public static String SENSOR_ID = '200';

    public static String CONSUMER_KEY = '3MVG9n_HvETGhr3BLBsdZMtDcWRUcmgun97a1nxbQU6yp85sPtCzBLTtlzL_YCDD6_cwiLnnBOz4dtNMMnTj3';
    public static String CONSUMER_SECRET = 'EE6F606354BB8E5907F3EB97690BA2E9509BB23BA814C56310BBFD455E4EAEFB';
    public static String USERNAME = 'nina-smirnova-2000@resilient-koala-ulbvbp.com';
    public static String PASSWORD = '1bAwcNzd';

    public static String REDIRECT_URI = 'https://brave-moose-gxypp-dev-ed.my.salesforce.com/services/authcallback/SensorSoapClient';

    public static String AUTH_URL = 'https://login.salesforce.com/services/oauth2/authorize';
    public static String TOKEN_URL = 'https://login.salesforce.com/services/oauth2/token';

    @future(callout=true)
    private static void makeSoapRequest(String sessionId) {
        Integer[] line = new Integer[]{};
        for(Integer i = 1; i <= 12; i++ ){
            line.add(i);
        }
        
        SensorData data = new SensorData(ACCOUNT_ID, SENSOR_ID, line);


        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setEndpoint(TOKEN_URL);

        req.setBody('grant_type=password' + '&client_id='+ CONSUMER_KEY + 
                    '&client_secret='+ CONSUMER_SECRET + '&username='+ EncodingUtil.urlEncode(USERNAME, 'UTF-8') + '&password='+ PASSWORD);

        Http http = new Http();
        HTTPResponse response = http.send(req);
        System.debug('Body ' + response.getBody());
        System.debug('Status ' + response.getStatus());
        System.debug('Status code ' + response.getStatusCode());

        OAuth2 authInfo = (OAuth2) JSON.deserialize(response.getBody(), OAuth2.class);
        System.debug(authInfo.access_token);

        soapSensorApp.SensorSoapService service = new soapSensorApp.SensorSoapService();
        service.SessionHeader = new soapSensorApp.SessionHeader_element();
        service.SessionHeader.sessionId = authInfo.access_token;
        service.upsertData(JSON.serialize(data));
    }
}
