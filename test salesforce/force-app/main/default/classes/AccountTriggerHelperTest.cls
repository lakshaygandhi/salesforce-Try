@isTest
public class AccountTriggerHelperTest {
   
    public static testMethod void testGetCityOrCountry() {
       Account testAccount = new Account();
        testAccount.Name = 'Test Acc';
        testAccount.IP_Address__c = '1.71.255.255';
        Test.setMock(HttpCalloutMock.class, new CountryLocatorMock());
        test.startTest();
        insert testAccount;
        test.stopTest();
        List<Account> theAcntAssertionList = [SELECT Id,Country__c, City__c FROM Account];
        for(Account acc : theAcntAssertionList) {
            system.assertEquals('China', acc.Country__c);
            system.assertEquals('Taiyuan', acc.City__c);
        }
    }
    
}