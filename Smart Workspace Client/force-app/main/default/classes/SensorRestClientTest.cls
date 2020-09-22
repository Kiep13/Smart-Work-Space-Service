/**
 * Class for testing SensorRestClient class makeRestRequest method
 */
@IsTest
public with sharing class SensorRestClientTest {

    private static String TEST_TOKEN = 'S9Zs8uEGGTVVtLggFTizCsMtwOJnRhjaQ2BMUQhcY';
    private static String ACCOUNT_ID = '0012w00000MAglGAAT';
    private static String SENSOR_ID = '200';
    private static Integer[] LINE = new Integer[]{1,2,3,4,5,6};

    private static String WRONG_STATUC_CODE = 'Actual status code does not equal to expected';

    @IsTest
    public static void testRestRequest() {
        Test.setMock(HttpCalloutMock.class, new SensorRestClientMock()); 
        HttpResponse response = SensorRestClient.makeRestRequest(TEST_TOKEN, SENSOR_ID, ACCOUNT_ID, LINE);
        System.assertEquals(200, response.getStatusCode());
    }
}