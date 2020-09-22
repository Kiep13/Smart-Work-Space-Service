/**
 * Mock class for testing AccessSensorCenter class
 */
@IsTest
global with sharing class AccessSensorCenterMock implements HttpCalloutMock{
    private static String ID = 'https://login.salesforce.com/id/00D2w00000CoSKVEA3/0052w000006rVnAAAU';
    private static String TEST_TOKEN = 'S9Zs8uEGGTVVtLggFTizCsMtwOJnRhjaQ2BMUQhcY';
    private static String ISSUED_AT = '1600694719489';
    private static String INSTANCE_URL = 'https://resilient-koala-ulbvbp-dev-ed.my.salesforce.com';
    private static String SIGNATURE = 'TEE9K4qOAbrTlHg2BfAkKnqlC9QNEH7xgmHXHSoafYI=';

    global HTTPResponse respond(HTTPRequest request) {
        OAuth2 oath2 = new OAuth2(Id, ISSUED_AT, INSTANCE_URL, SIGNATURE, TEST_TOKEN);

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(JSON.serialize(oath2));
        response.setStatusCode(200);
        return response;
    }
}
