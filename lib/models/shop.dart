import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  String name = "";
  String idPhoto = "";
  String typeShop = "";

  Shop();

  void setDate({required name, required idPhoto, required typeShop}) {
    this.name = name;
    this.idPhoto = idPhoto;
    this.typeShop = typeShop;
    notifyListeners();
  }

  String get getName => name;
  String get getIdPhoto => idPhoto;
  String get getTypeShop => typeShop;
}
