@RestResource(urlMapping = '/sensorEvent')
global with sharing class SensorRestService {
    
    @HttpPut
    global static void upsertSensorEvents() {
        SensorData sensorData = (SensorData) JSON.deserialize(RestContext.request.requestBody.toString(), SensorData.class);

        SensorService service = new SensorService();
        service.insertSensorEventsData(sensorData);
    }

}
