public with sharing class SoapRestClient {
    
    //SoapRestClient.makeRestRequest();

    public static String ACCOUNT_ID = '0012w00000MAglGAAT';
    public static String SENSOR_ID = '200';

    @future(callout=true)
    public static void makeRestRequest() {
        Integer[] line = new Integer[]{};
        for(Integer i = 1; i <= 6; i++ ){
            line.add(i);
        }
        
        SensorData data = new SensorData(ACCOUNT_ID, SENSOR_ID, line);

        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(AccessSensorCenter.SERVER_BASE_URL + '/services/apexrest/sensorEvent');  
        request.setMethod('PUT');    
        request.setHeader('Authorization', 'Bearer ' + AccessSensorCenter.getToken());
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(data));        
        HttpResponse responce = http.send(request);
        System.debug('Body ' + responce.getBody());
        System.debug('Status ' + responce.getStatus());
        System.debug('Status code ' + responce.getStatusCode());
        
    }
}
