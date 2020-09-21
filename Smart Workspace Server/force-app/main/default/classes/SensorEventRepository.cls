public with sharing class SensorEventRepository {
    
    public Sensor_Event__c buildSensorEvent(Id sensorId, Integer x, Integer y, Integer z) {
        Sensor_Event__c event = new Sensor_Event__c();
        event.x__c = x;
        event.y__c = y;
        event.z__c = z;
        event.Sensor__c = sensorId;
        return event;
    }

    public List<Sensor_Event__c> createSensorEvents(Id sensorId, Integer[] line) {
        Integer amount = solveCorrectAmount(line);
        List<Sensor_Event__c> events = new List<Sensor_Event__c>();
        for(Integer i = 0; i <= amount; i=i+3) {
            Integer x = line[i];
            Integer y = line[i + 1];
            Integer z = line[i + 2];
            Sensor_Event__c event = this.buildSensorEvent(sensorId, x, y, z);
            events.add(event);
        }
        insert events;
        return events;
    }

    private Integer solveCorrectAmount(Integer[] line) {
        if(Math.mod(line.size(), 3) == 0) {
            return line.size() - 3;
        } 
        return line.size()  - (Math.mod(line.size(), 3) + 3);
    }

    public List<Sensor_Event__c> makeEventChain(List<Sensor_Event__c> events){
        for(Integer i = 1; i < events.size(); i++) {
            events[i].Previous_Event__c = events[i - 1].Id;
        }
        upsert events;
        return events;
    }
}
