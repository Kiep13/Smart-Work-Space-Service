/**
 * Class for testing SensorSoapClient class makeSoapRequest method
 */
@IsTest
public with sharing class SensorSoapClientTest {
    private static String TEST_TOKEN = 'S9Zs8uEGGTVVtLggFTizCsMtwOJnRhjaQ2BMUQhcY';
    private static String ACCOUNT_ID = '0012w00000MAglGAAT';
    private static String SENSOR_ID = '200';
    private static Integer[] LINE = new Integer[]{1,2,3,4,5,6};

    private static String UNEXPECTED_EXCEPTION = 'Got unexpected exception during makong soap callout';

    @IsTest
    public static void testSoapRequest() {
        try {
            Test.setMock(WebServiceMock.class, new SensorSoapClientMock()); 
            SensorSoapClient.makeSoapRequest(TEST_TOKEN, SENSOR_ID, ACCOUNT_ID, LINE);
        } catch(System.Exception e) {
            System.assert(false, UNEXPECTED_EXCEPTION);
        }
    }
}
