Account[] accts = [Select Id From Account Where IsDeleted = false Limit 5000];
Integer count = 0;
Account[] delaccnts = new List<Account>();
Map<String, Account> ma = new Map<String, Account>();
System.debug('Number of accounts: ' + accts.size());
for (Integer x = 1; x < 10; x++) {
    for (Account act : accts) {
        if (count == 100) {
            System.debug('Running through a batch of deletes');
            if (!ma.containsKey(act.Id)) {
                delaccnts.add(act);
            }
            System.debug('List to delete: ' + delaccnts);
            Database.delete(delaccnts, false);
            System.debug('Delete executed and returned.');
            delaccnts = new List<Account>();
            count = 0;
        } else {
            if (!ma.containsKey(act.Id)) {
                delaccnts.add(act);
                count++;
                ma.put(act.Id, act);
            }
        }
    }
}
Database.delete(delaccnts, false);