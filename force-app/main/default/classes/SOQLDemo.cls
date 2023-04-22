public with sharing class SOQLDemo {
  public static void basicSoqlQuery() {
    //get the accounts belongs to Industry = Energy and sort them based on annualRevenue
    List<Account> accList = [
      SELECT id, Name, industry, rating, annualrevenue
      FROM Account
      WHERE Industry = 'Energy'
      WITH SECURITY_ENFORCED
      ORDER BY AnnualRevenue
    ];
    //Apex Loop
    for (Account acc : accList) {
      System.debug(acc.Name);
    }
  }
  public static void basicParameterSoqlQuery(String accIndustry) {
    //get the accounts belongs to Industry = Energy and sort them based on annualRevenue
    List<Account> accList = [
      SELECT id, Name, industry, rating, annualrevenue
      FROM Account
      WHERE Industry = :accIndustry
      WITH SECURITY_ENFORCED
      ORDER BY AnnualRevenue
    ];
    //Apex Loop
    for (Account acc : accList) {
      System.debug(acc.Name);
    }
  }

  public static void parentToChildTraversing() {
    List<Account> accList = [
      SELECT id, Name, (SELECT lastname, email FROM contacts)
      FROM Account
      WITH SECURITY_ENFORCED
    ];

    for (Account acc : accList) {
      System.debug('Account Name ' + acc.Name);
      List<Contact> contactList = acc.contacts;
      for (Contact con : contactList) {
        System.debug('Contact Name ' + con.LastName);
      }
    }
  }

  public static void childToParentTraversing() {
    List<Contact> conlist = [
      SELECT id, lastname, Account.Name, Account.Industry
      FROM contact
      WITH SECURITY_ENFORCED
    ];
    for (Contact con : conlist) {
      System.debug(
        'Contact Name  ' + con.lastname + ' Account name ' + con.Account.Name
      );
    }
  }
}
