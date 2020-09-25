/**
 * Class for making REST requests to server
 * makeCustomRestRequest method make request to custom rest service
 * makeStandrardRestRquest method make request to standard rest service
 */
public with sharing class SensorRestClient {
    
    //SensorRestClient.makeCustomRestRequest('200', '0012w00000MAglGAAT', new Integer[]{1,2,3,4,5,6});
    //{"sensorId":"200","line":[1,2,3,4,5,6],"accountId":"0012w00000MAglGAAT"}
    //SensorRestClient.makeStandardRestRequest(new SensorEvent('a002w00000BJ0AAAA1', 1,2,3));

    public static HttpResponse makeCustomRestRequest(String sensorName, String accountId, Integer[] line) {
        SensorData sensorData = new SensorData(accountId, sensorName, line);

        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint('callout:SensorSoapClient/services/apexrest/sensorEvent');  
        request.setMethod('PUT');    
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(sensorData));    

        HttpResponse responce = http.send(request);
        return responce;
    }

    public static HttpResponse makeStandardRestRequest(SensorEvent event) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint('callout:SensorSoapClient/services/data/v49.0/sobjects/Sensor_Event__c');  
        request.setMethod('POST');    
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(event).replaceAll('End', '__c')); 

        HttpResponse responce = http.send(request);
        return responce;
    }
}
