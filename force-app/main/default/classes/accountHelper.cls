public with sharing class accountHelper {
  @AuraEnabled(cacheable=true)
  public static List<Account> getTopAccounts(String industry) {
    List<Account> accList = [
      SELECT Id, Name, Industry
      FROM account
      WHERE AnnualRevenue != NULL
      WITH USER_MODE
      ORDER BY AnnualRevenue DESC
    ];
    return accList;
  }
}
