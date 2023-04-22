public with sharing class RefresherCollection {
  public static void listDemo() {
    //ordered collection , allow duplicate values

    //Declare the list
    List<String> studentList = new List<String>();

    //add the entries in list
    studentList.add('Ankit'); //0
    studentList.add('Amit'); //1
    studentList.add('Kiyaan'); //2
    studentList.add('Lakshya'); //3
    System.debug('Student List ' + studentList);

    //Size of list
    System.debug('Student List Size ' + studentList.size());

    //to get the index : indexOf
    System.debug('Index of Amit ' + studentList.indexOf('Amit'));

    //remove the element from list : remove(index)
    //Remove amit from List
    String removedElement = studentList.remove(studentList.indexOf('Amit'));
    System.debug('Updated List ' + studentList);
    System.debug('removedElement ' + removedElement);

    //Access the value from List : get(index) , []
    System.debug('Get Kiyaan from List ' + studentList.get(1));
    System.debug('Get Kiyaan from List ' + studentList[1]);

    studentList.clear();
    System.debug('Updated List ' + studentList);
  }

  public static void setDemo() {
    //unordered collection , it does not allow duplicates

    //Define the set collection
    Set<Integer> rollNoSet = new Set<Integer>();

    //To add element in set
    rollNoSet.add(108);
    rollNoSet.add(107);
    rollNoSet.add(104);
    rollNoSet.add(102);
    rollNoSet.add(109);
    rollNoSet.add(107);
    System.debug('rollNoSet ' + rollNoSet);

    //size of set
    System.debug('Size of rollNoSet ' + rollNoSet.size());

    //check if the value is present in set or not : contains
    System.debug('rollNoSet contains 104 ' + rollNoSet.contains(104));
    System.debug('rollNoSet contains 124 ' + rollNoSet.contains(124));

    //remove : use to remove the entries from set : remove 102 from set
    Boolean isEntryRemoved = rollNoSet.remove(102);
    System.debug('rollNoSet remove 102 ' + isEntryRemoved);
    System.debug('updated rollNoSet ' + rollNoSet);

    //clear method - to clear the set
    rollNoSet.clear();
    System.debug('updated rollNoSet ' + rollNoSet);
  }

  public static void mapDemo() {
    //declare the map
    Map<Integer, String> studentRecord = new Map<Integer, String>();

    //Add the entries in map
    studentRecord.put(101, 'Ankit');
    studentRecord.put(108, 'Amit');
    studentRecord.put(104, 'Kiyaan');
    studentRecord.put(102, 'Lakshya');

    System.debug('studentRecord ' + studentRecord);
    System.debug('studentRecord size ' + studentRecord.size());

    //check if key is presnt in map : containsKey
    System.debug('Do your map have 104 key ' + studentRecord.containsKey(104));

    //what is the value of 104 key
    System.debug('Get value based on key ' + studentRecord.get(104));

    //remove the record from map
    studentRecord.remove(104);
    System.debug('updated studentRecord ' + studentRecord);

    //get all the keys of map :keySet
    System.debug('Keys of Map ' + studentRecord.keySet());

    //get all the values of map
    System.debug('Values of Map ' + studentRecord.values());

    //clear
    studentRecord.clear();
    System.debug('updated studentRecord post clear ' + studentRecord);
  }
}
