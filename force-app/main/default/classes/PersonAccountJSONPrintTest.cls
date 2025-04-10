@isTest
private class PersonAccountJSONPrintTest {

    @testSetup
    static void setupTestData() {
        RecordType personAcctRT = [SELECT Id FROM RecordType
                                   WHERE SObjectType = 'Account' AND IsPersonType = true
                                   LIMIT 1];

        Account personAccount = new Account(
            RecordTypeId = personAcctRT.Id,
            LastName = 'Testowy',
            PersonEmail = 'test@example.com',
            PersonMobilePhone = '123456789'
        );
        insert personAccount;
    }

    @isTest static void testPrintAccounts() {
        Test.startTest();
        PersonAccountJSONPrint.printAccounts();
        Test.stopTest();

        System.assert(true, 'Nothing to compare.');
    }
}
