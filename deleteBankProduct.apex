Bank_Product__c[] bankProducts = [Select Id From Bank_Product__c];
Integer count = 0;
List<Bank_Product__c> deleteBankProducts = new List<Bank_Product__c>();
System.debug('Number of contacts: ' + bankProducts.size());
for (Bank_Product__c bankProduct : bankProducts) {
    if (count == 200) {
        System.debug('Running through a batch of deletes');
        deleteBankProducts.add(bankProduct);
        System.debug('List to delete: ' + deleteBankProducts);
        delete deleteBankProducts;
        System.debug('Delete executed and returned.');
        deleteBankProducts = new List<Bank_Product__c>();
        count = 0;
    } else {
        deleteBankProducts.add(bankProduct);
        count++;
    } 
}
delete deleteBankProducts;