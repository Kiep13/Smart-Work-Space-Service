/**
 * Class for testing SensorRepository class
 * Test findSensorByIdAndAccount method
 * Test createSensor method
 */
@IsTest
public with sharing class SensorRepositoryTest {
    
    private static String SENSOR_ID = '110';
    private static String NONEXISTENT_ID = '404';

    private static String EXPECTED_EXCEPTION_MESSAGE = 'Couldn\'t find account with specified id';
    private static String ILLEGAL_ARGUMENT_EXCEPTION  = 'System.IllegalArgumentException';

    private static String EXPECTED_GOT_NULL = 'Expected get null object';
    private static String WRONG_SENSOR_NAME = 'Actual sensor\'s name does n\'t equal to expected';
    private static String WRONG_SENSOR_AMOUNT = 'Actual amount of sensors does n\' equal to expected';
    private static String WRONG_EXCEPTION_MESSAGE = 'Actual exception message does n\' equal to expected';

    @TestSetup
    static void makeData() {
        Account account = new Account(Name = 'Test');
        insert account;

        Sensor__c sensor = new Sensor__c(Name = SENSOR_ID,
                                         Account__c = account.Id);
        insert sensor;
    }

    @IsTest
    public static void testSearchWithUnexistsSensor() {
        Account account = [SELECT Name FROM Account];

        SensorRepository repository = new SensorRepository();
        Sensor__c sensor = repository.findSensorByIdAndAccount(NONEXISTENT_ID, account.Id);

        System.assertEquals(null, sensor, EXPECTED_GOT_NULL);
    }

    @IsTest
    public static void testSearchWithUnexistsAccount() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];

        SensorRepository repository = new SensorRepository();

        try {
            repository.findSensorByIdAndAccount(sensor.Id, NONEXISTENT_ID);
        } catch (Exception e) {
            System.assertEquals(ILLEGAL_ARGUMENT_EXCEPTION, e.getTypeName(),
                'Expected exception with type NoAccessException, but got ' + e.getTypeName());
            System.assertEquals(EXPECTED_EXCEPTION_MESSAGE, e.getMessage(), WRONG_EXCEPTION_MESSAGE);
        }
    }

    @IsTest
    public static void testSearch() {
        Account account = [SELECT Name FROM Account];

        SensorRepository repository = new SensorRepository();
        Sensor__c sensor = repository.findSensorByIdAndAccount(SENSOR_ID, account.Id);

        System.assertEquals(SENSOR_ID, sensor.Name, WRONG_SENSOR_NAME);
    }

    @IsTest
    public static void testCreate() {
        Account account = [SELECT Name FROM Account];

        SensorRepository repository = new SensorRepository();
        repository.createSensor(NONEXISTENT_ID, account.Id);

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(2, sensors.size(), WRONG_SENSOR_AMOUNT);
    }
}
