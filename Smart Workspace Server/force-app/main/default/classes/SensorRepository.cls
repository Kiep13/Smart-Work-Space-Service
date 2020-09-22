/**
 * Class for working with sensor object
 * Can find sensor object by specified name and account id 
 * Can create sensor witth specified name and account id
 */
public with sharing class SensorRepository {

    private static String NO_SUCH_ACCOUNT = 'Couldn\'t find account with specified id';
 
    public Sensor__c findSensorByIdAndAccount(String sensorName, String accountId) {
        if(!isAccountExists(accountId)) {
            throw new System.IllegalArgumentException(NO_SUCH_ACCOUNT);
        }

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c WHERE Name =: sensorName
                                                                    AND Account__c =: accountId LIMIT 1];
        if(sensors.size() == 0) {
            return null;
        }

        return sensors[0];
    }

    public Sensor__c createSensor(String name, String accountId) {
        Sensor__c sensor = new Sensor__c(Name = name,
                                         Account__c = accountId);
        insert sensor;
        return sensor;
    }

    private Boolean isAccountExists(String id) {
        List<Account> accounts = [SELECT Name FROM Account WHERE Id =: id];

        if(accounts.size() == 0) {
            return false;
        }
        
        return true;
    }
}
