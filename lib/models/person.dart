import 'package:flutter/material.dart';

class Person extends ChangeNotifier {
  String lastName = "";
  String firstName = "";
  String birthday = "";
  String role = "";
  String email = "";
  String password = "";

  Person();

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
    required String birthday,
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

  String get getLastName => lastName;
  String get getFirstName => firstName;
  String get getBirthday => birthday;
  String get getRole => role;
  String get getEmail => email;
  String get getPassword => password;
}
