import 'package:unittest/unittest.dart';
import 'ex08.dart';

main() {
  
  testAddAssociation();
  testAddMember();
  
  testRemoveAssociation();
  testRemoveMember();
  testRemoveMemberAssociation();
  
  testUpdateAssociationName();
  testUpdateAssociationDescription();
  
  testUpdateMemberEmail();
  testUpdateMemberFirstName();
  testUpdateMemberLastName();
  
}

AssociationMembers createClass() {
  
  AssociationMembers am = new AssociationMembers();
  
  am.addAssociation("Canadiens", "Club de hockey des Canadiens de Montréal");
  am.addAssociation("Flames", "Club de hockey des Flames de Calgary");
  am.addAssociation("Bruins", "Club de hockey des Bruins de Boston");
  
  am.addMember("Canadiens", "Jaroslav", "Halak", "jhalak@canadiens.com");
  am.addMember("Canadiens", "Tomas", "Plekanec", "tplekanec@canadiens.com");
  am.addMember("Canadiens", "Maxime", "Lapierre", "mlapierre@canadiens.com");
  am.addMember("Flames", "Michael", "Cammalleri", "mcammalleri@flames.com");
  am.addMember("Flames", "Shane", "OBrien", "sobrien@flames.com");
  am.addMember("Flames", "Tim", "Jackman", "tjackman@flames.com");
  am.addMember("Bruins", "Milan", "Lucic", "mlucic@bruins.com");
  am.addMember("Bruins", "Dennis", "Seidenberg", "dseidenberg@bruins.com");
  am.addMember("Bruins", "Brad", "Marchand", "bmarchand@bruins.com");
  
  return am;
}

testAddAssociation() {
  
  AssociationMembers am = createClass();
  
  test('test Add association valid', () {
    expect(am.addAssociation("Oilers", "Club de hockey des Oilers d'Edmonton"), equals(true));
    expect(am.getAssociationPosition("Oilers"), isNot(-1));
  });
  
  test('test Add association that already exists', () {
    expect(am.addAssociation("Flames", "Club de hockey des Flames de Calgary"), equals(false));
  });
}

testAddMember() {
  
  AssociationMembers am = createClass();

  test('test Add member valid', () {
    expect(am.addMember("Canadiens", "Carey", "Price", "cprice@canadiens.com"), equals(true));
    expect(am.getMemberPosition("cprice@canadiens.com"), isNot(-1));
  });
  
  test('test Add member whose association does not exist', () {
    expect(am.addMember("Stars", "Brad", "Marchand", "bmarchand@canadiens.com"), equals(false));
  });
  
  test('test Add member where member-association link already exists', () {
    expect(am.addMember("Canadiens", "Jaroslav", "Halak", "jhalak@canadiens.com"), equals(false));
  });
  
}

testRemoveAssociation() {
  
  AssociationMembers am = createClass();
  
  test('test Remove association valid', () {
    expect(am.removeAssociation("Canadiens"), equals(true));
    expect(am.getAssociationPosition("Canadiens"), equals(-1));
    expect(am.getMemberPosition("jhalak@canadiens.com"), equals(-1));
    expect(am.getMemberPosition("tplekanec@canadiens.com"), equals(-1));
    expect(am.getMemberPosition("mlapierre@canadiens.com"), equals(-1));
  });
  
  test('test Remove association that does not exist', () {
    expect(am.removeAssociation("Sabers"), equals(false));
  });
}

testRemoveMember() {
 
  AssociationMembers am = createClass();
  
  am.addMember("Flames", "Jaroslav", "Halak", "jhalak@canadiens.com");
  am.addMember("Bruins", "Jaroslav", "Halak", "jhalak@canadiens.com");
  
  test('test Remove member valid', () {
    expect(am.removeMember("jhalak@canadiens.com"), equals(true));
    expect(am.getMemberPosition("jhalak@canadiens.com"), equals(-1));
    expect(am.getMemberAssociationPosition("jhalak@canadiens.com", "Canadiens"), equals(-1));
    expect(am.getMemberAssociationPosition("jhalak@canadiens.com", "Flames"), equals(-1));
    expect(am.getMemberAssociationPosition("jhalak@canadiens.com", "Bruins"), equals(-1));
  });
  
  test('test Remove member that does not exist', () {
    expect(am.removeMember("cprice@canadiens.com"), equals(false));
  });
}

