public with sharing class SensorSoapClient {

    // SensorSoapClient.makeSoapRequest();

    public static String ACCOUNT_ID = '0012w00000MAglGAAT';
    public static String SENSOR_ID = '200';

    @future(callout=true)
    public static void makeSoapRequest() {
        Integer[] line = new Integer[]{};
        for(Integer i = 1; i <= 6; i++ ){
            line.add(i);
        }
        
        SensorData data = new SensorData(ACCOUNT_ID, SENSOR_ID, line);

        soapSensorApp.SensorSoapService service = new soapSensorApp.SensorSoapService();
        service.SessionHeader = new soapSensorApp.SessionHeader_element();
        service.SessionHeader.sessionId = AccessSensorCenter.getToken();
        service.upsertData(JSON.serialize(data));
    }
}
