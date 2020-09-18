public with sharing class SensorRepository {
    public SensorRepository() {
    }

    public Sensor__c findSensorByIdAndAccount(String sensorId, String accountId) {
        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c WHERE Name =: sensorId
                                                                    AND Account__c =: accountId LIMIT 1];
        if(sensors.size() == 0) {
            return null;
        }
        return sensors[0];
    }

    public Sensor__c createSensor(String name, String accountId) {
        Sensor__c sensor = new Sensor__c(Name = name,
                                         Account__c = accountId);
        insert sensor;
        return sensor;
    }
}
