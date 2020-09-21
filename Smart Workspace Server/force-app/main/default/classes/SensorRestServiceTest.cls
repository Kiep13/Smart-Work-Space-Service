@IsTest
public with sharing class SensorRestServiceTest {

    public static String SERVER_BASE_URL = 'https://resilient-koala-ulbvbp-dev-ed.my.salesforce.com';

    private static String SENSOR_ID = '110';
    private static String NONEXISTENT_ID = '404';

    private static String WRONG_SENSOR_EVENT_AMOUNT = 'Actual amount of sensor events does n\' equal to expected';
    private static String WRONG_SENSOR_AMOUNT = 'Actual amount of sensors does n\' equal to expected';

    @TestSetup
    static void makeData() {
        Account account = new Account(Name = 'Test');
        insert account;

        Sensor__c sensor = new Sensor__c(Name = SENSOR_ID,
                                         Account__c = account.Id);
        insert sensor;
    }

    @IsTest
    public static void checkWithExistSensor() {

        Account account = [SELECT Name FROM Account];

        List<Integer> line = new List<Integer>();
        for(Integer i = 0; i < 12; i++) {
            line.add(i);
        }
        SensorData sensorData = new SensorData(account.Id, SENSOR_ID, line);

        RestRequest request = new RestRequest();
        request.requestUri = SERVER_BASE_URL + '/services/apexrest/sensorEvent';
        request.httpMethod = 'PUT';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(JSON.serialize(sensorData));
        RestContext.request = request;

        SensorRestService.upsertData();

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(1, sensors.size(), WRONG_SENSOR_EVENT_AMOUNT);

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];

        System.assertEquals(line.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }

    @IsTest
    public static void checkWithUnexistsSensor() {

        Account account = [SELECT Name FROM Account];

        List<Integer> line = new List<Integer>();
        for(Integer i = 0; i < 12; i++) {
            line.add(i);
        }
        SensorData sensorData = new SensorData(account.Id, NONEXISTENT_ID, line);

        RestRequest request = new RestRequest();
        request.requestUri = SERVER_BASE_URL + '/services/apexrest/sensorEvent';
        request.httpMethod = 'PUT';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(JSON.serialize(sensorData));
        RestContext.request = request;

        SensorRestService.upsertData();

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(2, sensors.size(), WRONG_SENSOR_EVENT_AMOUNT);

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];

        System.assertEquals(line.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }

    @IsTest
    public static void checkWithUncorrectLine() {

        Account account = [SELECT Name FROM Account];

        List<Integer> line = new List<Integer>();
        for(Integer i = 0; i < 13; i++) {
            line.add(i);
        }
        SensorData sensorData = new SensorData(account.Id, SENSOR_ID, line);

        RestRequest request = new RestRequest();
        request.requestUri = SERVER_BASE_URL + '/services/apexrest/sensorEvent';
        request.httpMethod = 'PUT';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(JSON.serialize(sensorData));
        RestContext.request = request;

        SensorRestService.upsertData();

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];

        System.assertEquals(line.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }
}
