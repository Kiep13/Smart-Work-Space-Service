/**
 * Mock class for testing SensorRestClient class
 */
@IsTest
global with sharing class SensorRestClientMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        return response; 
    }
}
