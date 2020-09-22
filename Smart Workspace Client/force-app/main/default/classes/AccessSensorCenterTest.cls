@IsTest
public with sharing class AccessSensorCenterTest {
    private static String TEST_TOKEN = 'S9Zs8uEGGTVVtLggFTizCsMtwOJnRhjaQ2BMUQhcY';

    private static String INVALID_TOKEN = 'Actual token doesn\'t equal to expected';

    @IsTest
    public static void testGetToken() {

        Test.setMock(HttpCalloutMock.class, new AccessSensorCenterMock()); 
        String token = AccessSensorCenter.getToken();

        System.assertEquals(TEST_TOKEN, token,INVALID_TOKEN);
    }
}
