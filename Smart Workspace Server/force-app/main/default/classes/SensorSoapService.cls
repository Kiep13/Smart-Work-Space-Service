/**
 * Class which allow Soap requsts fo org
 */
global with sharing class SensorSoapService {
    webservice static void upsertData(String data) {
        SensorData sensorData = (SensorData) JSON.deserialize(data, SensorData.class);

        SensorService service = new SensorService();
        service.insertSensorEventsData(sensorData);
    }
}
