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


}
