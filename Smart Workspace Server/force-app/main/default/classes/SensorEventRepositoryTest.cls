@IsTest
public with sharing class SensorEventRepositoryTest {

    private static String SENSOR_ID = '110';
    private static String NONEXISTENT_ID = '404';

    private static Integer X = 1;
    private static Integer Y = 2;
    private static Integer Z = 3;

    private static String WRONG_SENSOR_EVENT_AMOUNT = 'Actual amount of sensor events does not equal to expected';
    private static String WRONG_SENSOR_EVENT_PARENT = 'Actual sensor previos event does not equal to expected';

    @TestSetup
    static void makeData() {
        Account account = new Account(Name = 'Test');
        insert account;

        Sensor__c sensor = new Sensor__c(Name = SENSOR_ID,
                                         Account__c = account.Id);
        insert sensor;
    }

    @IsTest
    public static void testCreateSensorEvents() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];

        List<Integer> line = new List<Integer>();
        for(Integer i = 0; i < 12; i++) {
            line.add(i);
        }

        SensorEventRepository repository = new SensorEventRepository();
        repository.createSensorEvents(sensor.Id, line);

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];

        System.assertEquals(line.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }

    @IsTest
    public static void testMakeEventChain() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];

        List<Sensor_Event__c> events = new List<Sensor_Event__c>();
    
        Sensor_Event__c firstEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                            x__c = X, 
                                                            y__c = Y,
                                                            z__c = Z);
        events.add(firstEvent);

        Sensor_Event__c secondEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                            x__c = X, 
                                                            y__c = Y,
                                                            z__c = Z);
        events.add(secondEvent);

        Sensor_Event__c thirdEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                            x__c = X, 
                                                            y__c = Y,
                                                            z__c = Z);
        events.add(thirdEvent);

        insert events;

        SensorEventRepository repository = new SensorEventRepository();
        List<Sensor_Event__c> resultEvents = repository.makeEventChain(events);

        System.assertEquals(resultEvents[0].Id, resultEvents[1].Previous_Event__c, WRONG_SENSOR_EVENT_PARENT);
        System.assertEquals(resultEvents[1].Id, resultEvents[2].Previous_Event__c, WRONG_SENSOR_EVENT_PARENT);
    }
}
