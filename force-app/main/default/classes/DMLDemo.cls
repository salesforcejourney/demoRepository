public with sharing class DMLDemo {
  public static void insertSingleRecord() {
    Account acc = new Account();
    acc.Name = 'Test Account';
    acc.Industry = 'Energy';
    acc.Rating = 'Hot';

    try {
      insert as user acc;
    } catch (Exception ex) {
      System.debug('Error ' + ex.getMessage());
    }
  }

  public static void multipleRecordInsert(){
    Account acc1 = new Account(name = 'Test Account 2' , Industry = 'Energy', Rating = 'Hot');
    Account acc2 = new Account(name = 'Test Account 3' , Industry = 'Banking', Rating = 'Cold');
    Account acc3 = new Account(name = 'Test Account 4' , Industry = 'Appreal', Rating = 'Warm');
    List<Account> accList = new List<Account>();
    
    accList.add(acc1);
    accList.add(acc2);
    accList.add(acc3);

    try {
        insert as user accList;
    } catch (Exception ex) {
        System.debug('Error ' + ex.getMessage());
      }
    // insert acc1;
    // insert acc2;
    // insert acc3;
  } 

  public static void insertRelatedRecord(){
    //Whenever account is created , also create the contact and link the contact with the account. 
    Account acc1 = new Account(name = 'Test Account 5' , Industry = 'Energy', Rating = 'Hot');
    insert acc1;
    System.debug('Account Created ' + acc1.Id);
    Contact con = new Contact(lastname = 'Test Contact Account' , email = 'testcontact@email.com',AccountId=acc1.Id);
    insert con;
  }
  public static void updateRecords(){
    //while performing update operation salesforce record id is mandatory

    //For all the accounts where Rating is hot, populate SLA as Gold

    //get the account where rating is hot

    List<Account> accList = [select id,name,SLA__c from Account where rating = 'Hot'];

    for(Account acc : accList){
        acc.SLA__c = 'Gold';
        List<Account> accList = [select id,name,SLA__c from Account where rating = 'Hot'];
    }

    if(accList.size()>0){
        try {
            update accList;
        } catch (Exception ex) {
            System.debug('Error ' + ex.getMessage());
          }
    }

  }

  public static void deleteRecords(){
    //delete the contacts where email address is blank
    List<Contact> conList = [select id,lastname from contact where email = null];
    if(conList.size() > 0){
        try {
            delete conList;
        } catch (Exception ex) {
            System.debug('Error ' + ex.getMessage());
          }
    }
  }

  public static void unDeleteRecords(){
    //delete the contacts where email address is blank
    List<Contact> conList = [select id,lastname from contact where email = null ALL ROWS];
    if(conList.size() > 0){
        try {
            undelete conList;
        } catch (Exception ex) {
            System.debug('Error ' + ex.getMessage());
          }
    }
  }

  public static void upsertRecords(){
    //upsert : update + insert
    //update
    List<Account> accList = [select id ,name from Account where industry = 'Energy' AND rating != 'Hot' ];
    for(Account acc : accList){
        acc.Rating = 'Hot';
    }
    //insert
    Account acc = new Account(name = 'Test Account 8' , Industry = 'Appreadl' , Rating = 'Warm');
    accList.add(acc);

    if(accList.size() > 0){
        try {
            // update accList;
            // insert acc;
            upsert accList;
        } catch (Exception ex) {
            System.debug('Error ' + ex.getMessage());
          }
    }
  }
}