testRemoveMemberAssociation() {
  
  AssociationMembers am = createClass();
  
  test('test Remove member-association valid', () {
    expect(am.removeMemberAssociation("jhalak@canadiens.com", "Canadiens"), equals(true));
    expect(am.getMemberPosition("jhalak@canadiens.com"), equals(-1));
    expect(am.getMemberAssociationPosition("jhalak@canadiens.com", "Canadiens"), equals(-1));
  });
  
  test('test Remove member-association that does not exist', () {
    expect(am.removeMemberAssociation("tplekanec@canadiens.com", "Flames"), equals(false));
  });
}

testUpdateAssociationName() {
  
  AssociationMembers am = createClass();
  
  test('test Update association name valid', () {
    expect(am.updateAssociationName("Canadiens", "Nordiques"), equals(true));
  });
  
  test('test Update association that does not exist', () {
    expect(am.updateAssociationName("Stars", "Oilers"), equals(false));
  });
  
  test('test Update association whose new name already exists', () {
    expect(am.updateAssociationName("Stars", "Flames"), equals(false));
  });
}

testUpdateAssociationDescription() {
  
  AssociationMembers am = createClass();
  
  test('test Update association description valid', () {
    expect(am.updateAssociationDescription("Canadiens", "Canadiens hockey club"), equals(true));
  });
  
  test('test Update association description that does not exist', () {
    expect(am.updateAssociationDescription("Stars", "Dallas Stars hockey club"), equals(false));
  });
}

testUpdateMemberEmail() {
  
  AssociationMembers am = createClass();
  
  am.addMember("Flames", "Jaroslav", "Halak", "jhalak@canadiens.com");
  am.addMember("Bruins", "Jaroslav", "Halak", "jhalak@canadiens.com");
  
  test('test Update member email valid', () {
    expect(am.updateMemberEmail("jhalak@canadiens.com", "jaroslav@canadiens.com"), equals(true));
  });
  
  test('test Update member email that does not exist', () {
    expect(am.updateMemberEmail("cprice@canadiens.com", "carey@canadiens.com"), equals(false));
  });
  
  test('test Update member email whose new email already exists', () {
    expect(am.updateMemberEmail("sobrien@flames.com", "tjackman@flames.com"), equals(false));
  });
}

testUpdateMemberFirstName() {
  
  AssociationMembers am = createClass();
  
  am.addMember("Flames", "Jaroslav", "Halak", "jhalak@canadiens.com");
  am.addMember("Bruins", "Jaroslav", "Halak", "jhalak@canadiens.com");
  
  test('test Update member first name valid', () {
    expect(am.updateMemberFirstName("jhalak@canadiens.com", "Aroslav"), equals(true));
  });
  
  test('test Update member first name that does not exist', () {
    expect(am.updateMemberFirstName("cprice@canadiens.com", "Arey"), equals(false));
  });
}

testUpdateMemberLastName() {
  
  AssociationMembers am = createClass();
  
  am.addMember("Flames", "Jaroslav", "Halak", "jhalak@canadiens.com");
  am.addMember("Bruins", "Jaroslav", "Halak", "jhalak@canadiens.com");
  
  test('test Update member last name valid', () {
    expect(am.updateMemberLastName("jhalak@canadiens.com", "Alak"), equals(true));
  });
  
  test('test Update member last name that does not exist', () {
    expect(am.updateMemberLastName("cprice@canadiens.com", "Rice"), equals(false));
  });
}
