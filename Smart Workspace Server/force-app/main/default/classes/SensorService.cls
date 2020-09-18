public with sharing class SensorService {
    public void insertSensorEventsData(SensorData sensorData) {
        SensorRepository sensorRepo = new SensorRepository();
        Sensor__c sensor = sensorRepo.findSensorByIdAndAccount(sensorData.sensorId,  sensorData.accountId);

        if(sensor == null) {
            sensor = sensorRepo.createSensor(sensorData.sensorId,  sensorData.accountId);
        }

        SensorEventRepository eventRepo = new SensorEventRepository();
        List<Sensor_Event__c> events = eventRepo.createSensorEvents(sensor.Id, sensorData.line);

        eventRepo.makeEventChain(events);
    }
}
