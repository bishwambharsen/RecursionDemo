@isTest
public class AccountTrigger_Test {
    
    @TestSetup
    static void makeData(){
        List<Account> accounts=new List<Account>();

        for(Integer i=0;i<500;i++){
            accounts.add(new Account(Name='Account '+i));
        }
        insert accounts;
    }
    @isTest
    static void recursion_test(){
        
        List<Account> accountsToBeUpdated=[select Id, Name from Account for update];
        Test.startTest();
        update accountsToBeUpdated;
        Test.stopTest();

        system.assertEquals(500, [select Id from Account where Name like '%Test'].size(),'Assertion failed');
    }
}
