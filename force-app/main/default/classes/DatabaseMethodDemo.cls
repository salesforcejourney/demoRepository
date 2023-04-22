public with sharing class DatabaseMethodDemo {
  public static void limitationWithDmlStatement() {
    Contact con1 = new Contact(lastname = 'Raju');
    Contact con2 = new Contact(lastname = 'Sanju');
    Contact con3 = new Contact();
    Contact con4 = new Contact(lastname = 'Deepak');

    List<Contact> conList = new List<Contact>();
    conList.add(con1);
    conList.add(con2);
    conList.add(con3);
    conList.add(con4);

    insert as user conList;
  }

  public static void databaseInsert() {
    Contact con1 = new Contact(lastname = 'Raju');
    Contact con2 = new Contact(lastname = 'Sanju');
    Contact con3 = new Contact();
    Contact con4 = new Contact(lastname = 'Deepak');

    List<Contact> conList = new List<Contact>();
    conList.add(con1);
    conList.add(con2);
    conList.add(con3);
    conList.add(con4);

    List<Database.SaveResult> srList = Database.insert(conList, false,AccessLevel.USER_MODE);

    for(Database.SaveResult sr : srList){
        if(sr.isSuccess()){
            System.debug('Record Created Successfully ' + sr.getId());
        }else{
            for(Database.Error err : sr.getErrors()){
                System.debug('The following error occured ' + err.getMessage());
            }
        }
    }
  }
}
