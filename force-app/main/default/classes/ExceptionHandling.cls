public with sharing class ExceptionHandling {
  public static void DMLException() {
    Account acc = new Account();
    //1. DMLException - if DML operation failing
    try {
      insert acc;
    } catch (DMLException ex) {
      System.debug(
        'Error while Processing Account Record - Account name is Mandatory'
      );
    } catch (Exception ex) {
      System.debug('Account Processing Failed - Please contact support');
    }
  }

  public static void ListException() {
    //2.any problem with list collection - attemp to access an index that is out of bounds.
    List<String> studentName = new List<String>{ 'Ankit', 'Amit', 'Sanjay' };
    System.debug('studentName ' + studentName);
    try {
      System.debug('value from index 3 ' + studentName[3]);
    } catch (ListException ex) {
      System.debug('Access value is not available');
    }
  }

  //Null pointer Exceptin
  public static void NullPointerException() {
    String myName; //null
    Boolean isPresent = false;

    System.debug('myName ' + myName);
    if (!String.isBlank(myName)) {
      isPresent = myName.contains('Ankit');
    }
    System.debug('isPresent ' + isPresent);
  }
}
