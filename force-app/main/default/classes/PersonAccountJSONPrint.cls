public with sharing class PersonAccountJSONPrint {
    public static void printAccounts() {
        List<Account> accounts = [SELECT Id, Name, PersonEmail, PersonMobilePhone
                                  FROM Account
                                  WHERE IsPersonAccount = TRUE];
        Map<Id, Account> accountMap = new Map<Id, Account>();
        for (Account acc : accounts) {
            accountMap.put(acc.Id, acc);
        }
        System.debug(JSON.serialize(accountMap));
    }
}
