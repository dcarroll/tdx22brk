Contact[] contacts = [Select Id From Contact];
Integer count = 0;
Contact[] deletecontacts = new List<Contact>();
System.debug('Number of contacts: ' + contacts.size());
for (Contact cont : contacts) {
    if (count == 200) {
        System.debug('Running through a batch of deletes');
        deletecontacts.add(cont);
        System.debug('List to delete: ' + deletecontacts);
        delete deletecontacts;
        System.debug('Delete executed and returned.');
        deletecontacts = new List<Contact>();
        count = 0;
    } else {
        deletecontacts.add(cont);
        count++;
    }
}
delete deletecontacts;