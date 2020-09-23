/**
 * Class for serializing sensor event object
 */
public with sharing class SensorEvent {
    private String SensorEnd {get;set;}
    private Integer xEnd {get;set;}
    private Integer yEnd {get;set;}
    private Integer zEnd {get;set;}

    public SensorEvent(String sensorId, Integer x, Integer y, Integer z) {
        this.SensorEnd = sensorId;
        this.xEnd = x;
        this.yEnd = y;
        this.zEnd = z;
    }
}
