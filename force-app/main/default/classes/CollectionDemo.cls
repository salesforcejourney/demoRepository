public with sharing class CollectionDemo {
  public static void listDemo() {
    //it is used to store ordered and duplicate data

    //Declare the list
    List<String> studentList = new List<String>();

    List<Account> accountList = new List<Account>();

    //Add the element in list
    studentList.add('Ankit'); //0
    studentList.add('Raju'); //1
    studentList.add('Sanjay'); //2
    studentList.add('Priyanka'); //3

    accountList.add(new Account(Name = 'Ankit', Rating = 'Hot'));

    //access the value from list
    System.debug('Student at 1st Index ' + studentList[1]);
    System.debug('Student at 1st Index ' + studentList.get(0));
    System.debug('Account name ' + accountList.get(0).Name);

    //how to check the size of list
    System.debug('Size of list ' + studentList.size());

    //check  list is empty
    System.debug('list is empty ? ' + studentList.isEmpty());

    //remove from list
    String removedItem = studentList.remove(0);
    System.debug('Remove ankit from list ' + removedItem);

    //sort the list
    studentList.sort();
    System.debug('Sorted List ' + studentList);

    //clear the list
    studentList.clear();
    System.debug('Cleared List ' + studentList);
  }

  public static void setDemo() {
    //Declare the set
    Set<Integer> rollNos = new Set<Integer>();

    //Add entries in set
    rollNos.add(102);
    rollNos.add(101);
    rollNos.add(108);
    rollNos.add(106);
    rollNos.add(102);
    rollNos.add(107);

    System.debug('rollNos ' + rollNos);
    System.debug('rollNos size ' + rollNos.size());
    System.debug('is Set empty ' + rollNos.isEmpty());
    System.debug(
      'check value 106 is present in set or not ' + rollNos.contains(106)
    );
    System.debug(
      'check value 110 is present in set or not ' + rollNos.contains(110)
    );
    Boolean removedElement = rollNos.remove(106);
    System.debug('Removed element from set' + removedElement);
    rollNos.clear();
    System.debug('Cleared set' + rollNos);
  }

  public static void mapDemo() {
    //data : key - value
    //define the map
    Map<Integer, String> studentRecord = new Map<Integer, String>();

    //to add entries in map
    /**
     *
     * Key : keys will be unique , keys are unordered
     * value : it can be duplicate , values are ordered
     *
     */
    studentRecord.put(101, 'Ankit');
    studentRecord.put(108, 'Raju');
    studentRecord.put(107, 'Sanju');
    studentRecord.put(104, 'Deepak');
    studentRecord.put(101, 'Amit');

    System.debug('studentRecord ' + studentRecord);

    System.debug('studentRecord size ' + studentRecord.size());
    System.debug('studentRecord is Empty ' + studentRecord.isEmpty());

    System.debug('Access 108 record from Map ' + studentRecord.get(108));
    System.debug('Access Sanju record from Map ' + studentRecord.get(107));

    //to check if key is present in map or not
    System.debug(
      'Check if 104 key is prent in map ' + studentRecord.containsKey(104)
    );
    System.debug(
      'Check if 111 key is prent in map ' + studentRecord.containsKey(111)
    );

    //remove the values from map
    studentRecord.remove(104);
    System.debug('studentRecord map after removal of 104 ' + studentRecord);

    //to access all the keys of the map
    System.debug('Access all the keys of map ' + studentRecord.keySet());
    //to access all the keys of the map
    System.debug('Access all the values of map ' + studentRecord.values());
  }
}
