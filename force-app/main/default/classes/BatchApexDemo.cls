//get all the records which is having industry as energy and update their rating as Hot
public with sharing class BatchApexDemo implements Database.Batchable<sObject> {
  public database.QueryLocator start(Database.BatchableContext bc) {
    //to fetch the records
    String energy = 'Energy';
    String query = 'select id,name from account where industry = :energy';
    return Database.getQueryLocator(query);
  }
  public void execute(Database.BatchableContext bc, List<Account> accList) {
    //to process the records
    for (Account acc : accList) {
      acc.Rating = 'Hot';
    }
    if (!accList.isEmpty()) {
      try {
        update accList;
      } catch (Exception ex) {
        System.debug('Processing failed');
      }
    }
  }
  public void finish(Database.BatchableContext bc) {
    //post processing of records
    System.debug('Processing completed');
  }
}
