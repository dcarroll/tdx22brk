Bank_Account__c[] bankAccounts = [Select Id From Bank_Account__c];
Integer count = 0;
Bank_Account__c[] deleteBankAccounts = new List<Bank_Account__c>();
System.debug('Number of contacts: ' + bankAccounts.size());
for (Bank_Account__c bankAccount : bankAccounts) {
    if (count == 200) {
        System.debug('Running through a batch of deletes');
        deleteBankAccounts.add(bankAccount);
        System.debug('List to delete: ' + deleteBankAccounts);
        delete deleteBankAccounts;
        System.debug('Delete executed and returned.');
        deleteBankAccounts = new List<Bank_Account__c>();
        count = 0;
    } else {
        deleteBankAccounts.add(bankAccount);
        count++;
    }
}
delete deleteBankAccounts;