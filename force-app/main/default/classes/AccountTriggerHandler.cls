public with sharing class AccountTriggerHandler {
    
    static Set<Id> accountsProcessed=new Set<Id>();

    public static void updateAccount(Map<Id, Account> newMap){
        
        List<Account> accountsToBeUpdated=new List<Account>();
        
        system.debug('Account Processed: '+accountsProcessed.size());
        for(Account acc:newMap.values()){
            if(accountsProcessed.contains(acc.Id)) continue;
            accountsToBeUpdated.add(new Account(Id=acc.Id, Name=acc.Name+'Test'));
            accountsProcessed.add(acc.Id);
        }

        if(!accountsToBeUpdated.isEmpty() && Schema.sObjectType.Account.isUpdateable()){
            update accountsToBeUpdated;
        }
    }
}
