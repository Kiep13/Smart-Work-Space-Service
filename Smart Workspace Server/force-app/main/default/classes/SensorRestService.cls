/**
 * Class which allow Rest requsts fo org
 */
@RestResource(urlMapping = '/sensorEvent')
global with sharing class SensorRestService {
    
    @HttpPut
    global static void upsertData() {
        SensorData sensorData = (SensorData) JSON.deserialize(RestContext.request.requestBody.toString(), SensorData.class);

        SensorService service = new SensorService();
        service.insertSensorEventsData(sensorData);
    }
}
