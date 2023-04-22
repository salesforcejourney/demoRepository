public with sharing class SOSLDemo {
  public static void soslSearch() {
    List<List<sObject>> searchList = [FIND 'United OR Ankit' IN ALL FIELDS RETURNING Account(Name,Rating),Contact(Name,Email),Opportunity(Name,StageName)];
    List<Account> accList = (List<Account>)searchList[0];
    List<Contact> conList = (List<Contact>)searchList[1];
    List<Opportunity> oppList = (List<Opportunity>)searchList[2];

    for(Account acc : accList){
        System.debug(acc.Name);
    }
    for(Contact con : conList){
        System.debug(con.Name);
    }
    for(Opportunity opp : oppList){
        System.debug(opp.Name);
    }
}
}
