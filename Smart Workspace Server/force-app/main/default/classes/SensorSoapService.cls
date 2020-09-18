global with sharing class SensorSoapService {
    webservice static void upsertData(String data) {
        SensorData sensorData = (SensorData) JSON.deserialize(data, SensorData.class);

        SensorService service = new SensorService();
        service.insertSensorEventsData(sensorData);
    }
}
