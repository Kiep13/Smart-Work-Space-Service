/**
 * Class for serializing request bodies in SOAP and REST requests
 */
public with sharing class SensorData {
    public String accountId {get;set;}
    public String sensorId {get;set;}
    public Integer[] line {get;set;}

    public SensorData(String accountId, String sensorId, Integer[] line) {
        this.accountId = accountId;
        this.sensorId = sensorId;
        this.line = line;
    }
}
