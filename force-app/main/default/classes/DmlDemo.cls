public with sharing class DmlDemo {
  public static void insertBulkRecords() {
    Account acc1 = new Account(
      name = 'Test Account 1',
      Industry = 'Energy',
      Rating = 'Hot'
    );
    Account acc2 = new Account(
      name = 'Test Account 2',
      Industry = 'Energy',
      Rating = 'Hot'
    );
    Account acc3 = new Account(
      name = 'Test Account 3',
      Industry = 'Energy',
      Rating = 'Hot'
    );
    Account acc4 = new Account(
      name = 'Test Account 4',
      Industry = 'Energy',
      Rating = 'Hot'
    );
    /* it will be a bad practice
        insert acc1;
        insert acc2;
        */
    List<Account> accList = new List<Account>();
    accList.add(acc1);
    accList.add(acc2);
    accList.add(acc3);
    accList.add(acc4);

    if (!accList.isEmpty()) {
      try {
        insert as user accList;
      } catch (Exception ex) {
        system.debug(' Error while processing accounts ' + ex.getMessage());
      }
    }
  }

  public static void updateBulkRecords(){

    //for all the accounts where industry is not energy , update rating as Warm
    List<Account> accList = [select id,name,Rating from account where Industry != 'Energy'];
    
    for(Account acc : accList){
        acc.Rating = 'Warm';
    }

    if(!accList.isEmpty()){
        try {
            update as user accList;
        } catch (Exception ex) {
            system.debug(' Error while processing accounts ' + ex.getMessage());
        }
    }

  }

  //based on the passed contact email , update the case status as Closed
  //contact - parent
  //case - child
  //based on email get the contact id

  public static void updateCaseStatus(String conemail){
    List<Case> updateCaseList = new List<Case>();
    List<Contact> conList = [select id,name,email,(select id,status from Cases) from contact where email = :conemail];
    for(Contact con : conList){
        List<Case> caseList = con.Cases;
        if(!caseList.isEmpty()){
            for(Case mycase : caseList){
                mycase.Status = 'Closed';
                updateCaseList.add(mycase);
            }
        }
    }

    if(!updateCaseList.isEmpty()){
        try {
            update as user updateCaseList;

        } catch (Exception ex) {
            system.debug(' Error while processing accounts ' + ex.getMessage());
        }
    }
  }

  //input : conemail , delete the contact record
  public static void deleteContactBasedOnEmail(String conemail){
    List<Contact> conList = [select id,email from contact where email = :conemail];
    if(!conList.isEmpty()){
      try {
        delete as user conList;
      } catch (Exception ex) {
        System.debug('Exception ' + ex.getMessage());
      }
    }
  }
}
