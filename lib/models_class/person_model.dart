import 'package:flutter/material.dart';
import 'package:pineap/models/ModelProvider.dart';

class PersonModel extends ChangeNotifier {
  String lastName = "";
  String firstName = "";
  DateTime birthday = DateTime.now();
  String role = "";
  String email = "";
  String password = "";

  Person? _person;

  Person get getPerson {
    return _person!;
  }

  set setPerson(Person person) {
    _person = person;
  }

  PersonModel();

  @override
  String toString() {
    return " lastName : $lastName"
        " firstName : $firstName"
        " birthday : $birthday"
        " role : $role"
        " email : $email"
        " password : $password";
  }

  void setData({
    required String lastName,
    required String firstName,
    required DateTime birthday,
    required String role,
    required String email,
    required String password,
  }) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.birthday = birthday;
    this.role = role;
    this.email = email;
    this.password = password;

    notifyListeners();
  }

  void setDataWithOutNotify({
    required String lastName,
    required String firstName,
    required DateTime birthday,
    required String role,
    required String email,
    required String password,
  }) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.birthday = birthday;
    this.role = role;
    this.email = email;
    this.password = password;
  }

  void setDataWithPerson({required Person person}) {
    lastName = person.last_name;
    firstName = person.first_name;
    birthday = person.birthday!.getDateTimeInUtc();
    role = person.role;
    email = person.email;
    password = "";

    notifyListeners();
  }

  String get getLastName => lastName;
  String get getFirstName => firstName;
  DateTime get getBirthday => birthday;
  String get getRole => role;
  String get getEmail => email;
  String get getPassword => password;
}
