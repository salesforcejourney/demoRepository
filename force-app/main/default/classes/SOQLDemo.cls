public with sharing class SOQLDemo {
  public static void standardQuery() {
    List<Account> accList = [
      SELECT id, name, industry, rating
      FROM Account
      WHERE industry = 'Energy'
      WITH USER_MODE
    ];

    for (Account accRec : accList) {
      System.debug(accRec.Name);
    }
  }

  public static void bindVariableQuery(String accIndustry) {
    List<Account> accList = [
      SELECT id, name, industry, rating
      FROM Account
      WHERE industry = :accIndustry
      WITH USER_MODE
    ];

    for (Account accRec : accList) {
      System.debug(accRec.Name);
    }
  }

  public static void dynamicQuery(String accIndustry) {
    String query = 'Select id,Name,Industry,Rating from Account where industry = :accIndustry ';
    List<Account> accList = Database.query(query);
    for (Account accRec : accList) {
      System.debug(accRec.Name);
    }
  }

  //query the contact object and get the account names and industry
  public static void childToParentTraversing() {
    List<contact> conList = [
      SELECT id, lastname, Account.Name, Account.Industry
      FROM contact
      WHERE Account.Name != NULL
    ];
    for (contact con : conList) {
      System.debug(
        'Contact Lastname ' + con.lastname + ' Account name ' + con.Account.Name
      );
    }
  }

  public static void parentToChildTraversing() {
    List<Account> accList = [
      SELECT id, name, (SELECT lastname FROM Contacts)
      FROM Account
    ];
    for (Account acc : accList) {
      System.debug(acc.Name);
      List<Contact> conList = acc.Contacts;
      for (Contact con : conList) {
        System.debug(con.lastname);
      }
    }
  }
}
