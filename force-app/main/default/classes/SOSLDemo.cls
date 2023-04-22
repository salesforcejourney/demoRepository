public with sharing class SOSLDemo {
  public static void staticSearch() {
    List<List<sObject>> searchList = [
      FIND 'United OR Edge'
      IN ALL FIELDS
      RETURNING
        Account(Id, Name),
        Contact(Id, Lastname),
        Opportunity(Id, Name, StageName)
    ];

    List<Account> accList = (List<Account>) searchList[0];
    List<Contact> conList = (List<Contact>) searchList[1];
    List<Opportunity> oppList = (List<Opportunity>) searchList[2];

    for (Account acc : accList) {
      System.debug('Account Name ' + acc.Name);
    }
    for (Contact con : conList) {
      System.debug('Contact Name ' + con.Lastname);
    }
    for (Opportunity opp : oppList) {
      System.debug('Opportunity Name ' + opp.Name);
    }
  }

  public static void dynamicSearch(String searchString){
    String query = 'FIND :searchString IN ALL FIELDS RETURNING Account(Id, Name), Contact(Id, Lastname), Opportunity(Id, Name, StageName)';
    List<List<sObject>> searchList = Search.query(query);
    List<Account> accList = (List<Account>) searchList[0];
    List<Contact> conList = (List<Contact>) searchList[1];
    List<Opportunity> oppList = (List<Opportunity>) searchList[2];

    for (Account acc : accList) {
      System.debug('Account Name ' + acc.Name);
    }
    for (Contact con : conList) {
      System.debug('Contact Name ' + con.Lastname);
    }
    for (Opportunity opp : oppList) {
      System.debug('Opportunity Name ' + opp.Name);
    }
} 
}
