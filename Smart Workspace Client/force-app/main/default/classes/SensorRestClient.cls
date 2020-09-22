/**
 * Class for making REST requests to server
 */
public with sharing class SensorRestClient {
    
    //SensorRestClient.makeRestRequest(AccessSensorCenter.getToken(), '200', '0012w00000MAglGAAT', new Integer[]{1,2,3,4,5,6});
    //{"sensorId":"200","line":[1,2,3,4,5,6],"accountId":"0012w00000MAglGAAT"}

    public static HttpResponse makeRestRequest(String token, String sensorName, String accountId, Integer[] line) {
        SensorData sensorData = new SensorData(accountId, sensorName, line);

        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(AccessSensorCenter.SERVER_BASE_URL + '/services/apexrest/sensorEvent');  
        request.setMethod('PUT');    
        request.setHeader('Authorization', 'Bearer ' + token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(sensorData));    

        HttpResponse responce = http.send(request);
        return responce;
    }
}
