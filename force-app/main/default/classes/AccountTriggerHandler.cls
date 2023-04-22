public with sharing class AccountTriggerHandler {
  public static void beforeUpdate(
    List<Account> accList,
    Map<Id, Account> oldAccountMap
  ) {
    for (Account acc : accList) {
      //how to check whether phone number is updated
      //compare the old value and new value
      //if old value <> new value --> phone number is udpated

      String newPhoneNumber = acc.Phone;
      Account oldAccount = oldAccountMap.get(acc.Id);
      String oldPhoneNumber = oldAccount.Phone;

      if (newPhoneNumber != oldPhoneNumber) {
        acc.Description =
          'old Phone number ' +
          oldPhoneNumber +
          ' and new phone number ' +
          newPhoneNumber;
      }
    }
  }

  public static void beforeDelete(List<Account> oldAccount) {
    for (Account acc : oldAccount) {
      if (acc.Active__c == 'Yes') {
        acc.addError('Not Authorized to delete the account');
      }
    }
  }

  public static void afterInsert(List<Account> newAccList) {
    List<Contact> conList = new List<Contact>();
    for (Account acc : newAccList) {
      Contact con = new Contact();
      con.LastName = acc.name;
      con.AccountId = acc.Id;
      con.Phone = acc.Phone;
      conList.add(con);
    }

    if(!conList.isEmpty()){
        try {
            insert as user conList;

        } catch (Exception ex) {
            System.debug('Contact Record Creation failed ' + ex.getMessage());
        }
    }
  }

  public static void afterUpdate(List<Account> accList,Map<Id,Account> oldAccount){
    Map<Id,String> accountIdsWithPhoneNumber = new Map<Id,String>();
    for(Account acc : accList){
        if(acc.Phone != oldAccount.get(acc.Id).Phone){
            accountIdsWithPhoneNumber.put(acc.Id,acc.Phone);
        }
    }

    List<Contact> contactList = [select id,accountId,Phone from Contact where accountId in : accountIdsWithPhoneNumber.keySet()];
    
    for(Contact con : contactList){
        con.Phone = accountIdsWithPhoneNumber.get(con.accountId);
    }

    if(!contactList.isEmpty()){
        try {
            update contactList;
        } catch (Exception ex) {
            System.debug('Error while updating contact list ' + ex.getMessage());
        }
    }
  }
}
