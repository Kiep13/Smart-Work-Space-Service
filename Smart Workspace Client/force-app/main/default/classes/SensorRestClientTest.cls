/**
 * Class for testing SensorRestClient class
 * Test makeCustomRestRequest method
 * Test makeStandardRestRequest method
 */
@IsTest
public with sharing class SensorRestClientTest {

    private static String TEST_TOKEN = 'S9Zs8uEGGTVVtLggFTizCsMtwOJnRhjaQ2BMUQhcY';
    private static String ACCOUNT_ID = '0012w00000MAglGAAT';
    private static String SENSOR_NAME = '200';
    private static Integer[] LINE = new Integer[]{1,2,3,4,5,6};

    private static String SENSOR_ID = '0012w00000MAglGAAT';
    private static Integer X = 1;
    private static Integer Y = 2;
    private static Integer Z = 3;

    private static String WRONG_STATUC_CODE = 'Actual status code does not equal to expected';

    @IsTest
    public static void testCustomRestRequest() {
        Test.setMock(HttpCalloutMock.class, new SensorRestClientMock()); 
        HttpResponse response = SensorRestClient.makeCustomRestRequest(SENSOR_NAME, ACCOUNT_ID, LINE);
        System.assertEquals(200, response.getStatusCode());
    }

    @IsTest
    public static void testStandardRestRequest() {
        Test.setMock(HttpCalloutMock.class, new SensorRestClientMock()); 
        HttpResponse response = SensorRestClient.makeStandardRestRequest(new SensorEvent(SENSOR_ID, X, Y, Z));
        System.assertEquals(200, response.getStatusCode());
    }
}