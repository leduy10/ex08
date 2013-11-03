part of ex08;

/***********************/
/* Function for ex08_1 */
/***********************/
List createSentence(List nouns, List verbs, List adjectives, List adverbs) {
  
  int nbrSentences = max(nouns.length, max(verbs.length, max(adjectives.length, adverbs.length)));
  List sentences = new List();
  Random rnd = new Random();

  for (int i = 0; i < nbrSentences; i++) {
    String newSentence = "The ";
    newSentence = newSentence + adjectives.elementAt(rnd.nextInt(adjectives.length)) + " ";
    newSentence = newSentence + nouns.elementAt(rnd.nextInt(nouns.length)) + " ";
    newSentence = newSentence + verbs.elementAt(rnd.nextInt(verbs.length)) + " ";
    newSentence = newSentence + adverbs.elementAt(rnd.nextInt(adverbs.length)) + ".";
    sentences.add(newSentence);
  }
  
  return sentences;
}

/***********************/
/* Function for ex08_2 */
/***********************/
List sortMembers(List m) {
  
  List returnList = new List();
  Map pointer = m.elementAt(0);
  returnList.add(pointer);
  
  for (int i = 1; i < m.length; i++) {
    bool inserted = false;
    pointer = m.elementAt(i);
    String lastName = pointer["lastName"];
    String firstName = pointer["firstName"];
    for (int j = 0; j < returnList.length; j++) {
      Map returnPointer = returnList.elementAt(j);
      String returnLastName = returnPointer["lastName"];
      String returnFirstName = returnPointer["firstName"];
      if (lastName.compareTo(returnLastName) < 0 && inserted == false) {
        returnList.insert(j, pointer);
        inserted = true;
      } else if (lastName.compareTo(returnLastName) == 0 && inserted == false) {
        for (int k = j; k < returnList.length; k++) {
          returnPointer = returnList.elementAt(j);
          returnLastName = returnPointer["lastName"];
          returnFirstName = returnPointer["firstName"];
          if (lastName.compareTo(returnLastName) == 0 && firstName.compareTo(returnFirstName) < 0 && inserted == false) {
            returnList.insert(k, pointer);
            inserted = true;
          } else if (lastName.compareTo(returnLastName) != 0 && inserted == false) {
            returnList.insert(k, pointer);
            inserted = true;
          }
        }
      }
    }
    if (inserted == false) {
      returnList.add(pointer);
    }
  }
  
  return returnList;
}

List getMembersLastNameBeginsWith(List m, String letter) {
  
  List returnList = new List();
  
  for (int i = 0; i < m.length; i++) {
    Map pointer = m.elementAt(i);
    String lastName = pointer["lastName"];
    if(lastName.substring(0, 1) == letter) {
      returnList.add(pointer);
    }
  }
  
  return returnList;
}

/***********************/
/* Function for ex08_3 */
/***********************/

class AssociationMembers {
  
  List associations;
  List members;
  
  AssociationMembers() {
    associations = new List();
    members = new List();
  }
  
  List getAssociations() {
    return associations;
  }
  
  List getMembers() {
    return members;
  }
  
  bool addAssociation(String name, String description) {
    if (getAssociationPosition(name) == -1) {
      Map add = {"name": name, "description": description};
      associations.add(add);
      return true;
    }
    return false;
  }
  
  bool addMember(String associationName, String firstName, String lastName, String email) {
    if (getAssociationPosition(associationName) == -1) {
      return false;
    } else if (getMemberAssociationPosition(email, associationName) != -1) {
      return false;
    } else {
      Map add = {"associationName": associationName, "firstName": firstName, "lastName": lastName, "email": email};
      members.add(add);
      return true;
    }
  }
  
  bool removeAssociation(String name) {
    int position = getAssociationPosition(name);
    if (position == -1) {
      return false;
    } else {
      associations.removeAt(position);
      for (int i = 0; i < members.length; i++) {
        Map pointer = members.elementAt(i);
        String associationName = pointer["associationName"];
        if (associationName == name) {
          members.removeAt(i);
          i = i - 1;
        }
      }
      return true;
    }
  }
  
  bool removeMember(String email) {
    int position = getMemberPosition(email);
    if (position == -1) {
      return false;
    } else {
      for (int i = 0; i < members.length; i++) {
        Map pointer = members.elementAt(i);
        String memberEmail = pointer["email"];
        if (memberEmail == email) {
          members.removeAt(i);
          i = i - 1;
        }
      }
      return true;
    }
  }
  
  bool removeMemberAssociation(String email, String associationName) {
    int position = getMemberAssociationPosition(email, associationName);
    if (position == -1) {
      return false;
    } else {
      members.removeAt(position);
      return true;
    }
  }
  
  bool updateAssociationName(String name, String newName) {
    int pos = getAssociationPosition(name);
    if (pos == -1) {
      return false;
    } else if (getAssociationPosition(newName) != -1) {
      return false;
    } else {
      Map pointer = associations.elementAt(pos);
      pointer["name"] = newName;
      associations.removeAt(pos);
      associations.add(pointer);
      for (int i = 0; i < members.length; i++) {
        Map memberPointer = members.elementAt(i);
        if (memberPointer["associationName"] == name) {
          memberPointer["associationName"] = newName;
          members.removeAt(i);
          members.add(memberPointer);
          i = i - 1;
        }
      }
      return true;
    }
  }
  
