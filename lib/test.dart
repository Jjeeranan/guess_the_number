void main() {
  var p = Person('Jeeranan', 'Saechua', 21);
  var p2 = Person('reqvor', 'reofur', 88);
  print(p.firstName.toString());
  print(p.lastName.toString());
  print(p2.age.toInt());
}
class Person{
  String firstName;
  String lastName;
  int age;

  Person(this.firstName, this.lastName, this.age);


}