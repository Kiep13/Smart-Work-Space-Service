/**
 * Class for making SOAP requests to server
 */
public with sharing class SensorSoapClient {

    // SensorSoapClient.makeSoapRequest('200', '0012w00000MAglGAAT', new Integer[]{1,2,3,4,5,6});

    public static void makeSoapRequest(String sensorName, String accountId, Integer[] line) {
        SensorData data = new SensorData(accountId, sensorName, line);

        soapSensorApp.SensorSoapService service = new soapSensorApp.SensorSoapService();
        service.endpoint_x = 'callout:SensorSoapClient/services/Soap/class/SensorSoapService';
        service.SessionHeader = new soapSensorApp.SessionHeader_element();
        service.SessionHeader.sessionId = '{!$Credential.OAuthToken}';
        service.upsertData(JSON.serialize(data));
    }
}
