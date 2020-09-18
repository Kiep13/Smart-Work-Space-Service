public with sharing class SensorData {

    public String accountId;
    public String sensorId;
    public Integer[] line;

    public SensorData(String accountId, String sensorId, Integer[] line) {
        this.accountId = accountId;
        this.sensorId = sensorId;
        this.line = line;
    }
}
