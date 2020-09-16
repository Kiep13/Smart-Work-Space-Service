### Server Task

Create Custom Objects:
1.  Sensor__c (fields: Name(text 80), Max_Vectors_Difference - Roll up summary , Account_Id__c Master-Detail (Account) ). 
2.  Sensor_Event_c (fields: Name- Autonumber, Previous_Event__c - Lookup(Sensor_Event__c), Modulus_difference_Vectors__c - Formula(Number =sqrt(x*x + y*y + z*z)), Sensor__c - Master Detail(Sensor__c), x - number, y - number, z - number)

Develop a SOAP service on the Salesforce side that will accept data of the form: {accountId: id, sensorid: id, line: [x1, y1, z1, x2, y2, z2, x3, .... xN, yN, zN]}
 Example: {accountId: '001ABCDEFG00001', sensorid: '1', line: [22, 17, 197, 23, 45, 14, 22, 43, 196, 24, 42, 198]} 

 ### Client Task
1.  Develop integraion with server org
2.  Implement classes and methods that will use the REST API to work with Custom Objects. Records in the database must be created in a single query.
3.  Implement a SOAP client that will make requests to the 1st org and save data in Custom Objects
4.  Write tests that will check how all the logic works.
5.  The connected APP must be used for authorization.
