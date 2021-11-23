import 'package:flutter/material.dart';

class PersonModel extends ChangeNotifier {
  String lastName = "";
  String firstName = "";
  DateTime birthday = DateTime.now();
  String role = "";
  String email = "";
  String password = "";

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

  String get getLastName => lastName;
  String get getFirstName => firstName;
  DateTime get getBirthday => birthday;
  String get getRole => role;
  String get getEmail => email;
  String get getPassword => password;
}