  bool updateAssociationDescription(String name, String newDescription) {
    int pos = getAssociationPosition(name);
    if (pos == -1) {
      return false;
    } else {
      Map pointer = associations.elementAt(pos);
      pointer["description"] = newDescription;
      associations.removeAt(pos);
      associations.add(pointer);
      return true;
    }
  }
  
  bool updateMemberEmail(String email, String newEmail) {
    int pos = getMemberPosition(email);
    if (pos == -1) {
      return false;
    } else if (getMemberPosition(newEmail) != -1) {
      return false;
    } else {
      for (int i = 0; i < members.length; i++) {
        Map pointer = members.elementAt(i);
        if (pointer["email"] == email) {
          pointer["email"] = newEmail;
          members.removeAt(i);
          members.add(pointer);
          i = i - 1;
        }
      }
      return true;
    }
  }
  
  bool updateMemberFirstName(String email, String newFirstName) {
    int pos = getMemberPosition(email);
    if (pos == -1) {
      return false;
    } else {
      for (int i = 0; i < members.length; i++) {
        Map pointer = members.elementAt(i);
        if (pointer["email"] == email) {
          pointer["firstName"] = newFirstName;
          members.removeAt(i);
          members.insert(i, pointer);
        }
      }
      return true;
    }
  }
  
  bool updateMemberLastName(String email, String newLastName) {
    int pos = getMemberPosition(email);
    if (pos == -1) {
      return false;
    } else {
      for (int i = 0; i < members.length; i++) {
        Map pointer = members.elementAt(i);
        if (pointer["email"] == email) {
          pointer["lastName"] = newLastName;
          members.removeAt(i);
          members.insert(i, pointer);
        }
      }
      return true;
    }
  }
    
  /**************************************/
  /**************************************/
  /**** FONCTIONS DE SUPPORT ************/
  /**************************************/
  /**************************************/
  
  int getAssociationPosition(String name) {
    for (int i = 0; i < associations.length; i++) {
      Map pointer = associations.elementAt(i);
      String associationName = pointer["name"];
      if (associationName == name) {
        return i;
      }
    }
    return -1;
  }
   
  int getMemberPosition(String email) {
    for (int i = 0; i < members.length; i++) {
      Map pointer = members.elementAt(i);
      String memberEmail = pointer["email"];
      if (memberEmail == email) {
        return i;
      }
    }
    return -1;
  }
  
  int getMemberAssociationPosition(String email, String associationName) {
    for (int i = 0; i < members.length; i++) {
      Map pointer = members.elementAt(i);
      String memberEmail = pointer["email"];
      String memberAssociationName = pointer["associationName"];
      if (memberEmail == email && memberAssociationName == associationName) {
        return i;
      }
    }
    return -1;
  }
  
  void printClass() {
    for (int i = 0; i < associations.length; i++) {
      Map pointer = associations.elementAt(i);
      print(pointer);
    }
    
    for (int i = 0; i < members.length; i++) {
      Map pointer = members.elementAt(i);
      print(pointer);
    }
  }

}

/***********************/
/* Function for ex08_4 */
/***********************/

class Coordinate {
  
  int startX;
  int startY;
  int endX;
  int endY;
  
  Coordinate(this.startX, this.startY, this.endX, this.endY);
  
  void printClass() {
    print("($startX, $startY) to ($endX, $endY)");
  }
}

List findGroupOfOnes(List matrix) {
 
  List returnList = new List();
  int matrixHeight = matrix.length;
  int matrixLength = matrix.elementAt(0).length;
  
  //find horizontal groups of 1
  for (int y = 0; y < matrixHeight; y++) {
    List horizontalList = matrix.elementAt(y);
    bool found = false;
    int startX = 0;
    int endX = 0;
    for (int x = 0; x < matrixLength; x++) {
      int number = horizontalList.elementAt(x);
      if (number == 1 && found == false) {
        startX = x;
        found = true;
      } else if (number == 0 && found == true) {
        endX = x - 1;
        found = false;
        if (endX > startX) {
          returnList.add(new Coordinate(startX, y, endX, y));
        }
      } else if (number == 1 && found == true && x == (matrixLength - 1)) {
        endX = x;
        found = false;
        if (endX > startX) {
          returnList.add(new Coordinate(startX, y, endX, y));
        }
      }
    }
  }
  
  //find vertical groups of 1
  for (int x = 0; x < matrixLength; x++) {
    bool found = false;
    int startY = 0;
    int endY = 0;
    for (int y = 0; y < matrixHeight; y++) {
      int number = matrix.elementAt(y).elementAt(x);
      if (number == 1 && found == false) {
        startY = y;
        found = true;
      } else if (number == 0 && found == true) {
        endY = y - 1;
        found = false;
        if (endY > startY) {
          returnList.add(new Coordinate(x, startY, x, endY));
        }
      } else if (number == 1 && found == true && y == (matrixHeight - 1)) {
        endY = y;
        found = false;
        if (endY > startY) {
          returnList.add(new Coordinate(x, startY, x, endY));
        }
      }
    }
  }
  
  return returnList;
  
}

/***********************/
/* Function for ex08_5 */
/***********************/

//See README.md for more information on ex08_5