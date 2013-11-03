library ex08;

import 'dart:math';

part 'functions.dart';

void main() {
  //Test of ex08_1
  print("\n====================");
  print("Test of ex08_1");
  print("====================\n");
  
  List nounList = ['dog', 'cat', 'house', 'car', 'table', 'chair'];
  List verbList = ['eats', 'drinks', 'takes', 'gives', 'loves', 'hates'];
  List adjectiveList = ['beautiful', 'ugly', 'big', 'small', 'old', 'young'];
  List adverbList = ['quickly', 'slowly', 'patiently', 'expeditiously', 'easily', 'hardly'];
  
  List resultList = createSentence(nounList, verbList, adjectiveList, adverbList);
  printList(resultList);

  //Test of ex08_2
  print("\n====================");
  print("Test of ex08_2");
  print("====================\n");
  
  List members = [
    {"associationName": "IS", "firstName": "Bob", "lastName": "Hemsky", "email": "bhemsky@gmail.com"},
    {"associationName": "CS", "firstName": "Bob", "lastName": "Halak", "email": "bhalak@gmail.com"},
    {"associationName": "CS", "firstName": "Aaron", "lastName": "Halak", "email": "ahalak@gmail.com"},
    {"associationName": "IS", "firstName": "Dzenan", "lastName": "Ridjanovic", "email": "dr@gmail.com"},
    {"associationName": "CS", "firstName": "David", "lastName": "Curtis", "email": "dc@gmail.com"},
    {"associationName": "IS", "firstName": "Robert", "lastName": "Nelson", "email": "rn@gmail.com"},
    {"associationName": "CS", "firstName": "Jaroslav", "lastName": "Halak", "email": "jhalak@gmail.com"},
    {"associationName": "CS", "firstName": "Derek", "lastName": "Halak", "email": "dhalak@gmail.com"}
  ];
  
  resultList = sortMembers(members);
  printList(resultList);
  print("\n====================\n");
  resultList = getMembersLastNameBeginsWith(members, "H");
  printList(resultList);
  
  //Test of ex08_3
  print("\n====================");
  print("Test of ex08_3");
  print("====================\n");
  
  print("The test of ex08_3 is made by using unit tests in the file unittest.dart");
  
  //Test of ex08_4
  print("\n====================");
  print("Test of ex08_4");
  print("====================\n");
  
  List myMatrix = [
                     [1, 0, 1, 1, 1, 0, 0, 0, 1, 1],
                     [1, 1, 0, 1, 1, 0, 0, 0, 0, 1],
                     [1, 1, 0, 0, 0, 0, 1, 0, 1, 1],
                     [1, 1, 1, 0, 0, 1, 1, 0, 0, 1],
                     [1, 0, 0, 0, 1, 1, 1, 0, 0, 1]
                  ];
  
  List result = findGroupOfOnes(myMatrix);
  for (int i = 0; i < result.length; i++) {
    Coordinate myCoordinate = result.elementAt(i);
    myCoordinate.printClass();
  }
  
  //Test of ex08_5
  print("\n====================");
  print("Test of ex08_5");
  print("====================\n");

  print("See README.md for more information on ex08_5");
}

void printList(List l) {
  
  for (int i = 0; i < l.length; i++) {
    print(l.elementAt(i).toString());
  }
  
  return;
}
