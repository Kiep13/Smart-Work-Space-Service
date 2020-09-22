public with sharing class SensorSoapClient {

    // SensorSoapClient.makeSoapRequest(AccessSensorCenter.getToken(), '200', '0012w00000MAglGAAT', new Integer[]{1,2,3,4,5,6});

    public static void makeSoapRequest(String token, String sensorName, String accountId, Integer[] line) {
        SensorData data = new SensorData(accountId, sensorName, line);

        soapSensorApp.SensorSoapService service = new soapSensorApp.SensorSoapService();
        service.SessionHeader = new soapSensorApp.SessionHeader_element();
        service.SessionHeader.sessionId = token;
        service.upsertData(JSON.serialize(data));

        System.debug(service.inputHttpHeaders_x);
        System.debug(service.outputHttpHeaders_x);
        System.debug(service.CallOptions);
        System.debug(service.DebuggingHeader);
        System.debug(service.DebuggingInfo);
    }
}
