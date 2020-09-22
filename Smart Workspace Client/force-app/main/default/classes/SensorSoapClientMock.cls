@IsTest
global with sharing class SensorSoapClientMock implements WebServiceMock {
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        
        soapSensorApp.upsertDataResponse_element response_x = new soapSensorApp.upsertDataResponse_element();
        response.put('response_x', response_x); 
   }
}
