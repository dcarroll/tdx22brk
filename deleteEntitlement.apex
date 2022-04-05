Entitlement[] etntitlements = [Select Id From Entitlement];
Integer count = 0;
Entitlement[] deleteEntititlements = new List<Entitlement>();
System.debug('Number of Entitlements: ' + deleteEntititlements.size());
for (Entitlement entitlement : etntitlements) {
    if (count == 200) {
        System.debug('Running through a batch of deletes');
        deleteEntititlements.add(entitlement);
        System.debug('List to delete: ' + deleteEntititlements);
        delete deleteEntititlements;
        System.debug('Delete executed and returned.');
        deleteEntititlements = new List<Entitlement>();
        count = 0;
    } else {
        deleteEntititlements.add(entitlement);
        count++;
    }
}
delete deleteEntititlements;